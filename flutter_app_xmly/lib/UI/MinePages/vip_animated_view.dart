import 'package:flutter/material.dart';

class MineVipAnimationView extends StatefulWidget{

  @override
  _MineVipAnimationViewState createState() {
    // TODO: implement createState
    return _MineVipAnimationViewState();
  }
}

class _MineVipAnimationViewState extends State<MineVipAnimationView>{

  final double PI = 3.1415926;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(left: 5.0),
      constraints: BoxConstraints.tightFor(width: 120,height: 80),
      decoration: BoxDecoration(
        color: Color.fromRGBO(212, 212, 212, 1.0),
        borderRadius: BorderRadius.all(Radius.circular(8.0))
      ),
      transform: Matrix4.rotationZ(PI / 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset(
                "images/vip@2x.png",scale: 1.0,
                fit: BoxFit.cover,
                width: 30,
                height: 30,
              ),
              SizedBox(width: 5.0,),
              Text("VIP会员",style: TextStyle(
                color: Colors.grey,
                fontSize: 15.0
              ),)
            ],
          ),
          Container(
            child: Text("免费领取7天会员",style: TextStyle(
                fontSize: 13.0,
                color: Colors.grey
            ),),
          ),
        ],
      ),
    );
  }
}