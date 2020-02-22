import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/API/HomeApi.dart';
import 'package:flutter_app_xmly/Model/play_detail_models/play_detail_entity.dart';
import 'dart:convert';

import 'package:flutter_app_xmly/UI/play_detail_widgets/play_detail_intro_page.dart';
import 'package:flutter_app_xmly/UI/play_detail_widgets/play_detail_look_similar_page.dart';
import 'package:flutter_app_xmly/UI/play_detail_widgets/play_detail_program_page.dart';
import 'package:flutter_app_xmly/Utils/TimeUtil.dart';
import 'package:flutter_app_xmly/main_providers/theme_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

const url =
    'http://imagev2.xmcdn.com/group36/M02/54/F1/wKgJTVpD8f6Shdb6AADoFe33Y5k078.jpg!op_type=3&columns=640&rows=640';

class PlayDetailPage extends StatefulWidget{
  /// 频道id
  int channelId;
  /// 图片路径
  String cover;
  /// 标题 - 评书杨家将传
  String title;
  /// 副标题 - 楼兰梵音
  String subTitle;
  /// 更新时间
  int updateTime;


  /// 构造方法
  PlayDetailPage(
      this.channelId,
      this.cover,
      this.title,
      this.subTitle,
      this.updateTime);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlayDetailPageState();
  }
}

class _PlayDetailPageState extends State<PlayDetailPage> with AutomaticKeepAliveClientMixin,SingleTickerProviderStateMixin{
  var tabTitle = [
    '简介',
    '节目',
    '找相似',
  ];

  HomeApi _homeApi;
  
  ScrollController _scrollController;

  TabController _tabController;

  double opacity = 1.0;
  /// 当前tab的索引
  int currentIndex = 0;
  /// 服务器数据模型
  PlayDetailEntity entity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabTitle.length, vsync: this);
    _scrollController = ScrollController(initialScrollOffset: 0);
    _scrollController.addListener((){
      debugPrint("offset:${_scrollController.offset}");
      // 计算alpha offset 越大 alpha越小
      setState(() {
        if(_scrollController.offset >= 240.0){
          setState(() {
            opacity = 0.0;
          });
        }else{
          setState(() {
            opacity = (240.0 - _scrollController.offset)/240.0;
          });
        }
      });
    });
    _homeApi = HomeApi();
    // 获取数据
    _homeApi.requestAlbumPlayDetailData(widget.channelId, (responseJson){
        Map map = new Map.from(responseJson);
        print("responseJson:${responseJson.toString()}");
        this.entity = PlayDetailEntity.fromJson(responseJson);
        if(this.mounted){
          print("分类名称>>>${this.entity.data.album.categoryName}");
          setState(() {
            widget.updateTime =  this.entity.data.album.lastUptrackAt;
          });
        }
    }, (error){
      debugPrint("接口请求失败:$error");
    });

  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    ThemeModel model = Provider.of<ThemeModel>(context);
    return new DefaultTabController(
        length: tabTitle.length,
        child: Scaffold(
          body: new NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, bool) {
              return [
                SliverAppBar(
                  expandedHeight: 240.0,
                  floating: true,
                  pinned: true,
                  leading: InkWell(
                    child: Icon(Icons.arrow_back_ios,color: (opacity == 0.0 ? Color(0xff333333) : model.getCurrentThemeColor().withOpacity(this.opacity)),),
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                  ),
                  actions: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 15.0),
                      child: InkWell(
                        child: Icon(Icons.more_horiz,color: (opacity == 0.0 ? Color(0xff333333) : model.getCurrentThemeColor().withOpacity(this.opacity)),),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 15.0),
                      child: InkWell(
                        child: Icon(Icons.share,color: (opacity == 0.0 ? Color(0xff333333) : model.getCurrentThemeColor().withOpacity(this.opacity)),),
                      ),
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(opacity == 0 ? widget.title.substring(0,widget.title.length > 10 ? 10 : widget.title.length) : "",maxLines: 1,overflow: TextOverflow.ellipsis,),
                      background: Container(
                        height: 240,
                        child: Stack(
                          children: <Widget>[
                            Image.network(
                              widget.cover,
                              fit: BoxFit.cover,
                              height: 240.0,
                              width: MediaQuery.of(context).size.width,
                            ),
                            ClipRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 7.0),
                                child: Opacity(opacity: 0.2,child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200
                                  ),
                                ),),
                              ),
                            ),
                            Positioned(child: Container(
                              width: 120,
                              height: 146,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                child: Image.network(widget.cover,fit: BoxFit.cover,),
                              ),
                            ),
                              left: 15.0,
                              bottom: 15.0,
                            ),
                            Positioned(
                              child: Container(
                              child: Text(widget.title,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0
                              ),),
                            ),
                              left: 142.0,
                              bottom: 100.0,
                              right: 15.0,
                            ),
                            Positioned(child: Container(
                              child: Text(widget.subTitle,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0
                              ),),
                            ),
                              left: 142.0,
                              bottom: 75.0,
                              right: 15.0,
                            ),
                            Positioned(child: Container(
                              child: Text("${this.entity == null ? "loading category name" : this.entity.data.album.categoryName}>",style: TextStyle(
                                  color: Color(0xff999999),
                                  fontSize: 18.0
                              ),),
                            ),
                              left: 142.0,
                              bottom: 45.0,
                            ),
                            Positioned(child: Container(
//                              color: Colors.white,
                              child: Text(
                                "${TimeUtil.parseTimeStampToShowTime(widget.updateTime)}更新",
                                maxLines: 1,
                                style: TextStyle(
                                  color: Color(0xff999999),
                                  fontSize: 14.0
                              ),),
                            ),
                              left: 142.0,
                              bottom: 15.0,
                              right: 72.0,
                            ),
                            Positioned(child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(217, 74, 56, 1),
                                  borderRadius: BorderRadius.all(Radius.circular(17.0))
                              ),
                              height: 34.0,
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(left: 8.0,right: 8.0),
                              child:Text("+ 订阅",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0
                              ),),
                            ),
                              right: 15.0,
                              bottom: 15.0,
                            )
                          ],
                        ),
                      )
                  ),
                ),
                new SliverPersistentHeader(
                  delegate: new SliverTabBarDelegate(
                    new TabBar(
                      tabs: tabTitle.map((f) => Tab(text: f)).toList(),
                      controller: _tabController,
                      indicatorColor: model.getCurrentThemeColor(),
                      unselectedLabelColor: Color(0xff999999),
                      labelColor: model.getCurrentThemeColor(),
                      indicatorSize: TabBarIndicatorSize.label,
                      onTap: (index){
                        setState(() {
                          currentIndex = index;
                          print("currentIndex:${currentIndex}");
                        });
                      },
                    ),
                    color: Colors.white,
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                PlayDetailIntroPage(
                    this.entity != null
                        ? this.entity.data.album.intro
                        : "正在加载中",
                    this.entity != null
                        ? this.entity.data.user.smallLogo
                        : ""
                    , this.entity != null
                    ? this.entity.data.user.personalSignature
                    : "", this.entity != null
                    ? "已有${this.entity.data.user.followers.toString()}关注"
                    : "..."),
                this.entity == null
                    ? Center(child: CircularProgressIndicator())
                    : PlayDetailProgramPage(this.entity),
                PlayDetailLookSimilarPage()
              ],
            ),
          ),
        ));
  }


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar widget;
  final Color color;

  const SliverTabBarDelegate(this.widget, {this.color})
      : assert(widget != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: widget,
      color: color,
    );
  }

  @override
  bool shouldRebuild(SliverTabBarDelegate oldDelegate) {
    return false;
  }

  @override
  double get maxExtent => widget.preferredSize.height;

  @override
  double get minExtent => widget.preferredSize.height;
}
