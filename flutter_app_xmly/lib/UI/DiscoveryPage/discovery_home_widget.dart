import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/UI/DiscoveryPage/interest_dub_page.dart';
import 'package:flutter_app_xmly/UI/image_browser_page/image_browser_page.dart';
import 'package:flutter_app_xmly/UI/sticky_tabBar_delegate.dart';
import 'package:flutter_app_xmly/UI/woting_widgets/woting_one_key_listen_item.dart';
import 'dart:convert';
import 'package:flutter_app_xmly/Model/discover_page_models/discovery_activity_model.dart';
import 'package:flutter_app_xmly/main_providers/theme_model.dart';
import 'package:provider/provider.dart';


class DiscoveryPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DiscoveryPageState();
  }
}

class _DiscoveryPageState extends State<DiscoveryPage>
    with SingleTickerProviderStateMixin{

  /// tabController
  TabController tabController;

  // 数据
  List<Map<String,dynamic>> dataSource = new List();

  // 本地模型数据源
  List<DiscoverActivityModel> dataArray = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.tabController = TabController(length:3, vsync: this);

  }


  /// 初始化listViewItem
  Widget _createListViewItem(BuildContext context,int index){

    DiscoverActivityModel model = dataArray[index];
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _createUserInfoView(model.avatar, model.nickName),
          _createActivityContent(model.content),
          _createPhotosView(model.images),
          _createFunctionView(
              model.time,
              model.likeCount.toString(),
              model.commentCount.toString()
          ),
          Container(
            padding: EdgeInsets.only(left:15.0),
            color:Color(0xffdedede) ,
            height: 1.0,
          )
        ],
      ),
    );
  }

  /// 创建人物信息栏
  Widget _createUserInfoView(String avatar,String nickName){
    return new Container(
      height: 60,
      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10.0,bottom: 10.0),
      child: new Row(
        children: <Widget>[
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(avatar),
              ),
            ),
          ),
          Expanded(
              child: Text(nickName)
          )
        ],
      ),
    );
  }

  /// 创建动态文字栏
  Widget _createActivityContent(String content){
    return new Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: 15.0,right: 15.0,bottom: 10.0),
      child: Text(content,style: TextStyle(
        fontSize: 14.0,
        color: Color(0xff333333)
      ),)
    );
  }

  /// 创建网格视图
  Widget _createPhotosView(List<String> images){
    double screenWidth = MediaQuery.of(context).size.width;
    double itemMargin = 5.0;
    double leftMargin = 15.0;
    double itemWidth = (screenWidth - 2.0 * leftMargin - 2.0 * itemMargin)/3.0;
    int rowCount = (images.length  + 2) ~/3;
    double contentViewHeight = itemWidth * rowCount + (rowCount - 1) * itemMargin;
    return new Container(
      alignment: Alignment.topLeft,
      height: contentViewHeight,
      padding: EdgeInsets.only(left: 15.0,right: 15.0),
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),//去除gridView本身的滚动
          itemCount: images.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: itemMargin,
              crossAxisSpacing: itemMargin,
              childAspectRatio: 1.0
          ),
          itemBuilder: (BuildContext context,int index){
            return InkWell(
              onTap: (){
                print("😂点击了图片$index");
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return new PhotoViewGalleryScreen(images: images,index: index,);
                }));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  image: images[index],
                  placeholder: "images/placeholder.jpeg"/* 占位图片 */,
                ),
              ),
            );
          }),
    );
  }

  /// 创建底部工具栏
  Widget _createFunctionView(String time,String likeCount,String commentCount){
    return new Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(left: 15.0,right: 15.0,bottom: 10.0),
        child: new Row(
          children: <Widget>[
            Expanded(
                flex:5,
                child: Text(time,style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 13.0
                ),)
            ),

            Expanded(
                flex:3,
                child: FlatButton.icon(
                    onPressed: (){
                      print("点击了按钮");
                    },
                    icon: Image.asset(
                        "images/dianzan.png",
                        width: 20.0,
                        height: 20.0,
                    ),
                    label: Text(likeCount,style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.grey[600]
                    ),)
                )
            ),

            Expanded(
                flex:3,
                child: FlatButton.icon(
                    onPressed: (){
                      print("点击了按钮");
                    },
                    icon: Image.asset(
                        "images/pinglun.png",
                        width: 20.0,
                        height: 20.0,
                    ),
                    label: Text(commentCount,style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.grey[600]
                    ))
                )
            ),
          ],
        ),);
  }

  /// 初始化动态视图
  Widget _createActivityView(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('config/activities.json'),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            String memberListJson = snapshot.data;
            List<dynamic> list = json.decode(memberListJson);
            dataArray = list.map((temp) => DiscoverActivityModel.fromJson(temp)).toList();
            return ListView.builder(
                itemCount: dataArray.length,
                itemBuilder: _createListViewItem);
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("发现"),
          leading: Icon(Icons.mail),
          actions: <Widget>[
            GestureDetector(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(Icons.search),
              ),
            )
          ],
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            _buildBanner(),
            _buildStickyBar(context),
            SliverFillRemaining(
                child: TabBarView(
                    controller: tabController,
                    children: <Widget>[
                      _createActivityView(context),
                      _buildListForOneKeyListenContent(),
                      DiscoverInterestDubPage()
                    ])),
          ],
        )
    );
  }



  Widget _buildBanner() {
    double contentH = 190.0;
    return SliverToBoxAdapter(
      child: Container(
        color: Color(0xfff2f2f2),
        width: double.infinity,
        height: contentH,
        padding: EdgeInsets.only(bottom: 10.0),
        child: Container(
          color: Colors.white,
          child: DiscoverHeaderInfoView(),
        ),
      ),
    );
  }

  Widget _buildStickyBar(BuildContext context) {
    ThemeModel model = Provider.of<ThemeModel>(context);
    return SliverPersistentHeader(
      pinned: true, //是否固定在顶部
      floating: true,
      delegate: StikcyTabBarDelegate(
          minHeight: 50, //收起的高度
          maxHeight: 50, //展开的最大高度
          child: TabBar(
            indicatorColor: model.getCurrentThemeColor(),
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Color(0xff999999),
              controller: tabController,
              tabs: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: 45.0,
                  child: Text("关注动态"),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 45.0,
                  child: Text("推荐动态"),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 45.0,
                  child: Text("趣配音"),
                )
              ])),
    );
  }


  /// 一键听
  Widget _buildListForOneKeyListenContent() {
    return ListView.builder(
        itemCount: 3,
        itemExtent: 120.0,
        itemBuilder: (BuildContext context,int index){
          return WotingOneKeyListenItem(
              "http://fdfs.xmcdn.com/group60/M03/09/4F/wKgLb12d3KOzrM-RAAHt3fjseh8541.jpg",
              "头条快报",
              "春运结束前，预计还有1.6亿人返城"
          );
        });
  }

}

// 头部的视图
class DiscoverHeaderInfoView extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DiscoverHeaderInfoViewState();
  }
}


class _DiscoverHeaderInfoViewState extends State<DiscoverHeaderInfoView>{

  List<String> iconNames = [
    "images/dianzishucheng@2x.png",
    "images/quanminglangdu@2x.png",
    "images/dakazhubo@2x.png",
    "images/huodong@2x.png",
    "images/zhiboweike@2x.png",
    "images/tingdan@2x.png",
    "images/youxizhongxin@2x.png",
    "images/biantingbiankan@2x.png",
    "images/shangcheng@2x.png",
    "images/ling_yuan_buy@2x.png"
  ];

  List<String> titles = ["电子书城","全民朗读","大咖主播","活动","直播微课","听单","游戏中心","边听边看","商城","0元购"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _createGirdView(context);
  }

  Widget _createGirdView(BuildContext context){
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),//去除gridView本身的滚动
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        childAspectRatio: 11/12
      ),
      itemBuilder: _createGridViewItem,
      itemCount: iconNames.length,
    );

  }

  Widget _createGridViewItem(BuildContext context,int index){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 10.0,),
        Image.asset(iconNames[index],width: 45.0,height: 45.0,scale: 1.0,),
        SizedBox(height: 10.0,),
        Container(
          height: 17.0,
          child: Text(
            titles[index],style: TextStyle(
              fontSize: 13.0,
              color: Colors.black
          ),),
        ),
      ],
    );
  }
}
