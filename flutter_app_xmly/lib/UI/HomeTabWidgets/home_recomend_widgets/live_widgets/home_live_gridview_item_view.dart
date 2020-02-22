import 'package:flutter/material.dart';

class HomeLiveGridViewItem extends StatelessWidget{

  /// 封面
  String cover;
  /// 昵称 标题
  String nickName;
  /// 名称 副标题
  String name;
  /// categoryName
  String categoryName;

  HomeLiveGridViewItem(this.cover,this.nickName,this.name,this.categoryName);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemW = (screenWidth -40.0)/2.0;
    double ratio = ((screenWidth - 40)/2.0)/240.0;
    double itemH = itemW / ratio;
    return Container(
      width: itemW,
      height: itemH,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                ///placeholder.jpeg
                child: FadeInImage.assetNetwork(
                  image: cover,
                  placeholder: "images/placeholder.jpeg"/* 占位图片 */,),
              ),
              Positioned(
                  right: 8.0,
                  bottom: 8.0,
                  child: Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    //设置 child 居中
                    alignment: Alignment(0, 0),
                    height: 20,
                    //边框设置
                    decoration: new BoxDecoration(
                      //背景
                      color: Colors.orange,
                      //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      //设置四周边框
                      border: new Border.all(width: 1, color: Colors.orange),
                    ),
                    child: Text(categoryName,style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0
                    ),),
                  )
              )
            ],
          ),
          SizedBox(height: 3.0,),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(nickName,
                maxLines: 1,
                style: TextStyle(
                color: Colors.black,
                fontSize: 16
            )),
          ),
          SizedBox(height: 3.0,),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(name,
              maxLines: 1,
              style: TextStyle(
              color: Colors.grey,
              fontSize: 14
            ),),
          )
        ],
      ),
    );
  }
}
