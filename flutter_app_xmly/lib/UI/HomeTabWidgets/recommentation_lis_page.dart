import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/API/HomeApi.dart';
import 'package:flutter_app_xmly/Model/BaseResponseModel.dart';
import 'package:flutter_app_xmly/Model/home_recomen_model/home_recomend_base_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:dio/dio.dart';

import 'home_recomend_widgets/home_banner_widget.dart';
import 'package:flutter_app_xmly/Model/home_recomen_model/recomend_response_entity.dart';

import 'home_recomend_widgets/home_category_widget.dart';
// 效果图https://juejin.im/post/5b97743df265da0af21351aa
class HomeRecommendPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _HomeRecommendPageState();
  }
}

class _HomeRecommendPageState extends State<HomeRecommendPage> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin{

  final List<String> bannerArr = ["https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562723625662&di=bc7be59dd27706ea65ea33a94c209477&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F12%2F40%2F43%2F18958PICYpQ.jpg",
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562723734494&di=864f7b85f900f0b68e8bc08f1c078eed&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201511%2F02%2F20151102140204_WUSwE.jpeg",
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562723821634&di=e04d14690229411a560ccc6cf0e10f6a&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F15%2F01%2F96%2F56N58PICVWw_1024.jpg"];

  // 首页网络请求工具类
  HomeApi _homeApi = HomeApi();

  ///列表数据源
  List<HomeRecomendBaseListModel> dataSource;

  @override bool get wantKeepAlive => true;

  Widget createGuessYouLikeRow(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    double gridViewItemWidth = (screenWidth - 30.0 - 2.0 * 10.0)/3.0;
    double gridViewContentHeight = gridViewItemWidth/0.6 * 2.0 + 10.0;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.only(top: 10.0,bottom: 0.0,left: 15.0,right: 15.0),
      child: new Column(
        children: <Widget>[
          new Container(
            color: Colors.white,
            padding: EdgeInsets.only(bottom: 10.0),child: new Row(
            children: <Widget>[
              Expanded(child: Text("猜你喜欢")),
              InkWell(
                child: Text('更多 >'),
                onTap: (){
                  Navigator.of(context).pushNamed("guess_you_like_list_page");
                },
              )
            ],
          ),),
          new Container(
            width: double.infinity,
            height: gridViewContentHeight,
            color: Colors.white,
            child: new GridView.custom(
                physics: const NeverScrollableScrollPhysics(),//去除gridView本身的滚动
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 0.6
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                (BuildContext context,int index){
                  return Container(
                    color: Colors.grey,
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: gridViewItemWidth ,
                          height: gridViewItemWidth,
                          color: Colors.orange,
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
                            child: Text("精选DJ歌曲"),),
                        Text("2019精选热门歌曲推荐"),
                      ],
                    ),
                  );
                },
                  childCount: 6
                )),
          ),
          new Container(
            alignment: Alignment.center,
            color: Colors.white,
            padding: EdgeInsets.only(bottom: 10.0,top: 10.0),
            child: FlatButton(
                onPressed: (){
                  debugPrint("点击换一批");
                },
                child: Text("换一批"),
                color: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)
              ),
            )
          ),
        ],
      ),
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataSource = new List();
    // 获取数据
    _homeApi.requestRecommendListData((responseJson){
      if (responseJson is Map){
        Map<String,dynamic> json = responseJson as Map<String,dynamic>;
        BaseResponseModel model = BaseResponseModel.fromJson(json);
        List<Map<String,dynamic>> listArr = new List<Map<String,dynamic>>.from(model.list);
        // list 遍历
        listArr.forEach((temp){
          HomeRecomendBaseListModel listModel = HomeRecomendBaseListModel.fromJson(temp);
          // 匹配 HomeCategoryWidget
          dataSource.add(listModel);
          if(this.mounted){
            setState(() {});
          }
        });
      }else{
        print("🐶返回数据异常，不是map");
      }
    }, (error){
      debugPrint("请求失败:$error");
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dataSource.length == 0
          ? new Center(
            child: CircularProgressIndicator(),
          )
          : new ListView.builder(
          itemCount: dataSource.length,
          itemBuilder: (BuildContext context,int index){
            HomeRecomendBaseListModel model = dataSource[index];
            // 如果是第一个直接返回banner
            if (index == 0){
              return HomeBannerWidget();
            }else if (index == 1){//数据源是 热门的按钮
              return Container(
                height: 5.0,
                color: Color(0xfff2f2f2),
              );
            }else if (index == 2){// 数据源是听头条
              return Container(
                height: 5.0,
                color: Color(0xfff2f2f2),
              );
            }else{
              if(model.list == null){
                return Container(
                  height: 0.0,
                  color: Colors.orange,
                );
              }
              return HomeCategoryWidget(model);
            }
          }),
    );
  }
}
