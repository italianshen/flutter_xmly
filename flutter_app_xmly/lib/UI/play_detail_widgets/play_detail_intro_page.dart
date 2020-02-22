import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/Model/play_detail_models/play_detail_entity.dart';
import 'dart:convert';

class PlayDetailIntroPage extends StatefulWidget{
  /// 简介的内容
  String  intro = "";

  /// smallLogo
  String smallLogo = "";

  ///personalSignature
  String personalSignature = "";

  /// "已被${this.entity.data.user.tracks}人关注"
  String followInfo = "";


  /// 详情
  PlayDetailIntroPage(
      this.intro,
      this.smallLogo,
      this.personalSignature,
      this.followInfo
      );

  @override
  State<StatefulWidget> createState() {
    return _PlayDetailIntroPage();
  }
}

class _PlayDetailIntroPage extends State<PlayDetailIntroPage>{

  /// 服务器数据模型
  PlayDetailEntity entity;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return createIntroduceView(context);
  }


  /// 初始化简介列表
  Widget createIntroduceView(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Colors.white,
        child: ListView.builder(
            padding: EdgeInsets.only(top: 15.0),
            itemCount: 2,
            itemBuilder: (BuildContext context,int index){
              if (index == 0){
                return Container(
                  color: Colors.white,
                  child: _createContentIntroView(widget.intro),
                );
              }else{
                return buildListViewItem(
                    widget.smallLogo,
                    widget.personalSignature,
                    widget.followInfo
                );
              }
            })
    );;
  }

  /// 内容简介视图item
  Widget _createContentIntroView(String content){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 0),
      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("内容简介"),
          SizedBox(height: 15.0,),
          Text(content),
          SizedBox(height: 15.0,),
          Container(
            height: 1.0,
            color: Color(0xffdedede),
          )
        ],
      ),
    );
  }

  // 创建listViewItem
  Widget buildListViewItem(String avtar,String name,String subTitle){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10.0,bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("主播介绍",style: getTextStyle(Color(0xff333333), 15.0, false),),
          SizedBox(height: 6.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    image: avtar,
                    placeholder: "images/placeholder.jpeg"/* 占位图片 */,
                  ),
                ),
              ),
              _layoutTwoRightExpandedColumnWidget(avtar, name, subTitle),
              Container(
                margin: EdgeInsets.only(right: 0.0,left: 15.0),
                child: Image.asset("images/np_headview_nofollow_n_23x36_@2x.png",
                  width: 23.5,height: 36.0,scale: 1.0,),
              ),
            ],
          ),
          SizedBox(height: 9.0,),
          Container(
            height: 1.0,
            color: Color(0xffdedede),
          )
        ],
      ),
    );

  }

  //MARK: - 右布局
  Widget _layoutTwoRightExpandedColumnWidget(String cover,String name,String subTitle){
    return Expanded(
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.only(left: 10.0,top: 5.0),
          height: 60.0,
          child: _layoutContentItem(cover,name,subTitle),
        ));
  }

  Widget _layoutContentItem(String cover,String name,String subTitle){
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(child: Text(
          name,
          maxLines: 1,
          style: TextStyle(
              fontSize: 17,
              decoration: TextDecoration.none),
          overflow: TextOverflow.ellipsis,
        )),
        SizedBox(height: 10.0,),
        Expanded(child: Text(
          subTitle,
          maxLines: 1,
          style: getTextStyle(Colors.grey, 15.0, false),
          overflow: TextOverflow.ellipsis,
        )),
      ],
    );
  }

  /// TextStyle:封装
  TextStyle getTextStyle(Color colors,double fontsizes,bool isFontWeight){
    return TextStyle(
      color:colors,
      fontSize: fontsizes,
      fontWeight: isFontWeight == true ? FontWeight.bold : FontWeight.normal ,
    );
  }
}
