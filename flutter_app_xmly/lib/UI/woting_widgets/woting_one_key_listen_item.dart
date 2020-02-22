import 'package:flutter/material.dart';

class WotingOneKeyListenItem extends StatelessWidget{
  final String cover;
  final String title;
  final String subTitle;

  WotingOneKeyListenItem(this.cover,this.title,this.subTitle);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color(0xfff2f2f2),
      padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 5.0,bottom: 5.0),
      child: Stack(
        alignment: Alignment.topLeft,
        fit: StackFit.expand,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: FadeInImage.assetNetwork(
              fit: BoxFit.cover,
              image: cover,
              placeholder: "images/placeholder.jpeg"/* 占位图片 */,
            ),
          ),
          Positioned(
              child: Text(title,
                style: TextStyle(
                 color: Colors.white,
                 fontSize: 25.0
              ),),
              top: 20.0,
              left: 20.0,
          ),
          Positioned(
              child: Text(
                subTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),
              ),
              top: 60.0,
              left: 20.0,
          ),
          Positioned(
              child: Image.asset(
                "images/whitePlay@2x.png",
                scale: 1.0,
                width: 45.0,
                height: 45.0,),
              bottom: 15.0,
              right: 15.0,
          )
        ],

      ),
    );
  }
}
