import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeVipBannerWidget extends StatefulWidget{

  List<String> bannerArr;
  HomeVipBannerWidget(this.bannerArr);

  @override
  _HomeVipBannerWidgetState createState() {
    return _HomeVipBannerWidgetState();
  }
}

class _HomeVipBannerWidgetState extends State<HomeVipBannerWidget>{



  ///MARK: -  轮播图部分
  Widget _createBannerView(){
    double screenW = MediaQuery.of(context).size.width;
    double bannerH = screenW * 150/375;
    return ConstrainedBox(
        child: Swiper(
          autoplay: true,
          outer: false,
          itemBuilder: (c, i) {
            if(widget.bannerArr!=null){
              return new Image.network(
                widget.bannerArr[i],
                fit: BoxFit.fill,
              );
            }else{
              return new CircularProgressIndicator();
            }
          },
          pagination:
          new SwiperPagination(margin: new EdgeInsets.all(5.0)),
          itemCount: widget.bannerArr == null ? 0 : widget.bannerArr.length,
        ),
        constraints:
        new BoxConstraints.loose(new Size(MediaQuery.of(context).size.width, bannerH)
        )
    );
  }


  // 创建listViewItem
  Widget buildListViewItem(int index){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15.0,right: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            color: Colors.white,
            child: Image.asset("images/loading.jpg",fit: BoxFit.fill,),
          ),
          Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 12.0,right: 0.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("广东珠江经济电台广东珠江经济电台"),
                    Text("正在直播：拉阔星空广东珠江经济"),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Image.asset("images/ji.png"),
                          Text("525.8万"),
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Container(
            margin: EdgeInsets.only(right: 0.0,left: 15.0),
            child: Icon(Icons.play_arrow,size: 35.0,color: Colors.grey,),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  _createBannerView();
  }
}