import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/API/HomeApi.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_app_xmly/Model/BaseResponseModel.dart';
import 'package:flutter_app_xmly/UI/HomeTabWidgets/guess_you_like_list_item.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GuessYouLikeListPage extends StatefulWidget{
  @override
  _GuessYouLikeListPageState createState() => _GuessYouLikeListPageState();
}

class _GuessYouLikeListPageState extends State<GuessYouLikeListPage>
    with AutomaticKeepAliveClientMixin{

  // 数据源
  List<HomeGuessYouLikeListModel> dataSource = new List();

  // 当前页码
  int _page = 1;

  // 刷新控制器
  RefreshController _refreshController = new RefreshController(initialRefresh: true);

  // 滚动控制器
  ScrollController _scrollController = new ScrollController();

  // 首页网络请求工具类
  HomeApi _homeApi = HomeApi();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }




  @override
  void dispose() {
    _refreshController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getNewData();
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        getMoreData();
      }
    });

  }
  
  Future getNewData() async {
    _page = 1;
    _homeApi.requestGuessYouLikeListData(_page, (responseJson){
      debugPrint("返回的数据:$responseJson");
      BaseResponseModel model = BaseResponseModel.fromJson(responseJson);

      List<Map<String,dynamic>> listArr = new List<Map<String,dynamic>>.from(model.list);
//      debugPrint("🍏 返回的数据:$listArr");
      // 转换为模型
      List<HomeGuessYouLikeListModel> modelArr = new List();
      listArr.forEach((map){
        modelArr.add(HomeGuessYouLikeListModel.fromJson(map));
      });
      _refreshController.refreshCompleted(resetFooterState: true);
      setState(() {
        dataSource.clear();
        dataSource.addAll(modelArr);
      });
    }, (error){
      Fluttertoast.showToast(msg: error);
    });
  }


  Future getMoreData() async{
    _page ++;
    _homeApi.requestGuessYouLikeListData(_page, (responseJson){
      BaseResponseModel model = BaseResponseModel.fromJson(responseJson);
      List<Map<String,dynamic>> listArr = new List<Map<String,dynamic>>.from(model.list);
      debugPrint("🍏 返回的数据:$listArr");
      // 转换为模型
      List<HomeGuessYouLikeListModel> modelArr = new List();
      listArr.forEach((map){
        modelArr.add(HomeGuessYouLikeListModel.fromJson(map));
      });

      if(modelArr.length > 0){
        setState(() {
          dataSource.addAll(modelArr);
        });
      }else{
        _refreshController.loadNoData();
      }

    }, (error){
        _refreshController.loadFailed();
        Fluttertoast.showToast(msg: error);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("猜你喜欢"),
      ),
      body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: MaterialClassicHeader(),
          controller: _refreshController,
          onRefresh: getNewData,
          onLoading: getMoreData,
          child: ListView.builder(
              itemBuilder: itemView,
              controller: _scrollController,
              physics: new AlwaysScrollableScrollPhysics(),
              itemCount: dataSource.length,
          ),
      )
    );
  }

  Widget itemView(BuildContext context, int index) {
    return GuessYouLikeListItem(dataSource[index]);
  }

  @override
  bool get wantKeepAlive => true;
}