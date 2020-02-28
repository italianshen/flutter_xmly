import 'package:flutter/material.dart';
import 'dart:convert';

class BroadCastDetailListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BroadCastDetailListPageState();
  }
}

class _BroadCastDetailListPageState extends State<BroadCastDetailListPage> {
  /// 数据源
  List<Map<String, dynamic>> dataSource = new List();

  @override
  Widget build(BuildContext context) {
    print("🍎 come here 111");
    return new Scaffold(
        appBar: AppBar(
          title: Text("频道"),
          elevation: 0.0,
        ),
        body: _loadDataThenBuildView(context));
  }

  /// 加载ranklist
  Future<String> _loadData() async {
    return DefaultAssetBundle.of(context)
        .loadString("config/broad_cast_detail_list_data.json");
  }

  /// 获取所有数据然后加载页面
  Widget _loadDataThenBuildView(BuildContext context) {
    debugPrint("🍎 come here");
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString("config/broad_cast_detail_list_data.json"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var responseJson = json.decode(snapshot.data.toString());
            debugPrint("responseJson:$responseJson===>type:${responseJson.runtimeType}");
            debugPrint("type:${responseJson.runtimeType}");
            Map responseDict = Map.from(responseJson);
            Map dataMap = responseDict["data"];
            List dataList = dataMap["data"];
            debugPrint("dataList:${dataList}");
            debugPrint("type:${dataList.runtimeType}");

            return Center(
              child: Text("🍎 数据加载完毕"),
            );
          } else if (snapshot.hasError) {
            debugPrint("🍎 出错拉${snapshot.error}");
            return Container(
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: Text("🍎 加载出错"),
              ),
            );
          } else {
            return Container(
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: Text("🍎正在加载中"),
              ),
            );
          }
        });
  }
}
