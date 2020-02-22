import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_app_xmly/Model/woting_models/woting_recomend_list_model.dart';
import 'package:flutter_app_xmly/UI/woting_widgets/woting_recomend_list_item.dart';

class PlayDetailLookSimilarPage extends StatefulWidget {
  @override
  _PlayDetailLookSimilarPageState createState() => _PlayDetailLookSimilarPageState();
}

class _PlayDetailLookSimilarPageState extends State<PlayDetailLookSimilarPage> {
  /// 數據源
  List<WotingRecomendListModel> dataSource = new List();

  @override
  Widget build(BuildContext context) {
    return _createContentView(context);
  }


  Widget _createContentView(BuildContext context){
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
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
                padding: EdgeInsets.only(top: 0.0,bottom: bottomPadding),
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
