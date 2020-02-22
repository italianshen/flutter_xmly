import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/Model/BaseResponseModel.dart';
import 'package:flutter_app_xmly/main_providers/theme_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class GuessYouLikeListItem extends StatelessWidget{
  final HomeGuessYouLikeListModel _model;

  GuessYouLikeListItem(this._model);

  @override
  Widget build(BuildContext context) {
    ThemeModel model = Provider.of<ThemeModel>(context);
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

  //MARK: - 右布局
//  Widget _layoutTwoRightExpanded(){
//    return Expanded(
//        child: Container(
//          margin: EdgeInsets.only(left: 10.0),
//          height: 150.0,
//          child: _layoutTwoRightColumn(),
//        ));
//  }


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


  Widget _layoutRightItem(BuildContext context){

    return Container(
      color: Colors.red,
      width: double.infinity,
      height: 90.0,
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


  // 实现右边的布局
  Widget _layoutTwoRightColumn(){
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //电影名称
        Text(
          "流浪地球流浪地球流浪地球流浪地球流浪地球流浪地球流浪地球流浪地球流浪地球流浪地球流浪地球流浪地球流浪地球",
          style: getTextStyle(Colors.black, 20.0, true),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          "豆瓣评分: 7.9",
          style: getTextStyle(Colors.black54, 16.0, false),
        ),
        Text(
          '类型: 科幻、太空、灾难',
          style: getTextStyle(Colors.black54, 16.0, false),
        ),
        Text(
          '导演:郭帆',
          style: getTextStyle(Colors.black54, 16.0, false),
        ),
        //主演
        Container(
          margin: EdgeInsets.only(top: 8.0),
          child: Row(
            children: <Widget>[
              Text("主演"),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 2.0),
                    child: getCircleAvatar(this._model.coverMiddle),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12.0),
                    child: getCircleAvatar(this._model.coverMiddle),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12.0),
                    child: getCircleAvatar(this._model.coverMiddle),
                  ),
                ],
              )
            ],
          ),
        )
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
    double rtTitleLBMaxWidth = rtMaxWidth - 40;
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