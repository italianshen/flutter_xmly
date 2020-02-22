import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/Model/home_recomen_model/hot_item_server_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'WebviewDetailPage.dart';

class HomeBannerWidget extends StatefulWidget{

  @override
  _HomeBannerWidgetState createState() {
    return _HomeBannerWidgetState();
  }
}

class _HomeBannerWidgetState extends State<HomeBannerWidget>{

  final List<String> bannerArr =
  [
    "http://fdfs.xmcdn.com/group71/M0A/64/40/wKgO2V5BWdnj6dV8AAI81t5f65c279.jpg",
    "http://fdfs.xmcdn.com/group71/M02/3D/32/wKgO2V4mk6TB_v8oAAHib82saSM098.jpg",
    "http://fdfs.xmcdn.com/group55/M0B/24/C0/wKgLdVxr18TyJ2nlAAIJVSk2i_o322.jpg",
    "http://fdfs.xmcdn.com/group71/M05/5B/A0/wKgOz15BK9eRFnTkAAG2Tv7QfrM411.jpg",
    "http://fdfs.xmcdn.com/group71/M01/57/A5/wKgOz15BEiXSbUnHAAHo6gOfZSw117.jpg",
    "http://fdfs.xmcdn.com/group72/M04/E5/D1/wKgO0F4zmsjCSJLTAAEuNa_2G6E140.jpg",
    "http://fdfs.xmcdn.com/group72/M05/78/6B/wKgO0F5BB8qAv0vwAAI5B-YaaG4217.jpg",
    "http://fdfs.xmcdn.com/group71/M09/54/9D/wKgO2V5A_e6xcwGBAAG72DcZ-Vg111.jpg",
    "http://fdfs.xmcdn.com/group60/M03/09/4F/wKgLb12d3KOzrM-RAAHt3fjseh8541.jpg"
  ];

  // 获取本地json
  List<HomeHotItemServerModel> hotItems = new List();

  ///MARK: -  轮播图部分
  Widget _createBannerView(){
    double screenW = MediaQuery.of(context).size.width;
    double bannerH = screenW * 150/375;
    return ConstrainedBox(
        child: Swiper(
          autoplay: true,
          outer: false,
          itemBuilder: (c, i) {
            if(bannerArr!=null){
              return new Image.network(
                bannerArr[i],
                fit: BoxFit.fill,
              );
            }else{
              return new CircularProgressIndicator();
            }
          },
          pagination:
          new SwiperPagination(margin: new EdgeInsets.all(5.0)),
          itemCount: bannerArr == null ? 0 : bannerArr.length,
        ),
        constraints:
        new BoxConstraints.loose(new Size(MediaQuery.of(context).size.width, bannerH)
        )
    );
  }

  // 热门入口


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  /// 初始化热门item的数据
  _initHotsItemsData(BuildContext context) {
    Future<String> data = DefaultAssetBundle.of(context).loadString("config/hot_item.json");

    data.then((String value){
      setState(() {
         List<dynamic> data = json.decode(value);
         data.forEach((temp){
           hotItems.add(HomeHotItemServerModel.fromJson(temp));
         });
      });
    });

    // 遍历打印
    hotItems.forEach((model){
      String title = model.title;
      print("😂 模型数据:$title");
    });
  }


  /// 创建girdview的列表项
  Widget _createHotItemView(BuildContext context,int index){
    return new InkWell(
      onTap: (){
        print("点击了item:$index");
        // 获取点击的数据
        HomeHotItemServerModel model = this.hotItems[index];
        if(model.url.isEmpty){
          Fluttertoast.showToast(msg: "url is empty");
        }else{
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return WebviewDetailPage(
              postId: model.id.toString(),
              url: model.url,
              title: model.title,
            );
          }));
        }

      },
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
            child: Image.network(hotItems[index].coverPath,
              width: 40.0,height: 40.0,),),
          Text(hotItems[index].title)
        ],
      ),
    );
  }

  /// 初始化热门视图
  Widget createHotItem(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("config/hot_item.json"),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            List responseJson = json.decode(snapshot.data.toString());
            hotItems = responseJson.map((temp) => HomeHotItemServerModel.fromJson(temp)).toList();
            return Container(
              height: 80.0,
              width: double.infinity,
              color: Colors.white,
              child: GridView.builder(
                  physics: new NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: hotItems.length,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1.0
                  ),
                  itemBuilder: _createHotItemView,
                  itemCount: hotItems.length,
              )
            );
          }else{
            return Container(
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: Text("正在加载中"),
              ),
            );
          }
        });
  }

  /// 听头条栏目
  Widget _listenToutiaoItem(){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15.0,right: 15.0),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Image.asset("images/news.png",width: 60,height: 30,),
          SizedBox(width: 10.0,),
          Expanded(child: Text(
              "企业复工要为职工准备口罩",
               maxLines: 1,
               style: TextStyle(
                fontSize: 16.0,
                color: Colors.black
               ),
          ),),
          SizedBox(width: 10.0,),
          Text("|  更多",style: TextStyle(
            fontSize: 15.0,
            color: Colors.grey
          ),)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _createBannerView(),
        createHotItem(context),
        _listenToutiaoItem()
      ],
    );
  }

}