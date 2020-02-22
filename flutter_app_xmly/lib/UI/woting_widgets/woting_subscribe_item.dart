import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class WotingPageSubscribeItem extends StatelessWidget{

  /// 图片地址
  final String pic;

  /// 标题
  final String title;

  /// 副标题
  final  String subTitle;

  /// 时间
  final String time;

  WotingPageSubscribeItem(this.pic,this.title,this.subTitle,this.time);

  final String defaultpic = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562723625662&di=bc7be59dd27706ea65ea33a94c209477&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F12%2F40%2F43%2F18958PICYpQ.jpg";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
        onTap: () {
          Fluttertoast.showToast(msg: this.title);
        },
        child:
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10.0,bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _layoutTwoLeft(this.pic == null ? defaultpic : this.pic),
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
          width: 80,
          height: 90,
          fit: BoxFit.cover,
          image: imageUrl,
          placeholder: "images/placeholder.jpeg"/* 占位图片 */,
        ),
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
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(child: Text(
          this.title,
          maxLines: 1,
          style: TextStyle(
              fontSize: 17,
              decoration: TextDecoration.none),
          overflow: TextOverflow.ellipsis,
        )),
        SizedBox(height: 10.0,),
        Expanded(child: Text(
          this.subTitle,
          maxLines: 1,
          style: getTextStyle(Colors.grey, 15.0, false),
          overflow: TextOverflow.ellipsis,
        )),
        SizedBox(height: 10.0,),
        Flex(direction: Axis.horizontal,
          children: <Widget>[
            Text(
              this.time,
              style: getTextStyle(Colors.grey, 14.0, false),
            ),
          ],),
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