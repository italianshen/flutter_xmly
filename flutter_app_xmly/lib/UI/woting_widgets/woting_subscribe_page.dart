import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/Model/woting_models/woting_subscribe_list_model.dart';
import 'package:flutter_app_xmly/UI/woting_widgets/woting_subscribe_item.dart';
import 'dart:convert';
class WotingSubscribePage extends StatefulWidget{

  @override
  _WotingSubscribePageState createState() {
    // TODO: implement createState
    return _WotingSubscribePageState();
  }
}

class _WotingSubscribePageState extends State<WotingSubscribePage>{

  /// 數據源
  List<WotingSubscribeListModel> dataSource = new List();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _createContentView(context);
  }


  Widget _createContentView(BuildContext context){
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('config/listenSubscibe.json'),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            String memberListJson = snapshot.data;
            Map map = json.decode(memberListJson);
            Map data = map["data"];
            List<dynamic> list = data["albumResults"];
            dataSource = list.map((temp) => WotingSubscribeListModel.fromJson(temp)).toList();
            return ListView.separated(
                itemBuilder: _createListViewItem,
                separatorBuilder: (BuildContext context,int index){
                  return Divider(
                    color: Color(0xffdedede),
                    height: 1.0,
                    indent: 15.0,
                  );
                },
                itemCount: dataSource.length);
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _createListViewItem(BuildContext context,int index){
    WotingSubscribeListModel model = dataSource[index];
    return WotingPageSubscribeItem(
        model.albumCover, model.albumTitle, model.trackTitle, model.lastUpdateAt.toString());
  }

}