import 'package:flutter/material.dart';

class HomeVipGuessYouLikeItem extends StatelessWidget{


  List<String> titleList;// 标题
  List<String> subTitleList;// 副标题
  List<String> tagList;// tag标签 会员免费标签
  List<String> coverList;// 封面

  double widthAndHeightRatio;
  double screenWidth = 375.0;

  HomeVipGuessYouLikeItem(
      this.titleList,
      this.subTitleList,
      this.tagList,
      this.coverList,
      this.widthAndHeightRatio);

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
          return _buildGridViewItem(
              coverList[index],
              titleList[index],
              subTitleList[index],
              tagList[index]);
        });

  }

  Widget _buildGridViewItem(
      String cover,
      String title,
      String subTitle,
      String tagName){
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FadeInImage.assetNetwork(
          fit: BoxFit.cover,
          image: cover,
          placeholder: "images/placeholder.jpeg"/* 占位图片 */,
        ),
        SizedBox(height: 5.0,),
        Container(
          padding: EdgeInsets.only(bottom: 0.0),
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
        ),
        SizedBox(height: 6.0,),
        Padding(
            padding: EdgeInsets.only(left: 0.0,right: 0.0),
            child: Container(
              padding: EdgeInsets.only(left: 0.0,right: 0.0,top: 2.0,bottom: 2.0),
              child: Text(
                subTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.red
                ),
              ),
            )
        ),

        SizedBox(height: 6.0,),
        Padding(
            padding: EdgeInsets.only(left: 0.0,right: 0.0),
            child: Container(
              decoration: new BoxDecoration(
                color: Color.fromRGBO(203, 148, 95, 1),
                borderRadius: BorderRadius.circular(5.0)
              ),
              padding: EdgeInsets.only(left: 5.0,right: 5.0,top: 2.0,bottom: 2.0),
              child: Text(
                tagName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white
                ),
              ),
            )
        ),
      ],
    );
  }

}