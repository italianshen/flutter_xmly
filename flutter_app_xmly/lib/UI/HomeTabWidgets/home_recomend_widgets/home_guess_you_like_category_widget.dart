import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/Model/home_recomen_model/recomend_entity.dart';
//RecomandList
class HomeGuessYoulikeTypeWidget extends StatelessWidget{

  final RecomandList _model;

  HomeGuessYoulikeTypeWidget(this._model);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _createGuessYouLikeRow(context);
  }

  Widget _createGuessYouLikeRow(BuildContext context){
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

}
