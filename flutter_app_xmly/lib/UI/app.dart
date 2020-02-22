import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/UI/woting_page.dart';
import 'package:flutter_app_xmly/main_providers/theme_model.dart';
import 'package:provider/provider.dart';
import 'DiscoveryPage/discovery_home_widget.dart';
import 'MinePages/mine_home_page.dart';
import 'home.dart';

class AppPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppPageState();
  }
}

class _AppPageState extends State<AppPage> with AutomaticKeepAliveClientMixin{

  // 当前索引号
  var currentIndex = 0;

  // 首页
  HomePage home;
  // 我听
  WotingCustomPage woting;
  // 发现
  DiscoveryPage discover;
  // 我的
  MineHomePage mine;

  @override
  bool get wantKeepAlive => true;




  List<BottomNavigationBarItem> tabBarItems(Color themeColor){
    return [
      new BottomNavigationBarItem(
          icon: Image.asset(
              currentIndex == 0
              ? "images/home_1.png"
              : "images/home.png",
            color: currentIndex == 0
                ? themeColor
                : Color(0xFF999999),),
          title: new Text('首页',
            style: TextStyle(
            color: currentIndex == 0
                ? themeColor
                : Color(0xFF999999)
          ),)
      ),

      new BottomNavigationBarItem(
          icon: Image.asset(
            currentIndex == 1
              ? "images/find_1.png"
              : "images/find.png",
            color: currentIndex == 1
              ? themeColor
              : Color(0xFF999999),),
          title: new Text('我听',
              style: TextStyle(
              color: currentIndex == 1
                   ? themeColor
                   : Color(0xFF999999)
          ))
      ),

      new BottomNavigationBarItem(
          icon: Image.asset(
            currentIndex == 2
                ? "images/favor_1.png"
                : "images/favor.png",
            color: currentIndex == 2
                ? themeColor
                : Color(0xFF999999),width: 23,height: 23,),
          title: new Text('发现',
              style: TextStyle(
              color: currentIndex == 2
                  ? themeColor
                  : Color(0xFF999999)
                ))
          ),

          new BottomNavigationBarItem(
          icon: Image.asset(
            currentIndex == 3
                ? "images/me_1.png"
                : "images/me.png",
            color: currentIndex == 3
                ? themeColor
                : Color(0xFF999999),),
          title: new Text('我的',
              style: TextStyle(
                  color: currentIndex == 3
                      ? themeColor
                      : Color(0xFF999999)
    ))
      )
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget currentPage(){
    switch (currentIndex) {
      case 0:
        if (home == null){
          home = HomePage();
        }
        return home;

      case 1:
        if (woting == null){
          woting = WotingCustomPage();
        }
        return woting;
      case 2:
        if (discover == null){
          discover = DiscoveryPage();
        }
        return discover;
      case 3:
        if (mine == null){
          mine = MineHomePage();
        }
        return mine;
      default:
        return Container();
    }
  }

  Widget currentTitle() {
    switch (currentIndex) {
      case 0:
        return Text('首页');
      case 1:
        return Text('我听');
      case 2:
        return Text('发现');
      case 3:
        return Text('我的');
      default:
        return Container();
    }
  }



  @override
  Widget build(BuildContext context) {
    ThemeModel model = Provider.of<ThemeModel>(context);
    return Scaffold(
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFFFFFFFF),
          items: tabBarItems(model.getCurrentThemeColor()),
          unselectedItemColor: Color(0xF999999),
          selectedItemColor: model.getCurrentThemeColor(),
          unselectedIconTheme: IconThemeData(color: model.getCurrentThemeColor()),
          selectedIconTheme: IconThemeData(color: model.getCurrentThemeColor()),
          currentIndex: currentIndex,
          elevation: 0,
          iconSize: 32.0,
          onTap: (index){
            setState(() {
              currentIndex = index;
            });
          },
      ) ,
      body: currentPage(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: model.getCurrentThemeColor(),
         child: Icon(Icons.play_arrow,size: 36,),
          onPressed: (){
          debugPrint("加号按钮被点击了");
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
