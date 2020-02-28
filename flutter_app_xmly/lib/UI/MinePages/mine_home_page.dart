import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/UI/MinePages/vip_animated_view.dart';
import 'package:flutter_app_xmly/main_providers/theme_model.dart';
import 'package:provider/provider.dart';
import 'MineItemWidget.dart';
import 'dart:math' as math;

class MineHomePage extends StatefulWidget{
  @override
  _MineHomePageState createState() => _MineHomePageState();
}

class _MineHomePageState extends State<MineHomePage> with TickerProviderStateMixin{

  /// 动画控制器
  AnimationController controller;
  /// Animation
  Animation<Offset> animation;

  // 数据源
  List<Map<String,dynamic>> dataSource = [];

  // 数据源
  List<Map<String,dynamic>> centerDataSource = [{"icon":"images/micphone@2x.png","title":"我要录音"},
  {"icon":"images/live@2x.png","title":"我要直播"},{"icon":"images/live@2x.png","title":"我的作品"},
  {"icon":"images/gongzuotai@3x.png","title":"主播工作台"}
  ];

  /// 头部gridView
  List<Map<String,dynamic>> headerDataSource = [{"icon":"","title":"已购","number":"10"},
  {"icon":"","title":"优惠券","number":"2"},{"icon":"","title":"喜点","number":"88"},
  {"icon":"","title":"直播喜钻","number":"66"},{"icon":"images/wallet@3x.png","title":"我的钱包","number":"88"}
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this);
    // 动画开始、结束、向前移动或向后移动监听
    controller.addStatusListener((status){
      if(status == AnimationStatus.completed){
        // 动画从controller.forward() 正向执行结束时调用
        print("status is completed");
        // 将动画重置到开始状态
        controller.reverse();
      }else if (status == AnimationStatus.dismissed){
        // 动画从controller.reverse()反向执行结束时会回调此方法
        print("status is dismissed");
        controller.forward();
      }else if (status == AnimationStatus.forward){
        print("status is forward");
      }else if (status == AnimationStatus.reverse){
        print("status is reverse");
      }
    });

    animation = Tween(begin: Offset(0, 0),end: Offset(0, 1)).animate(controller);
    /// 开始动画
    // controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }



  Widget buildHeaderInfoView(){
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 0,right: 15.0,top: 15.0,bottom: 0.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 0.0,left: 15.0),
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(50.0),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                        child:
                    Container(
                      padding: EdgeInsets.only(left: 10.0,top: 10.0),
                      width: double.infinity,
                      color: Colors.white,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Tom先生"),
                          SizedBox(height: 15.0,),
                          Expanded(
                            flex: 2,
                              child: Row(
                            children: <Widget>[
                              Text("粉丝 100万",style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.grey
                              ),),
                              SizedBox(width: 15.0,),
                              Text("关注 7",style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.grey
                              )),
                            ],
                          )),
                        ],
                      ),
                    )),
                    Expanded(
                      flex: 2,
                        child: buildSlideTransition()
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 10.0,),
            buildLastTimeView(),
            SizedBox(height: 10.0,),
            Divider(
              height: 1.0,
              color: Color(0xfafafa),
            )
          ],
        )
    );
  }


  /// 构造移动的会员版
  Widget buildSlideTransition(){
    return Container(
      child: SlideTransition(
        position: animation,
        child: MineVipAnimationView(),
      ),
    );
  }

  //构建头像视图
  Widget buildAvatarImageView(){

    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(50.0),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg",
          ),
        ),
      ),
    );
  }

  // 创建用户信息视图
  Widget buildUserNameInfoView(){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 12.0,top: 20.0,bottom: 10.0),
      padding: EdgeInsets.only(top: 20.0),
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
//          SizedBox(width: 15.0,),
          Text('Tom先生',style: TextStyle(
            color: Color(0xff333333),
            fontSize: 16.0
          ),),
          Expanded(
              child: Row(
                children: <Widget>[
                  Text('粉丝 100',style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 15.0
                  ),),
                  SizedBox(width: 20.0,),
                  Text('关注 7',style: TextStyle(
                      color: Color(0xff666666),
                      fontSize: 15.0
                  ),),
                ],
              ))
        ],
      ),
    );

  }

  Widget buildLastTimeView(){
    return Container(
      margin: EdgeInsets.only(left: 15,right: 15.0),
//设置 child 居中
      alignment: Alignment(0, 0),
      height: 36,
      width: 200,
//边框设置
      decoration: new BoxDecoration(
//背景
        color: Colors.white,
        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
        borderRadius: BorderRadius.all(Radius.circular(18.0)),
        //设置四周边框
        border: new Border.all(width: 0.5, color: Color(0xffDEDEDE)),
      ),
      child: Text("已听9分钟，满3小时解锁>",style: TextStyle(
        fontSize: 15,
        color: Colors.grey
      ),),
    );
  }

  Widget buildExpandItem(){
    return RaisedButton(
      padding: EdgeInsets.only(left: 20.0,right: 20.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
          side: BorderSide(color: Color(0xff999999),width: 0.5)
      ),
      color: Colors.white,
      elevation:0,
      highlightElevation:0,
      disabledElevation:0,
      onPressed: (){},
      child: Text('已听9分钟,满3小时解锁 >',
        style: TextStyle(
            color: Colors.grey,
            fontSize: 15.0
        ),),
    );
  }


  // 创建collectionView
  Widget buildMineGridItemView(){
    return Container(
      height: 100,
      color: Colors.white,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: headerDataSource.length,
              crossAxisSpacing: 0.0,
              childAspectRatio: 2/4
          ),
          itemCount: headerDataSource.length,
          itemBuilder: (BuildContext context,int index){
            Map<String,dynamic> dict = headerDataSource[index];
            return _layoutHeaderGridView(dict["title"], dict["icon"],dict["number"]);
          }),
    );
  }

  Widget _layoutHeaderGridView(String title,String icon,String number){
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            alignment: Alignment.center,
            width: 60,
            height: 60,
            child: icon.isEmpty
                ? Text(number,style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
              fontWeight: FontWeight.w400
            ),)
                : Image.asset(icon,scale: 1,width: 40,height: 40,),
          ),
          Container(
            color: Colors.white,
            height: 20,
            child: Text(title,style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),),
          )
        ],
      ),
    );
  }


  Widget buildHeaderGridView(){
    return Container(
       color: Colors.white,
        padding: EdgeInsets.only(left: 0.0,top: 0.0,right: 0.0),
        height: 90,
        width: double.infinity,
        child: buildMineGridItemView()
    );
  }

  Widget _buildCenterOptionView(){
    double itemWidth = (MediaQuery.of(context).size.width - 5.0 * 15.0)/4.0;
    double itemHeight = itemWidth * 13/14;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 0.0,right: 0.0),
      height: itemHeight,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: centerDataSource.length,
              crossAxisSpacing: 15.0,
              childAspectRatio: 14/13
          ),
          itemCount: 4,
          itemBuilder: (BuildContext context,int index){
            Map<String,dynamic> dict = centerDataSource[index];
            return _createGridViewItemView(dict["title"], dict["icon"]);
          }),
    );
  }



  Widget _createGridViewItemView(String title,String imageName){
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      color: Colors.white,
        child: Column(
          children: <Widget>[
            Image.asset(imageName,width: 40.0,height: 40.0,),
            SizedBox(height: 6.0,),
            Container(
              height: 18,
              child: Text(title,style: TextStyle(
                  color: (title == "我要录音" ? Color.fromRGBO(213, 54, 13, 1.0) : Color(0xff999999))
              ),),
            )
          ],
        ),
    );

  }


  @override
  Widget build(BuildContext context) {
    ThemeModel model = Provider.of<ThemeModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
        leading: GestureDetector(
          child: Icon(Icons.email),
          onTap: (){
            debugPrint("点击了邮箱");
          },
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 0.0),
            child: FlatButton(onPressed: (){
              debugPrint("点击了设置");
            }, child: Icon(Icons.settings),
          textColor: Colors.white,
        )
      )
//          SizedBox(width: 15.0,)
        ],
      ),
      body: Container(
        color: Color.fromRGBO(245, 245, 245, 1),
        child: ListView(
          children: <Widget>[
            buildHeaderInfoView(),
            buildHeaderGridView(),
            _listViewLine,
            _buildCenterOptionView(),
            _listViewLine,
            MineItemWidget("images/moneyMount@3x.png", "免费赚钱",onTap: (){
              debugPrint("免费赚钱");
            },),
            MineItemWidget("images/shalou@3x.png", "免流量服务",onTap: (){
              debugPrint("免流量服务");
            },),

            _listViewLine,
            MineItemWidget("images/scan@3x.png", "扫一扫",onTap: (){
              debugPrint("扫一扫");
            },),
            MineItemWidget("images/moon@3x.png", model.getModeTypeText(),onTap: (){
                model.reverseThemeType();
                //ThemeSettingPage
              Navigator.of(context).pushNamed("theme_setting");

            },),
            _listViewLine,
            MineItemWidget("images/advice@3x.png", "帮助与反馈",onTap: (){
              debugPrint("帮助与反馈");
            },),
          ],
        ),
      )
    );
  }


  // 分割线
  Widget get _listViewLine {
    return Container(
      color: Color(0xffeaeaea),
      height: 10,
    );
  }


}