import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/UI/live_category_detail_widgets/HomeLiveCategoryDetailPage.dart';

class HotHeaderView extends StatelessWidget{

  List<String> imageArray = [
    "http://fdfs.xmcdn.com/group45/M08/74/91/wKgKlFtVs-iBg01bAAAmze4KwRQ177.png",
    "http://fdfs.xmcdn.com/group48/M0B/D9/96/wKgKlVtVs9-TQYseAAAsVyb1apo685.png",
    "http://fdfs.xmcdn.com/group48/M0B/D9/92/wKgKlVtVs9SwvFI6AAAdwAr5vEE640.png",
    "http://fdfs.xmcdn.com/group48/M02/63/E3/wKgKnFtW37mR9fH7AAAcl17u2wA113.png",
    "http://fdfs.xmcdn.com/group46/M09/8A/98/wKgKlltVs3-gubjFAAAxXboXKFE462.png"
  ];


  List<String> titleArray = ["温暖男声","心动女神","唱将达人","情感治愈","直播圈子"];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _createGirdView(context);
  }

  Widget _createGirdView(BuildContext context){
    double screenW = MediaQuery.of(context).size.width;
    double ratio = ((screenW - 40 - 30)/2.0)/210.0;
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),//去除gridView本身的滚动
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: imageArray.length,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        childAspectRatio: ratio
      ),
      itemBuilder: _createGridViewItem,
      itemCount: imageArray.length,
    );

  }

  Widget _createGridViewItem(BuildContext context,int index){
    return InkWell(
      onTap: (){
        // 跳转到详情页
       //HomeLiveCategoryDetailPage
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return HomeLiveCategoryDetailPage(index + 5,titleArray[index]);
        }));
      },
      child: Container(
        color: Colors.white,
        height: 90.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 8.0,),
            Image.network(imageArray[index],width: 45.0,height: 45.0,),
            SizedBox(height: 6.0,),
            Expanded(child: Text(titleArray[index],style: TextStyle(
                fontSize: 13.0,
                color: Colors.black
            ))),
          ],
        ),
      ),
    );
  }

}