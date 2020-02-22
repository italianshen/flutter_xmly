import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/Model/woting_models/woting_listen_list_model.dart';
import 'dart:convert';

import 'package:flutter_app_xmly/UI/woting_widgets/woting_one_key_listen_item.dart';

class WotingListenListPage extends StatefulWidget{

  @override
  _WotingListenListPageState createState() {
    // TODO: implement createState
    return _WotingListenListPageState();
  }

}


class _WotingListenListPageState extends State<WotingListenListPage>{

  /// 數據源
  List<WotingListenListModel> dataSource = new List();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _createContentView(context);
  }


  Widget _createContentView(BuildContext context){
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('config/listenMoreChannel.json'),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            String memberListJson = snapshot.data;
            Map map = json.decode(memberListJson);
            Map data = map["data"];
            List<dynamic> list = data["channelResults"];
            dataSource = list.map((temp) => WotingListenListModel.fromJson(temp)).toList();
//            dataSource.forEach((model)=> print('slogan is ${model.slogan}'));
            print("🐸dataSource:${dataSource.length}");
            return ListView.builder(
                itemBuilder: _createListViewItem,
                itemExtent: 120.0,
                itemCount: dataSource.length,
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });

  }

  Widget _createListViewItem(BuildContext context,int index){
    WotingListenListModel model = dataSource[index];
    return WotingOneKeyListenItem(
                   model.cover,
                   model.channelName,
                   model.slogan
          );
  }
}