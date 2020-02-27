import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/Model/BaseResponseModel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GuessYouLikeListItem extends StatelessWidget{
  final HomeGuessYouLikeListModel _model;

  GuessYouLikeListItem(this._model);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
        onTap: () {
          Fluttertoast.showToast(msg: this._model.title);
        },
        child:
        Container(
          padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10.0,bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _layoutTwoLeft(this._model.coverMiddle),
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
          )
      ),
    );
  }

  CircleAvatar getCircleAvatar(String  imageUrl){
    // 圆形头像
    return CircleAvatar(
      backgroundColor: Colors.white,
      backgroundImage: NetworkImage(imageUrl),
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
    var playCount = "";
    if(this._model.playsCounts > 100000000){
      playCount = (this._model.playsCounts/100000000).toStringAsFixed(1) + "亿";
    }else if (this._model.playsCounts > 10000){
      playCount = (this._model.playsCounts/10000).toStringAsFixed(1) + "万";
    }else{
      playCount = this._model.playsCounts.toString();
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
              this._model.title,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 17,
                  decoration: TextDecoration.none),
              overflow: TextOverflow.ellipsis,
            ))
          ],),
        SizedBox(height: 10.0,),
        Text(
          this._model.recReason,
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
              playCount,
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

class GuessYouLikeListItemView extends StatelessWidget{

  final HomeGuessYouLikeListModel _model;

  GuessYouLikeListItemView(this._model);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){
        String title = _model.title;
        debugPrint("点击了$title");
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: 120.0,
              child: _mineItem(context,this._model.coverLarge, this._model.title,this._model.recReason,this._model.subscribesCounts,this._model.tracks),
            ),
            Container(
              color: Color(0xffeaeaea),
              constraints: BoxConstraints.expand(height: 1.0),
            )
          ],
        ),
      ),
    );
  }

  Widget _mineItem(BuildContext context,String imageName,String title,String recReason,int subscribeCount,int tracks){
    double screenWidth = MediaQuery.of(context).size.width;
    double rtMaxWidth = screenWidth - 15.0 * 2 - 10 - 90;
    return Row(
      children: <Widget>[
        Container(
          color: Colors.red,
            padding: EdgeInsets.only(left: 15.0),
            child: Image.network(imageName,
              width: 80,height: 100,
              fit: BoxFit.cover,
            )
        ),
        Container(
          padding: EdgeInsets.only(left: 10,right: 15.0,top: 15.0,bottom: 20.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: rtMaxWidth
                ),
                child: new Row(
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
                      title + title,
                      style: TextStyle(fontSize: 16.0),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),),
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: rtMaxWidth
                ),
                child: Text(
                  recReason,
                  style: TextStyle(fontSize: 14.0),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 10.0,),
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: rtMaxWidth
                ),
                child: Text(
                  subscribeCount.toString(),
                  style: TextStyle(fontSize: 14.0),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}