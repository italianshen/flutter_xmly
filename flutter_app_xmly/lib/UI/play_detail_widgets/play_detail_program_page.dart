import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/Model/play_detail_models/play_detail_entity.dart';
import 'dart:convert';

import 'package:flutter_app_xmly/Utils/TimeUtil.dart';

import 'novel_play_page.dart';
class PlayDetailProgramPage extends StatefulWidget {
  /// 服务器数据模型
  PlayDetailEntity entity;

  /// 构造方法
  PlayDetailProgramPage(this.entity);
  @override
  _PlayDetailProgramPageState createState() => _PlayDetailProgramPageState();
}

class _PlayDetailProgramPageState extends State<PlayDetailProgramPage> {

  @override
  Widget build(BuildContext context) {
    return _createProgramContentView(context);
  }

  /// 初始化简介列表
  Widget _createProgramContentView(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    return Container(
        width: double.infinity,
        color: Colors.white,
        child: ListView.builder(
            padding: EdgeInsets.only(top: 0.0,bottom: bottomPadding),
            itemCount: widget.entity.data.tracks.xList.length,
            itemBuilder: (BuildContext context,int index){
              PlayDetailDataTracksList track = widget.entity.data.tracks.xList[index];
              print("播放地址playUrl64:${track.playUrl64}====playUrl32:${track.playUrl32}");
              print("播放地址playPathAacv164:${track.playPathAacv164}====playPathAacv224:${track.playPathAacv224}");
              return InkWell(
                onTap: (){
                  String defaultUrl = "http://aod.tx.xmcdn.com/group29/M09/26/83/wKgJXVkdPuixZhlCALl5JiJQOB4919.mp3";
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return NovelPlayPage(track);
                  }));
                },

                child: _createListViewItem(
                  track.title,
                  TimeUtil.parseTimeStampToShowTime(track.createdAt),
                  track.playtimes,
                  track.comments,
                  track.duration,
                  track.playUrl64),);
            })
    );
  }

  /// 创建listviewItem
  Widget _createListViewItem(String title,String time,int playtimes,int comments,int duration,String playUrl){

    var playCount = "";
    if(playtimes > 100000000){
      playCount = (playtimes/100000000).toStringAsFixed(1) + "亿";
    }else if (playtimes> 10000){
      playCount = (playtimes/10000).toStringAsFixed(1) + "万";
    }else{
      playCount = playtimes.toString();
    }
  return Container(
    height: 80.0,
    color: Colors.white,
    child: new Column(
      children: <Widget>[
        new Container(
          padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10.0),
          color: Colors.white,
          height: 40.0,
          child: Row(
            children: <Widget>[
              Expanded(child: Text(title,maxLines: 1,)),
              Text(time)
            ],
          ),
        ),
        new Container(
          padding: EdgeInsets.only(left: 15.0,right: 15.0,bottom: 14.0),
          color: Colors.white,
          height: 39.0,
          child: Row(
            children: <Widget>[
              Expanded(child: Row(
                children: <Widget>[
                  Container(
                    child: Image.asset("images/sound_playtimes_14x14_@2x.png",scale: 1,fit: BoxFit.cover,),
                    color: Colors.white,
                    width: 17,
                    height: 17,
                  ),
                  SizedBox(width: 2.0,),
                  Text(playCount),
                  SizedBox(width: 8.0,),
                  Image.asset("images/sound_comments_9x8_@2x.png",scale: 1,width: 14,height: 14,),
                  SizedBox(width: 2.0,),
                  Text(comments.toString()),
                  SizedBox(width: 8.0,),
                  Image.asset("images/feed_later_duration_14x14_@2x.png",scale: 1,width: 14,height: 14,),
                  SizedBox(width: 2.0,),
                  Text(duration.toString()),
                ],
              )),
              //
              Image.asset("images/downloadAlbum_30x30_@2x.png",scale: 1,width: 30,height: 30,),
            ],
          ),
        ),

        Divider(
          height: 1.0,
          color: Color(0xffdedede),
          indent: 15.0,
        )
      ],),
    );
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

