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

            return ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (BuildContext context,int index)
              {
                  Map map = dataList[index];
                  return buildListViewItem(
                    map["coverLarge"] != null 
                  ? map["coverLarge"] 
                  : "",   map["name"] != null 
                  ? map["name"] 
                  : "", map["programName"] != null 
                  ? map["programName"] 
                  : "", map["playCount"] != null 
                  ? map["playCount"] 
                  : 0);
              }
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

    // 创建listViewItem
  Widget buildListViewItem(
      String cover, String name, String programName, int playCount) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 90,
            height: 90,
            color: Colors.white,
            child: FadeInImage.assetNetwork(
              fit: BoxFit.cover,
              image: cover,
              placeholder: "images/placeholder.jpeg" /* 占位图片 */,
            ),
          ),
          _layoutTwoRightExpandedColumnWidget(
              cover, name, programName, playCount),
          Container(
            margin: EdgeInsets.only(right: 0.0, left: 15.0),
            child: Image.asset("images/play.png", width: 35.0, height: 35.0),
          )
        ],
      ),
    );
  }

  //MARK: - 右布局
  Widget _layoutTwoRightExpandedColumnWidget(
      String cover, String name, String programName, int playCount) {
    return Expanded(
        child: Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 10.0, top: 6.0, bottom: 6.0),
      height: 90.0,
      child: _layoutContentItem(cover, name, programName, playCount),
    ));
  }

  /// 布局右侧内容
  Widget _layoutContentItem(
      String cover, String name, String programName, int playCount) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: Text(
          name,
          maxLines: 1,
          style: TextStyle(fontSize: 17, decoration: TextDecoration.none),
          overflow: TextOverflow.ellipsis,
        )),
        SizedBox(
          height: 10.0,
        ),
        Expanded(
            child: Text(
          programName,
          maxLines: 1,
          style: getTextStyle(Colors.grey, 15.0, false),
          overflow: TextOverflow.ellipsis,
        )),
        SizedBox(
          height: 10.0,
        ),
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Text(
              playCount.toString(),
              style: getTextStyle(Colors.grey, 14.0, false),
            ),
          ],
        ),
      ],
    );
  }

  /// TextStyle:封装
  TextStyle getTextStyle(Color colors, double fontsizes, bool isFontWeight) {
    return TextStyle(
      color: colors,
      fontSize: fontsizes,
      fontWeight: isFontWeight == true ? FontWeight.bold : FontWeight.normal,
    );
  }
}
