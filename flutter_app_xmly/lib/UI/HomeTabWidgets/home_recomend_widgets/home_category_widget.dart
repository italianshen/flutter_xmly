import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/Model/home_recomen_model/home_novel_list_model.dart';
import 'package:flutter_app_xmly/Model/home_recomen_model/home_recomend_base_model.dart';
import 'package:flutter_app_xmly/UI/play_detail_widgets/play_detail_page.dart';
import 'package:flutter_app_xmly/Utils/TimeUtil.dart';

import 'home_category_norvel_list_item.dart';

class HomeCategoryWidget extends StatelessWidget{

  // 模型
  HomeRecomendBaseListModel model;

  // 构造方法
  HomeCategoryWidget(this.model);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _createRowItem(context);
  }

  String _getCategoryTitle(){
    String title = "";
    if(model.moduleType == "guessYouLike"){
      title = "猜你喜欢";
    }else if (model.moduleType == "paidCategory"){
      title = " 精品";
    }else if (model.moduleType == "categoriesForShort"){
      title = model.categoryId == 3 ? "最热有声书" : "相声评书";//列表
    }else if (model.moduleType == "categoriesForLong"){//
      title = model.categoryId == 6 ? "亲子时光" : (model.categoryId == 1 ? "头条" : "音乐好时光");
    }else if (model.moduleType == "playlist"){
      title = "精品听单";//列表
    }else if (model.moduleType == "microLesson"){
      title = "直播";
    }else if (model.moduleType == "live"){
      title = "直播";
    }else if (model.moduleType == "categoriesForExplore"){
      title = "综艺娱乐";//列表
    }else if (model.moduleType == "cityCategory"){
      title = "听上海";
    }else if (model.moduleType == "recommendAlbum"){
      title = "为你推荐";
    }else if (model.moduleType == "ad"){
      title = "广告";
    }
    return title;
  }

  /// 是否是行排列
  bool _isRowDisplayStyle(){
    return (model.moduleType == "categoriesForShort"
        || model.moduleType == "playlist"
        || model.moduleType == "categoriesForExplore");
  }
  /// 创建行
  Widget _createRowItem(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    double gridViewItemWidth = (screenWidth - 30.0 - 2.0 * 10.0)/3.0;
    int listCount = model.list.length;
    int rowCount = listCount ~/3;
    double gridViewContentHeight = gridViewItemWidth/0.6 * rowCount + (rowCount - 1).toDouble() * 10.0;
    if(_isRowDisplayStyle()){
      gridViewContentHeight = model.list.length * 120.0;
    }
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.only(top: 15.0),
      child: new Column(
        children: <Widget>[
          new Container(
            color: Colors.white,
            padding: EdgeInsets.only(bottom: 10.0,left: 15.0,right: 15.0),
            child: new Row(
            children: <Widget>[
              Expanded(child: Text(_getCategoryTitle())),
              InkWell(
                child: Text('更多 >'),
                onTap: (){
                  // 需要判断类型
                  Navigator.of(context).pushNamed("guess_you_like_list_page");
                },
              )
            ],
          ),),
          new Container(
            width: double.infinity,
            height: gridViewContentHeight,
            padding: EdgeInsets.only(left: 15.0,right: 15.0),
            color: Colors.white,
            child: _isRowDisplayStyle()
                ? _buildListViewForNovelModuleType()
                : _createHorizontalThreeGridItemView(context),
          ),

          new Container(
              alignment: Alignment.center,
              color: Colors.white,
              padding: EdgeInsets.only(bottom: 10.0,top: 10.0),
              child: FlatButton(
                onPressed: (){
                  debugPrint("点击换一批");
                },
                child: Text("换一批",style: TextStyle(
                  color: Color.fromRGBO(242, 77, 51, 1.0),
                  fontSize: 13.0
                ),),
                color: Color.fromRGBO(254, 232, 227, 1.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)
                ),
              )
          ),
          new Container(
            height: 10.0,
            color: Color(0xfff2f2f2),
          )
        ],
      ),
    );
  }

  /// 创建横向3个gridView 3*1 3*2
  Widget _createHorizontalThreeGridItemView(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    double gridViewItemWidth = (screenWidth - 30.0 - 2.0 * 10.0)/3.0;
    return new GridView.custom(
        physics: const NeverScrollableScrollPhysics(),//去除gridView本身的滚动
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.6
        ),
        childrenDelegate: SliverChildBuilderDelegate(
                (BuildContext context,int index){
                  Map<String,dynamic> map = model.list[index];
                  String cover = "";
                  String title = "unknown title";
                  String subTitle = "unknown subTitle";
                  if (map["pic"] != null){
                    cover = map["pic"];
                  }

                  if (map["coverPath"] != null){
                    cover = map["coverPath"];
                  }

                  if (map["coverSmall"] != null){
                    cover = map["coverSmall"];
                  }

                  if (map["coverMiddle"] != null){
                    cover = map["coverMiddle"];
                  }

                  if (map["coverLarge"] != null){
                    cover = map["coverLarge"];
                  }

                  if (model.moduleType == "guessYouLike"
                      || model.moduleType == "paidCategory"
                      || model.moduleType == "categoriesForShort"
                      || model.moduleType == "categoriesForLong"
                      || model.moduleType == "playlist"
                      || model.moduleType == "categoriesForExplore"
                  ){
                    title = map["title"];
                    subTitle = map["subtitle"];
                  }else if (model.moduleType == "cityCategory"){
                    title = map["title"];
                    subTitle = map["intro"];
                  }
                  else if (model.moduleType == "live"){
                    title = map["nickname"];
                    subTitle = map["name"];
                    String nickname = map["nickname"];
                    String description = map["name"];
                    debugPrint("😝昵称:$nickname");
                    debugPrint("😝描述:$description");
                    debugPrint("😝cover:$cover");
                  }
              return InkWell(
                onTap: (){
                  // 标题等数据
                  Map<String,dynamic> mDict = model.list[index];
                  int channelId = mDict["albumId"] != null ? mDict["albumId"] : 8;
                  int updateTime = mDict["lastUptrackAt"] != null
                      ? mDict["lastUptrackAt"]
                      : 0;
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return PlayDetailPage(channelId, cover, title, subTitle, updateTime);
                  }));
                },
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: gridViewItemWidth/0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: gridViewItemWidth ,
                        height: gridViewItemWidth,
                        color: Colors.white,
                        child: FadeInImage.assetNetwork(
                          width: gridViewItemWidth,
                          height: gridViewItemWidth,
                          fit: BoxFit.cover,
                          image: cover,
                          placeholder: "images/placeholder.jpeg"/* 占位图片 */,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0,bottom: 5.0,right: 5.0),
                        child: Text(title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xff333333),
                          ),),),
                      Container(
                        height: 18.0,
                        color: Colors.white,
                        child: Text(subTitle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 13.0,
                              color: Color(0xff999999),
                            )),
                      )
                    ],
                  ),
                ),
              );
            },
            childCount: model.list == null ? 0 : model.list.length
        ));
  }
  /// 创建竖向3个gridView
  /// 创建6个listView item
///
/// HomeCategoryForShortModel 小说是listView
/// HomeCategoryNovelListItem

  Widget _buildListViewForNovelModuleType(){
    return new ListView.builder(
      physics: const NeverScrollableScrollPhysics(),//去除gridView本身的滚动
      itemCount: model.list == null ? 0 : model.list.length,
        itemBuilder: _createListViewItem,itemExtent: 120,);
  }
  
  Widget _createListViewItem(BuildContext context,int index){
    Map<String,dynamic> map = model.list[index];
//    print("😀json:$map");
    return HomeCategoryNovelListItem(HomeNovelListModel.fromJson(map));
  }

}
