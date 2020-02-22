import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WotingRecomendListItem extends StatelessWidget{

  /// 图片
  final String pic;

  /// title
  final String title;

  /// subtitle
  final String subtitle;

  /// 播放次数
  final int playCount;

  /// 多少集
  final int trackCount;

  /// 是否显示订阅
  bool isShowSubscribeView;

  /// 是否显示已完结
  bool isShowFinishView;


  WotingRecomendListItem(
      this.pic,
      this.title,
      this.subtitle,
      this.playCount,
      this.trackCount,
      {this.isShowSubscribeView = true,this.isShowFinishView = true}
      );

  final String defaultpic = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562723625662&di=bc7be59dd27706ea65ea33a94c209477&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F12%2F40%2F43%2F18958PICYpQ.jpg";
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Fluttertoast.showToast(msg: this.title);
        },
        child:
        Container(
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
    var playCount = "0";
    if(this.playCount != null){
      if(this.playCount > 100000000){
        playCount = (this.playCount/100000000).toStringAsFixed(1) + "亿";
      }else if (this.playCount > 10000){
        playCount = (this.playCount/10000).toStringAsFixed(1) + "万";
      }else{
        playCount = this.playCount.toString();
      }
    }
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flex(
          crossAxisAlignment: CrossAxisAlignment.center,
          direction: Axis.horizontal,
          children: <Widget>[
            isShowFinishView ? DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  color: Colors.amber,
                  shape: BoxShape.rectangle
              ),
              child: Text(" 完结 ",style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0
              ),),
            ) : SizedBox(width: 0.0,),
            SizedBox(width: isShowFinishView ? 10.0 : 0.0,),
            Expanded(child: Text(
              this.title,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 17,
                  decoration: TextDecoration.none),
              overflow: TextOverflow.ellipsis,
            ))
          ],),
        SizedBox(height: 6.0,),
        Flex(
          crossAxisAlignment: CrossAxisAlignment.center,
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(child: Text(
              this.subtitle,
              style: getTextStyle(Colors.grey, 15.0, false),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),),
            isShowSubscribeView ? InkWell(
              child:Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))
                ),
                height: 30.0,
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 0.0,right: 0.0),
                child:FlatButton(
                    color: Color.fromRGBO(254, 232, 227, 1.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))
                    ),
                    onPressed: (){
                      debugPrint("点击添加订阅");
                    }, child: Text("+订阅",style: TextStyle(
                    color: Color.fromRGBO(242, 77, 51, 1.0),
                    fontSize: 16.0
                ))
                ),
              ),
            ) : SizedBox(width: 0.0,)
          ],
         ),
        SizedBox(height: 6.0,),
        Row(
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
              this.trackCount == null ? "0" : this.trackCount.toString(),
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