import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/UI/HomeTabWidgets/broad_cast_page.dart';
import 'package:flutter_app_xmly/UI/HomeTabWidgets/recommentation_lis_page.dart';
import 'HomeTabWidgets/home_classify_list_view.dart';
import 'HomeTabWidgets/home_live_page.dart';
import 'dart:core';

import 'HomeTabWidgets/home_vip_widgets/home_vip_page.dart';

class HomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin{

  final List<String> _tabs = ["推荐","分类","VIP","直播","广播"];

  TabController _tabController;

  /// 推荐
  HomeRecommendPage homePage;
  /// 分类
  HomeClassifyListView classifyPage;
  /// vip
  HomeVipPage vipPage;
  /// live
  HomeLivePage livePage;

  /// 广播页
  HomeBroadCastPage broadCastPage;

  List<Widget> tabPages;

  // 根据标题或者索引去获取对应的widget
  int currentTabIndex = 0;

  @override
  bool get wantKeepAlive => true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("🤣 开始初始化>>>>");
    _tabController = TabController(length: _tabs.length, vsync: this);
    tabPages = new List();

    /// 推荐
    homePage = HomeRecommendPage();
    /// 分类
    classifyPage = HomeClassifyListView();
    /// vip
    vipPage = HomeVipPage();
    /// live
    livePage = HomeLivePage();
    /// 广播页
    broadCastPage = HomeBroadCastPage();
    tabPages.add(homePage);
    tabPages.add(classifyPage);
    tabPages.add(vipPage);
    tabPages.add(livePage);
    tabPages.add(broadCastPage);
  }


  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }


  /// 初始化tab
  Widget _initChannelTitle(){
    return TabBar(
        controller: _tabController,
        indicatorColor: Colors.white,
        tabs: _tabs.map((item) => Tab(text: item,)).toList()
    );
  }

  /// 初始化内容列表
  Widget _initChannelList(){
    return TabBarView(
      controller: _tabController,
        children: tabPages
    );
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
            appBar: AppBar(
              title: Text("首页"),
              bottom: _initChannelTitle(),
            ),
            body: _initChannelList()
        )
    );
  }
}
