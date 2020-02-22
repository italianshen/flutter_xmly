import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/Model/woting_models/woting_recomend_list_model.dart';
import 'dart:convert';
import 'package:flutter_app_xmly/UI/woting_widgets/woting_recomend_list_item.dart';
class WotingRecomendListPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _WotingRecomendListPageState();
  }
}

class _WotingRecomendListPageState extends State<WotingRecomendListPage>{
  /// 數據源
  List<WotingRecomendListModel> dataSource = new List();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _createContentView(context);
  }


  Widget _createContentView(BuildContext context){
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('config/listenRecommend.json'),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            String memberListJson = snapshot.data;
            Map map = json.decode(memberListJson);
            Map data = map["data"];
            List<dynamic> list = data["albums"];
            dataSource = list.map((temp) => WotingRecomendListModel.fromJson(temp)).toList();
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
    WotingRecomendListModel model = dataSource[index];
    return WotingRecomendListItem(
        model.coverMiddle,
        model.title,
        model.recReason,
        model.playsCount,
        model.tracks);
  }
}
