import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/Model/home_broadcast_models/home_broadcast_entity.dart';

import 'home_broadcast_widgets/home_broadcast_hot_channel_view.dart';
import 'dart:convert';

class HomeBroadCastPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeBroadCastPageState();
  }
}

class _HomeBroadCastPageState extends State<HomeBroadCastPage> with AutomaticKeepAliveClientMixin{


  /// 数据模型
  HomeBroadcastEntity entity;
  // 未展开的频道
  List<String> unexpandedChannelTitles = [];
  // 展开的channel titles
  List<String> expandedChannelTitles = [];

  // 是否是展开状态
  bool isExpaned = false;

  final String kExpandChannelName = "Expand";

  final String kUnExpandChannelName = "Unuxpand";


  @override
  bool get wantKeepAlive => true;

  Widget buildChannelItem(String title,IconData icon){
    return Column(
      children: <Widget>[
        Icon(icon),
        SizedBox(height: 4.0,),
        Text(title)
      ],
    );
  }


  // GridView
  Widget buildGridViewChannel(){
    List imageArray = this.entity.data.radioSquareResults.map((model) => model.icon).toList();
    List titleArray = this.entity.data.radioSquareResults.map((model) => model.title).toList();
    return HomeBroadCastHotChannelHeaderView(
        imageArray,
        titleArray
    );
  }

  // 创建列表item
  List<Widget> buildTVItems(){
    return (isExpaned == false ? unexpandedChannelTitles : expandedChannelTitles).map((title){
      return
        GestureDetector(
          onTap: (){
            debugPrint("😂 你点击了:$title");
            // 点击了Expanded 切换数据源
            setState(() {
              if (title == "Expand"){// 切换成展开
                this.isExpaned = true;
              }else if (title == "Unexpanded"){
                this.isExpaned = false;
              }else{
                debugPrint("🙂 点击了item:$title");
              }
            });

          },
          child: Container(
              height: 30.0,
              color: Colors.grey[300],
              child: title != "Expand" ? Center(
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black38
                  ),
                ),
              ) : Icon(Icons.add)
          ),
        );
    }).toList();
  }


  /// 创建频道网格视图
  Widget creatGridTVChannels(){
    List<String> dataSource = isExpaned ? this.expandedChannelTitles : this.unexpandedChannelTitles;
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: dataSource.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            childAspectRatio: 5/2,
        ),
        itemBuilder: (BuildContext context,int index){
          String channel = dataSource[index];
          return InkWell(
            onTap: (){
              if(channel == kExpandChannelName){
                // 展开
                setState(() {
                  isExpaned = true;
                });
              }else if (channel == kUnExpandChannelName){
                // 收起
                setState(() {
                  isExpaned = false;
                });
              }
            },
            child: Container(
                height: 30.0,
                color: Color.fromRGBO(244, 244, 245, 1),
                child: Center(
                    child: (channel == kExpandChannelName || channel == kUnExpandChannelName)
                        ? (channel == kExpandChannelName ? Image.asset("images/arrows_bottom.png") : Image.asset("images/arrows_top.png") )
                        : Text(channel)
                )),
          );
        });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  Widget createMoreChannelWidgetItem(String title){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(child: Text(
            title,
            style: TextStyle(
              fontSize: 18.0
            ),
        )),
        Text("更多 >"),
        SizedBox(width: 4.0,),
      ],
    );
  }


  // 创建listViewItem
  Widget buildListViewItem(String cover,String name,String programName,int playCount){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15.0,right: 15.0),
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
              placeholder: "images/placeholder.jpeg"/* 占位图片 */,
            ),
          ),
          _layoutTwoRightExpandedColumnWidget(cover, name, programName, playCount),
          Container(
            margin: EdgeInsets.only(right: 0.0,left: 15.0),
            child: Image.asset("images/play.png",
              width: 35.0,height: 35.0),
          )
        ],
      ),
    );

  }

  //MARK: - 右布局
  Widget _layoutTwoRightExpandedColumnWidget(String cover,String name,String programName,int playCount){
    return Expanded(
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.only(left: 10.0,top: 6.0,bottom: 6.0),
          height: 90.0,
          child: _layoutContentItem(cover,name,programName,playCount),
        ));
  }

  /// 布局右侧内容
  Widget _layoutContentItem(String cover,String name,String programName,int playCount){
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(child: Text(
          name,
          maxLines: 1,
          style: TextStyle(
              fontSize: 17,
              decoration: TextDecoration.none),
          overflow: TextOverflow.ellipsis,
        )),
        SizedBox(height: 10.0,),
        Expanded(child: Text(
          programName,
          maxLines: 1,
          style: getTextStyle(Colors.grey, 15.0, false),
          overflow: TextOverflow.ellipsis,
        )),
        SizedBox(height: 10.0,),
        Flex(direction: Axis.horizontal,
          children: <Widget>[
            Text(
              playCount.toString(),
              style: getTextStyle(Colors.grey, 14.0, false),
            ),
          ],),
      ],
    );
  }

  /// TextStyle:封装
  TextStyle getTextStyle(Color colors,double fontsizes,bool isFontWeight){
    return TextStyle(
      color:colors,
      fontSize: fontsizes,
      fontWeight: isFontWeight == true ? FontWeight.bold : FontWeight.normal ,
    );
  }


  /// 加载数据
  Future<String> _loadData() async {
    return DefaultAssetBundle.of(context).loadString("config/home_broadcast_data.json");
  }



  /// 初始化热门视图
  Widget loadContentView(BuildContext context) {
    double itemWidth = (MediaQuery.of(context).size.width - (3 * 4.0))/4.0;
    double itemHeight = itemWidth * 0.4;
    double normalHeight = itemHeight * 2.0 + 4.0;
    double expandedHeight = itemHeight * 4.0 + 4.0 * 3.0;
    return FutureBuilder(
        future: _loadData(),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            Map responseJson = json.decode(snapshot.data.toString());
            this.entity = HomeBroadcastEntity.fromJson(responseJson);
            List<String> allChannels = this.entity.data.categories.map((model) => model.name).toList();
            List<String>  preSevenTitles = allChannels.sublist(0,6);
            this.unexpandedChannelTitles.clear();
            this.expandedChannelTitles.clear();
            this.unexpandedChannelTitles.addAll(preSevenTitles);
            this.unexpandedChannelTitles.add("");
            this.unexpandedChannelTitles.add(kExpandChannelName);
            this.expandedChannelTitles.addAll(allChannels);
            this.expandedChannelTitles.add("");
            this.expandedChannelTitles.add(kUnExpandChannelName);

            return CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Container(
                    height: 90.0,
                    color: Colors.white,
                    child: buildGridViewChannel(),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Container(
                    height: isExpaned ? expandedHeight : normalHeight,
                    color: Colors.white,
                    child: creatGridTVChannels(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(left: 15.0,right: 15.0),
                    color: Colors.white,
                    height: 44.0,
                    child: createMoreChannelWidgetItem(this.entity.data.location),
                  ),
                ),

                SliverFixedExtentList(
                  delegate: SliverChildBuilderDelegate((ctx,index){
                    HomeBroadcastDataLocalradio model = this.entity.data.localRadios[index];
                    return buildListViewItem( model.coverLarge, model.name, model.programName, model.playCount);
                  },
                    childCount: this.entity.data.localRadios.length,
                  ),
                  itemExtent: 110.0,
                ),

                SliverToBoxAdapter(
                  child: Container(
                    color: Color(0xffdedede),
                    height: 10.0,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(left: 15.0,right: 15.0),
                    color: Colors.white,
                    height: 44.0,
                    child: createMoreChannelWidgetItem("排行榜"),
                  ),
                ),

                SliverFixedExtentList(
                  delegate: SliverChildBuilderDelegate((ctx,index){
                    HomeBroadcastDataTopradio model = this.entity.data.topRadios[index];
                    return buildListViewItem( model.coverLarge, model.name, model.programName, model.playCount);
                  },
                    childCount: this.entity.data.topRadios.length,
                  ),
                  itemExtent: 110.0,
                )
              ],
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }


  @override
  Widget build(BuildContext context) {
    print("🍎初始化广播页面");
    return  loadContentView(context);
  }
}
