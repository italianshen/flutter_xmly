import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/Model/discover_page_models/discover_interest_dub_model.dart';
import 'dart:convert';
class DiscoverInterestDubPage extends StatelessWidget{

  ///数据源
  List<DiscoverDubModel> dataSource = new List();
  /// 屏幕宽度
  double screenWidth = 0;

  /// 初始化动态视图
  Widget _createActivityView(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('config/interest_dub.json'),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            String memberListJson = snapshot.data;
            List<dynamic> list = json.decode(memberListJson);
            dataSource = list.map((temp) => DiscoverDubModel.fromJson(temp)).toList();
            return ListView.builder(
                itemCount: dataSource.length,
                itemBuilder: _createListViewItem);
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
  
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return _createActivityView(context);
  }


  /// 初始化listViewItem
  Widget _createListViewItem(BuildContext context,int index){
    DiscoverDubModel model = dataSource[index];
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15.0,right: 15.0),
      child: Column(
        children: <Widget>[
          _createThumbCover(model.pic, model.content),
          _createFunctionView(
              model.avatar, 
              model.nickName, 
              model.time, 
              model.likeCount.toString(), 
              model.commentCount.toString()
          ),
          Container(
            padding: EdgeInsets.only(left:15.0),
            color:Color(0xffdedede) ,
            height: 1.0,
          )
        ],
      ),
    );
  }

  /// 设置封面
  Widget _createThumbCover(String pic,String title){
    double height = screenWidth * 9.0/16.0;
    return Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: height,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: FadeInImage.assetNetwork(
                fit: BoxFit.cover,
                image: pic,
                placeholder: "images/placeholder.jpeg"/* 占位图片 */,
              ),
            )
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
        ],
      ),
    );
  }

  /// 创建底部工具栏
  Widget _createFunctionView(String avatar,String nickName,String time,String likeCount,String commentCount){
    return new Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(bottom: 10.0),
      child: new Row(
        children: <Widget>[
          Expanded(
              flex:5,
              child: new Row(
                children: <Widget>[
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(avatar),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Text(nickName)
                  )
                ],
              )
          ),

          Expanded(
              flex:3,
              child: FlatButton.icon(
                  onPressed: (){
                    print("点击了按钮");
                  },
                  icon: Image.asset(
                    "images/dianzan.png",
                    width: 20.0,
                    height: 20.0,
                  ),
                  label: Text(likeCount,style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.grey[600]
                  ),)
              )
          ),

          Expanded(
              flex:3,
              child: FlatButton.icon(
                  onPressed: (){
                    print("点击了按钮");
                  },
                  icon: Image.asset(
                    "images/pinglun.png",
                    width: 20.0,
                    height: 20.0,
                  ),
                  label: Text(commentCount,style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.grey[600]
                  ))
              )
          ),
        ],
      ),);
  }
}