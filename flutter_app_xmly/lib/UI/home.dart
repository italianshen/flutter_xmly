import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/UI/HomeTabWidgets/broad_cast_page.dart';
import 'package:flutter_app_xmly/UI/HomeTabWidgets/recommentation_lis_page.dart';
import 'package:flutter_app_xmly/main_providers/theme_model.dart';
import 'package:provider/provider.dart';

import 'HomeTabWidgets/home_category_page.dart';
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

  // 根据标题或者索引去获取对应的widget
  int currentTabIndex = 0;

  @override
  bool get wantKeepAlive => true;

  Widget getCurrentPage(){
    if(currentTabIndex == 4){
       return HomeBroadCastPage();
    }else if (currentTabIndex == 0){
       return HomeRecommendPage();
    }else if (currentTabIndex == 1){
      return HomeClassifyListView();
    }else if (currentTabIndex == 3){
      return HomeLivePage();
    }else if (currentTabIndex == 2){
      return HomeVipPage();
    }
    else{
      return  Center(
        child: Text(_tabs[currentTabIndex]),
      );
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("🤣 开始初始化>>>>");
    _tabController = TabController(length: _tabs.length, vsync: this);
  }


  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeModel model = Provider.of<ThemeModel>(context);
    return Container(
      color: Colors.red,
      child: DefaultTabController(
          length: _tabs.length,
          child: Scaffold(
            appBar: AppBar(
              title: Text("首页"),
              bottom: TabBar(
                indicatorColor: model.getCurrentThemeColor(),
                  controller: _tabController,
                  tabs: _tabs.map((item) => Tab(text: item,)).toList(),
                  onTap: (index){
                    setState(() {
                      currentTabIndex = index;
                    });
                  },
              ),
            ),
            body: TabBarView(
                controller: _tabController,
                children: _tabs.map((item) => Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: getCurrentPage(),
                )).toList())
          )
      )
    );
  }
}
