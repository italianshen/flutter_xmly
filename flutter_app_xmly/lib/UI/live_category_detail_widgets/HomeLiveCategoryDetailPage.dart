import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/API/HomeApi.dart';
import 'package:flutter_app_xmly/Model/home_live_models/live_category_detail_entity.dart';
import 'package:flutter_app_xmly/UI/HomeTabWidgets/home_recomend_widgets/live_widgets/home_live_gridview_item_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeLiveCategoryDetailPage extends StatefulWidget{

  /// 频道id
  int channelId;

  /// 标题
  String title;

 /// 构造方法
  HomeLiveCategoryDetailPage(this.channelId,this.title);

  @override
  _HomeLiveCategoryDetailPageState createState() {
    // TODO: implement createState
    return _HomeLiveCategoryDetailPageState();
  }
}

class _HomeLiveCategoryDetailPageState extends State<HomeLiveCategoryDetailPage>  with AutomaticKeepAliveClientMixin{


  /// 首页网络请求工具类
  HomeApi _homeApi = HomeApi();

  /// 直播数据源
  List<LiveCategoryDetailDataHomepagevoLife> dataSource = new List();

  /// 当前页码
  int _page = 1;

  // 刷新控制器
  RefreshController _refreshController = new RefreshController(initialRefresh: true);

  // 滚动控制器
  ScrollController _scrollController = new ScrollController();



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

  /// 获取新数据
  Future getNewData() async {
    _page = 1;
    _homeApi.requestLiveCategoryDetailList(_page, widget.channelId, (responseJson){
      Map map = new Map.from(responseJson);
      Map dataMap = map["data"];
      debugPrint("返回的数据:$responseJson==data:${dataMap}===homePageVo:${dataMap["homePageVo"]}");

      if(dataMap["homePageVo"] == null){
        // 数据错误
        print("数据错误");
        Fluttertoast.showToast(msg: " request failed cause homePageVo is null");
        _refreshController.refreshCompleted(resetFooterState: true);
        _refreshController.loadNoData();
      }else{
        LiveCategoryDetailEntity entity = LiveCategoryDetailEntity.fromJson(responseJson);
        _refreshController.refreshCompleted(resetFooterState: true);
        setState(() {
          dataSource.clear();
          dataSource.addAll(entity.data.homePageVo.lives);
        });
      }
    }, (error){
      print("error:${error.toString()}");
      Fluttertoast.showToast(msg: error);
    });
  }


  /// 获取更多数据
  Future getMoreData() async{
    _page ++;
    _homeApi.requestLiveCategoryDetailList(_page, widget.channelId, (responseJson){
      debugPrint("返回的数据:$responseJson");
      Map map = new Map.from(responseJson);
      Map dataMap = map["data"];
      debugPrint("返回的数据:$responseJson==data:${dataMap}===homePageVo:${dataMap["homePageVo"]}");
      LiveCategoryDetailEntity entity = LiveCategoryDetailEntity.fromJson(responseJson);
      // 判断有没有对应的字段
      if(dataMap["homePageVo"] == null){
        // 数据错误
        print("数据错误");
        Fluttertoast.showToast(msg: "request failed cause homePageVo is null");
        _refreshController.refreshCompleted(resetFooterState: true);
        _refreshController.loadNoData();
      }else{
        _refreshController.refreshCompleted(resetFooterState: true);
        List<LiveCategoryDetailDataHomepagevoLife> modelArr = new List();
        entity.data.homePageVo.lives.forEach((map){
          modelArr.add(map);
        });
        if(modelArr.length > 0){
          setState(() {
            dataSource.addAll(modelArr);
          });
        }else{
          _refreshController.loadNoData();
        }
      }
    }, (error){
      Fluttertoast.showToast(msg: error);
    });
  }


  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    double ratio = ((screenW - 40 - 30)/2.0)/230.0;
    return new Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: MaterialClassicHeader(),
          controller: _refreshController,
          onRefresh: getNewData,
          onLoading: getMoreData,
          child: Container(padding: EdgeInsets.only(
              top: 10.0,
              left: 15.0,
              right: 15.0,),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: ratio,
                    mainAxisSpacing: 0.0,
                    crossAxisSpacing: 10.0
                ),
                itemBuilder: _createListViewItem,
                itemCount: dataSource.length,
              ),
          ),
        )
    );
  }

  Widget _createListViewItem(BuildContext context,int index){
    LiveCategoryDetailDataHomepagevoLife model = this.dataSource[index];
    return HomeLiveGridViewItem(model.coverLarge,
        model.name, model.nickname, model.categoryName);
  }

  @override
  bool get wantKeepAlive => true;
}