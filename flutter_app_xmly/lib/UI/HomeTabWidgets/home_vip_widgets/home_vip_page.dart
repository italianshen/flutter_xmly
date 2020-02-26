import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/Model/home_vip_model/home_vip_entity.dart';
import 'package:flutter_app_xmly/UI/woting_widgets/woting_recomend_list_item.dart';
import 'dart:convert';

import 'home_vip_banner_view.dart';
import 'home_vip_grid_hot_view.dart';
import 'home_vip_guess_you_like_item.dart';
import 'home_vip_hot_play_list_item.dart';
class HomeVipPage extends StatefulWidget{

  @override
  _HomeVipPageState createState() => _HomeVipPageState();
}

class _HomeVipPageState extends State<HomeVipPage> with AutomaticKeepAliveClientMixin{

  HomeVipEntity entity;

  // 热门内容HomeVipCategorycontentsList
  List<HomeVipCategorycontentsList> topCategories = new List();

  // 数据源
  List<HomeVipCategorycontentsList> dataSource = new List();

  // 判断数据模型list是否是空值
  List<HomeVipCategorycontentsList> dataArray = new List();
  // 热门入口imageArray
  List<String> cateImageArray = new List();
  // 热门入口title
  List<String> cateTitleArray = new List();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
     print("🍎加载vip页面");
    return createContentView(context);
  }
  /// 加载本地数据源
  Widget createContentView(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("config/home_vip_data.json"),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            Map responseJson = json.decode(snapshot.data.toString());
            this.entity = HomeVipEntity.fromJson(responseJson);
            dataArray.clear();
            this.entity.categoryContents.xList.forEach((model){
              dataArray.add(model);
            });
            return loadContentView(context);
          }else{
            return CircularProgressIndicator();
          }
        });
  }

  /// 返回列表数据
  List<Widget> _loadVipContentView(BuildContext context){
    List<Widget> widgets = new List();
    List<String> bannerList = this.entity.focusImages.data.map((model) => model.cover).toList();
    widgets.add(SliverToBoxAdapter(
      child: Container(
        height: 150.0,
        color: Color(0xfff2f2f2),
        child: HomeVipBannerWidget(bannerList),
      ),
    ));
    widgets.addAll(_createListViewWidgets(context));
    widgets.add(SliverToBoxAdapter(
      child: Container(
        height: 10.0,
        color: Color(0xfff2f2f2),
      ),
    ));
    return widgets;
  }

  List<Widget> _createListViewWidgets(BuildContext context){
    double gridViewLeftSpacing = 15.0;
    double gridViewCrossAxisSpacing = 10.0;
    double screenWidth = MediaQuery.of(context).size.width;
    double kColCount = 3;
    double itemWidth = (screenWidth - gridViewLeftSpacing * 2.0 - 2.0 * gridViewCrossAxisSpacing)/kColCount;
    double itemH = itemWidth + 10 + 40 + 10;
    double widthAndHeightRatio = itemWidth/itemH;

//    print("itemH:$itemH===>itemWidth:$itemWidth");
    return this.dataArray.map((model){
      if (model.moduleType != 5 && model.moduleType != 33){
        if(model.xList == null || model.xList.length == 0){
          return SliverToBoxAdapter(
            child: Container(
              height: 5.0,
              color: Color(0xfff2f2f2),
            ),
          );
        }else{
          List<String> imageArray = model.xList.map((temp) => temp.coverPath).toList().sublist(0,5);
          List<String> titleArray = model.xList.map((temp) => temp.title).toList().sublist(0,5);
          return
            SliverToBoxAdapter(
              child: Container(
                height: 90.0,
                color: Color(0xfff2f2f2),
                child: HomeVipHotCategoryView(imageArray, titleArray),
              ),
            );
        }
      }else{// 列表数据
        // 返回列表
        return SliverList(
            delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index){
                  // * 2  第一个显示title 第二个显示具体的listView item
                  // index == 0 特别处理 判断index > 1 则显示分割线
                  if (index.isOdd){
                    int idx = index ~/ 2;
                    HomeVipCategorycontentsListList currentItem = model.xList[idx];
                    // 需要找到属于哪一个HomeVipCategorycontentsList
                    if((model.title == "热播新品"
                        || model.title == "猜你喜欢") && idx == 0){
                      List<String> titlesArr = model.xList.map((temp)=> temp.title).toList();
                      List<String> coversArr = model.xList.map((temp)=> temp.coverPath).toList();
                      if(model.title == "热播新品"){
                        return Container(
                          height: itemH,// 根据gridView item去计算
                          padding: EdgeInsets.only(left: 15.0,right: 15.0),
                          color: Colors.white,
                          child: HomeVipHotPlayListViewItem(
                              titlesArr, coversArr,widthAndHeightRatio),
                        );
                      }else{
                        List<String> subTitlesArr = model.xList.map((temp)=> temp.title).toList();
                        List<String> tagNameArr = model.xList.map((temp)=> (temp.isVipFree ? "会员免费" : "免费观看")).toList();
                        itemH = itemWidth + 10 + 40 + 6 + 17 + 6 + 17 + 10;
                        widthAndHeightRatio = itemWidth/itemH;
                        return Container(
                          height: itemH,// 根据gridView item去计算
                          padding: EdgeInsets.only(left: 15.0,right: 15.0),
                          color: Colors.white,
                          child: HomeVipGuessYouLikeItem(
                              titlesArr,
                              subTitlesArr,
                              tagNameArr,
                              coversArr,
                              widthAndHeightRatio),
                        );
                      }
                    }else{
//                      print("👿 👿 👿 👿model==>${model.title} ==>标题:${currentItem.title}==index${index}==>idx:${idx}");
                      if(model.title == "热播新品" || model.title == "猜你喜欢"){
                        return Container(
                          color: Color(0xfff2f2f2),
                          height: 5.0,// 因为会与上一个height = 0的item叠加所以是10的一半
                        );
                      }else{
                        return WotingRecomendListItem(
                          currentItem.coverPath,
                          currentItem.title,
                          currentItem.title,
                          currentItem.playsCounts,
                          currentItem.tracks,
                          isShowSubscribeView: false,
                          isShowFinishView: false,
                        );
                      }
                    }
                  }else{
                    int idx = index ~/ 2;
                    if (idx == 0){
                      return Container(
                        padding: EdgeInsets.only(left: 15.0),
                        height: 40.0,
                        alignment: Alignment.centerLeft,
                        color: Colors.white,
                        child: Text(model.title),
                      );
                    }else{
                      double separatorH = 10.0;
                      if(model.title == "热播新品" || model.title == "猜你喜欢"){
                        separatorH = 0.0;
                      }

                      return Container(
                        height: separatorH,
                        color: Color(0xfff2f2f2),
                      );
                    }
                  }
                },
                childCount: model.xList.length * 2
            ),
        );
      }
    }).toList();
  }


  /// 初始化热门视图
  Widget loadContentView(BuildContext context) {
    return CustomScrollView(
      slivers:_loadVipContentView(context),
    );
  }
}