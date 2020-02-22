import 'package:flutter/material.dart';

class HomeVipHotPlayListViewItem extends StatelessWidget{


  final String testUrl = "http://imagev2.xmcdn.com/group71/M05/10/B8/wKgO2V4jzUPTmQNGAAZ7pvEZkn8334.jpg!op_type=5&upload_type=album&device_type=ios&name=large&magick=png";

  List<String> titleList;
  List<String> coverList;

  double widthAndHeightRatio;
  double screenWidth = 375.0;

  HomeVipHotPlayListViewItem(this.titleList,this.coverList,this.widthAndHeightRatio);
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return _buildContentView();
  }

  // 创建子视图
  Widget _buildContentView(){

    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),//去除gridView本身的滚动
        itemCount: titleList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            childAspectRatio: widthAndHeightRatio
        ),
        itemBuilder: (BuildContext context,int index){
          return _buildGridViewItem(coverList[index], titleList[index]);
        });

  }

  Widget _buildGridViewItem(String cover,String title){
    return new Column(
      children: <Widget>[
        FadeInImage.assetNetwork(
          fit: BoxFit.cover,
          image: cover,
          placeholder: "images/placeholder.jpeg"/* 占位图片 */,
        ),
        SizedBox(height: 10.0,),
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(bottom: 3.0),
          height: 40.0,
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 14.0,
                color: Color(0xff333333)
            ),
          ),
        )
      ],
    );
  }
}