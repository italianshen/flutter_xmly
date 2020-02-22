import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/Model/home_recomen_model/home_novel_list_model.dart';
import 'package:flutter_app_xmly/UI/play_detail_widgets/play_detail_page.dart';
import 'package:flutter_app_xmly/Utils/TimeUtil.dart';
import 'package:fluttertoast/fluttertoast.dart';
class HomeCategoryNovelListItem extends StatelessWidget{

  HomeNovelListModel model;

  HomeCategoryNovelListItem(this.model);

  String defaultpic = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562723625662&di=bc7be59dd27706ea65ea33a94c209477&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F12%2F40%2F43%2F18958PICYpQ.jpg";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
        onTap: () {
          if(model.lastUptrackAt == null){
            Fluttertoast.showToast(msg: "您要查看的专辑已下架，请移步其他专辑");
          }else{
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return PlayDetailPage(
                  model.albumId,
                  model.pic,
                  model.title,
                  model.subtitle,
                  model.lastUptrackAt);
            }));
          }
        },
        child:
        Container(
          padding: EdgeInsets.only(left: 0,right: 15.0,top: 10.0,bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _layoutTwoLeft(this.model.pic == null ? defaultpic : this.model.pic),
              _layoutTwoRightExpandedColumnWidget(),
            ],
          ),
        )
    );
  }

  // MARK: - 实现左侧图片
  Widget _layoutTwoLeft(String imageUrl){
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: FadeInImage.assetNetwork(
          image: imageUrl,
          placeholder: "images/placeholder.jpeg"/* 占位图片 */,
          width: 80,
          height: 100,
          fit: BoxFit.cover,
        )
      ),
    );
  }

  //MARK: - 右布局
  Widget _layoutTwoRightExpandedColumnWidget(){
    return Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 10.0),
          height: 90.0,
          child: _layoutContentItem(),
        ));
  }

  /// 布局右侧内容
  Widget _layoutContentItem(){
    var playCount = "0";
    if(this.model.playsCount != null){
      if(this.model.playsCount > 100000000){
        playCount = (this.model.playsCount/100000000).toStringAsFixed(1) + "亿";
      }else if (this.model.playsCount > 10000){
        playCount = (this.model.playsCount/10000).toStringAsFixed(1) + "万";
      }else{
        playCount = this.model.playsCount.toString();
      }
    }
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flex(
          crossAxisAlignment: CrossAxisAlignment.center,
          direction: Axis.horizontal,
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  color: Colors.amber,
                  shape: BoxShape.rectangle
              ),
              child: Text(" 完结 ",style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0
              ),),
            ),
            SizedBox(width: 10.0,),
            Expanded(child: Text(
              this.model.title,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 17,
                  decoration: TextDecoration.none),
              overflow: TextOverflow.ellipsis,
            ))
          ],),
        SizedBox(height: 10.0,),
        Text(
          this.model.subtitle,
          style: getTextStyle(Colors.grey, 15.0, false),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 10.0,),
        Flex(direction: Axis.horizontal,
          children: <Widget>[
            Image.asset("images/ji.png",width: 17,height: 17,),
            SizedBox(width: 5.0,),
            Text(
              playCount,
              style: getTextStyle(Colors.grey, 14.0, false),
            ),
            SizedBox(width: 10.0,),
            Image.asset("images/bofangcishu.png",width: 17,height: 17,),
            SizedBox(width: 5.0,),
            Text(
              model.tracksCount == null ? "0" : model.tracksCount.toString(),
              style: getTextStyle(Colors.grey, 14.0, false),
            ),
          ],),
      ],
    );
  }

  /**
   * TextStyle:封装
   * colors:颜色
   * fontsizes：字体大小
   * isFontWeight：是否加粗
   */
  TextStyle getTextStyle(Color colors,double fontsizes,bool isFontWeight){
    return TextStyle(
      color:colors,
      fontSize: fontsizes,
      fontWeight: isFontWeight == true ? FontWeight.bold : FontWeight.normal ,
    );
  }

}