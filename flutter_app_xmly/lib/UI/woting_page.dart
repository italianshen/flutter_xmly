import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/UI/sticky_tabBar_delegate.dart';
import 'package:flutter_app_xmly/UI/woting_widgets/woting_listen_list_page.dart';
import 'package:flutter_app_xmly/UI/woting_widgets/woting_recomend_list_page.dart';
import 'package:flutter_app_xmly/UI/woting_widgets/woting_subscribe_page.dart';
import 'package:flutter_app_xmly/main_providers/theme_model.dart';
import 'package:provider/provider.dart';

class WotingCustomPage extends StatefulWidget{
  @override
  _WotingCustomPageState createState() {
    // TODO: implement createState
    return _WotingCustomPageState();
  }
}

class _WotingCustomPageState extends State<WotingCustomPage>
    with SingleTickerProviderStateMixin{
  /// tabController
  TabController tabController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.tabController = TabController(length:3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("我听"),
        leading: Icon(Icons.mail),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(Icons.search),
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
                WotingSubscribePage(),
                WotingListenListPage(),
                WotingRecomendListPage()
              ])),
        ],
      )
    );
  }



  Widget _buildBanner() {
    double contentH = 120.0;
    return SliverToBoxAdapter(
      child: Container(
        color: Color(0xfff2f2f2),
        width: double.infinity,
        height: contentH,
        padding: EdgeInsets.only(bottom: 10.0),
        child: Container(
          color: Colors.white,
          child: WotingHeaderInfoView(),
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
                  child: Text("订阅"),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 45.0,
                  child: Text("一键听"),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 45.0,
                  child: Text("推荐"),
                )
              ])),
    );
  }
}



// 头部的视图
class WotingHeaderInfoView extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WotingHeaderInfoViewState();
  }
}


class _WotingHeaderInfoViewState extends State<WotingHeaderInfoView>{

  List<String> iconNames = ["images/download@2x.png","images/history@2x.png","images/shoppingcar@2x.png","images/like@2x.png"];

  List<String> titles = ["下载","历史","已购","喜欢"];

  List<String> numberTitles = ["暂无","8","暂无","25"];



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _createGirdView(context);
  }

  Widget _createGirdView(BuildContext context){
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),//去除gridView本身的滚动
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10.0,
            childAspectRatio: 3/5
        ),
        itemBuilder: _createGridViewItem,
        itemCount: 4,
    );

  }

  Widget _createGridViewItem(BuildContext context,int index){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 10.0,),
        Image.asset(iconNames[index],width: 40.0,height: 40.0,scale: 1.0,),
        SizedBox(height: 0.0,),
        Text(titles[index],style: TextStyle(
            fontSize: 15.0,
            color: Colors.grey
        ),),
        SizedBox(height: 7.0,),
        Text(numberTitles[index],style: TextStyle(
            fontSize: 13.0,
            color: Colors.grey
        ),)
      ],
    );
  }

}

