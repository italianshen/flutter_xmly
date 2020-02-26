import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_app_xmly/Model/home_classify_models/home_classify_entity.dart';
import 'package:flutter_app_xmly/UI/HomeTabWidgets/home_list_view_item.dart';

class HomeClassifyListView extends StatefulWidget{

  @override
  _HomeClassifyListViewState createState() {
    return _HomeClassifyListViewState();
  }
}

class _HomeClassifyListViewState extends State<HomeClassifyListView> with AutomaticKeepAliveClientMixin{
  /// 实体模型
  HomeClassifyEntity entity;

  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    debugPrint("🍎首页分类列表加载");
    return Scaffold(
//      body: _createContentView(context),
      body: _createContentView(context),
    );
  }

  // 加载本地json
  Future<String> _getClassifyDataRequest() async{
   return DefaultAssetBundle.of(context).loadString("config/home_classify_tab_data.json");
  }

  Widget _createContentView(BuildContext context){
    return FutureBuilder(
        future: _getClassifyDataRequest(),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            String memberListJson = snapshot.data;
            Map map = json.decode(memberListJson);
            this.entity = HomeClassifyEntity.fromJson(map);
            return _createListView();
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }


  /// 创建列表
  Widget _createListView(){
    return Container(
      color: Color(0xfff2f2f2),
      padding: EdgeInsets.only(bottom: 10.0),
      child: ListView.builder(
          itemCount: this.entity.xList.length * 2,
          itemBuilder: (BuildContext context,int index){
            if (index.isOdd){// 基数
              int idx = index ~/ 2;
              return _createListViewItem(context, idx);
            }else{
              int idx = index ~/ 2;
              return _createSectionHeader(idx);
            }
          }),
    );
  }

  Widget _createSectionHeader(int index){
    String groupName = this.entity.xList[index].groupName;
    return index < 3 ? Container(
      height: 0.0,
      color: Colors.white,
    ) : Container(
      height: 30.0,
      padding: EdgeInsets.only(left: 10.0,top: 6.0,bottom: 6.0),
      alignment: Alignment.centerLeft,
      color: Color(0xfff2f2f2),
      child: Row(
        children: <Widget>[
          Container(
            width: 4.0,
            color: Color.fromRGBO(242, 77, 51, 1),
          ),
          SizedBox(width: 10.0,),
          Text("$groupName",style: TextStyle(
            color: Color(0xff666666),
            fontSize: 14.0
          ),)
        ],
      ),
    );
  }



  Widget _createListViewItem(BuildContext context,int index){
    HomeClassifyList list = this.entity.xList[index];
    List<String> titles = list.itemList.map((model) => model.itemDetail.title).toList();
    List<String> images = list.itemList.map((model) => model.coverPath).toList();
    return HomeClassifyListViewItem(titles, images);
  }

}