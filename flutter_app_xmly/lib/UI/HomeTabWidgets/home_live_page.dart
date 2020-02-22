import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/Model/home_live_models/home_live_gridview_list_model.dart';
import 'package:flutter_app_xmly/Model/home_live_models/home_live_rank_loop_model.dart';

import 'home_recomend_widgets/live_widgets/home_live_gridview_item_view.dart';
import 'home_recomend_widgets/live_widgets/home_live_rank_item.dart';
import 'home_recomend_widgets/live_widgets/hot_header_view.dart';
import 'home_recomend_widgets/live_widgets/live_banner_view.dart';
import 'dart:convert';

class HomeLivePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeLivePageState();
  }
}

class _HomeLivePageState extends State<HomeLivePage> with AutomaticKeepAliveClientMixin{

  List<IconData> _icons = [];// 保存Icon数据
  
  List<String> _imageList = [];

  List<HomeLiveRankLoopModel> dataSource = new List();

  /// 本地的字符串
  List<String> results = new List();
  /// 直播列表的数据源
  List<HomeLiveGridViewListModel> liveDataSource = new List();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  bool get wantKeepAlive => true;

  
  // 获取当前索引的颜色
  Color getColor(int index){
    if (index % 4 == 0){
      return Colors.red;
    }else if (index % 4 == 1){
      return Colors.green;
    }else if (index % 4 == 2){
      return Colors.orange;
    }else{
      return Colors.brown;
    }
  }

  // 获取网页地址
  @override
  Widget build(BuildContext context) {
//    return _featchDataThenLoadView();
    return _featchDataThenLoadView();
  }

  // 构建
  Widget _createBannderView(){
    return HomeLiveBannerWidget();
  }
  /// 头部
  Widget _createHomeLiveHeaderView(){
    return HotHeaderView();
  }

  /// 获取所有数据然后加载页面
  Widget _loadDataThenBuildView(){
    FutureBuilder(
        future: _loadData(),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            Map responseJson = json.decode(snapshot.data.toString());
            Map dataMap = responseJson["data"];
            List multidimensionalRankVos = dataMap["multidimensionalRankVos"];
            List<HomeLiveRankLoopModel> dataArray = new List();
            multidimensionalRankVos.forEach((temp){
              dataArray.add(HomeLiveRankLoopModel.fromJson(temp));
            });
            dataSource = dataArray;
            return _createLiveContentView();
          }else{
            return CircularProgressIndicator();
          }
        }
    );
  }

  /// 创建滚动排名组件 HomeLiveRankListPage  HomeLiveRankLoopModel
  Widget _featchDataThenLoadView(){
    // config/home_live_rank_list_data.json
    return FutureBuilder(
        future: _loadData(),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            return _createLiveContentView();
          }else{
            return CircularProgressIndicator();
          }
        }
    );
  }

  /// 多个等待以后构建页面
  /// 加载ranklist
  Future<String> _getHomeRankDataRequest() async {
    return DefaultAssetBundle.of(context).loadString("config/home_live_rank_list_data.json");
  }

  /// 加载直播数据
  Future<String> _getLiveDataRequest() async {
    return DefaultAssetBundle.of(context).loadString("config/home_live_data.json");
  }

  /// 解析rankListModel
  /// 解析json数组到模型

  _parseResultsToModelArray(){
    _parseRankJsonToModel();
    _parseLiveDataJsonToModel();
  }
  /// //
  _parseRankJsonToModel(){
    String rankJsonStr = this.results.first;
    Map responseJson = json.decode(rankJsonStr);
    Map dataMap = responseJson["data"];
    List multidimensionalRankVos = dataMap["multidimensionalRankVos"];
    List<HomeLiveRankLoopModel> dataArray = new List();
    multidimensionalRankVos.forEach((temp){
      dataArray.add(HomeLiveRankLoopModel.fromJson(temp));
    });
    dataSource = dataArray;
  }

  _parseLiveDataJsonToModel(){
    String liveJsonStr = this.results.last;
    Map responseJson = json.decode(liveJsonStr);
    Map dataMap = responseJson["data"];
    List livesList = dataMap["lives"];
    List<HomeLiveGridViewListModel> dataArray = new List();
    livesList.forEach((temp){
      dataArray.add(HomeLiveGridViewListModel.fromJson(temp));
    });
    liveDataSource = dataArray;
  }

  Future _loadData() async {
    Future.wait([
      _getHomeRankDataRequest(),
      _getLiveDataRequest()
    ]).then((results){
      this.results = results;
      _parseResultsToModelArray();
      return results;
    }).catchError((error){

      String errMsg = error.toString();
      print("加载失败$errMsg");
      List<String> resultsArr = new List();
      return errMsg;//返回空
    });
  }



  Widget _createLiveContentView(){
    double itemWidth = (MediaQuery.of(context).size.width - (3 * 4.0))/4.0;
    double screenW = MediaQuery.of(context).size.width;
    double bannerH = screenW * 110/345;
    return  Container(
      padding: EdgeInsets.only(left: 15.0,right: 15.0),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 90.0,
              color: Colors.white,
              child: _createHomeLiveHeaderView(),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              height: bannerH,
              margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: _createBannderView(),
              ),
            ),
          ),
          /// 排行榜部分
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(bottom: 10.0),
              color: Colors.white,
              height: bannerH,
              child: HomeLiveRankListPage(dataSource),
            ),
          ),

          SliverGrid(
              delegate: SliverChildBuilderDelegate((BuildContext context,int index){
                HomeLiveGridViewListModel model = this.liveDataSource[index];
                return HomeLiveGridViewItem(model.coverLarge,
                    model.name, model.nickname, model.categoryName);
              },
                  childCount: this.liveDataSource.length
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: ((screenW - 40)/2.0)/240.0
              )
          ),
        ],
      ),
    );
  }


  /// 创建listViewItem
  Widget buildListViewItem(int index){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15.0,right: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            color: Colors.white,
            child: Image.asset("images/loading.jpg",fit: BoxFit.fill,),
          ),
          Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 12.0,right: 0.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("广东珠江经济电台广东珠江经济电台"),
                    Text("正在直播：拉阔星空广东珠江经济"),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Image.asset("images/ji.png"),
                          Text("525.8万"),
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Container(
            margin: EdgeInsets.only(right: 0.0,left: 15.0),
            child: Icon(Icons.play_arrow,size: 35.0,color: Colors.grey,),
          )
        ],
      ),
    );
  }



}