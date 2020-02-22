import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/Model/home_live_models/home_live_rank_loop_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeLiveRankListPage extends StatelessWidget{

  List<HomeLiveRankLoopModel> modelList;


  /// 构造方法
  HomeLiveRankListPage(this.modelList);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _createBannerView(context);
  }

  /// 图片行
  Widget imageRow(HomeLiveRankLoopModel model){
    return Container(
      decoration: BoxDecoration(
          color: Color(0xfff2f2f2),
          borderRadius: BorderRadius.all(Radius.circular(8.0))
      ),
      child: Row(
        children: <Widget>[
          Expanded(child: Text(model.dimensionName)),
          Row(
            children: model.ranks.map((rank){
              return Container(
                height: 60.0,
                margin: EdgeInsets.only(left: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60.0),
                  child: new Image.network(
                    rank.coverSmall,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  ///MARK: -  轮播图部分
  Widget _createBannerView(BuildContext context){
    double screenW = MediaQuery.of(context).size.width;
    double bannerH = screenW * 150/375;
    return ConstrainedBox(
        child: Swiper(
          autoplay: true,
          outer: false,
          itemBuilder: (c, i) {
            HomeLiveRankLoopModel model = modelList[i];
            if(modelList!=null){
              return Container(
                decoration: BoxDecoration(
                  color: Color(0xfff2f2f2),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
                padding: EdgeInsets.only(left: 0.0,right: 0.0),
                child: imageRow(model),
              );
            }else{
              return new CircularProgressIndicator();
            }
          },
          pagination:
          new SwiperPagination(margin: new EdgeInsets.all(5.0)),
          itemCount: modelList == null ? 0 : modelList.length,
        ),
        constraints:
        new BoxConstraints.loose(new Size(MediaQuery.of(context).size.width, bannerH)
        )
    );
  }
}