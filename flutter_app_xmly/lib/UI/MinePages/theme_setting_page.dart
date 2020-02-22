import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/main_providers/theme_model.dart';
import 'package:provider/provider.dart';

class ThemeSettingPage extends StatelessWidget{
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange
  ];

  List<String> colorNames = [
    "红色",
    "蓝色",
    "绿色",
    "橙色"
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("猜你喜欢"),
          elevation: 0.0,
        ),
        body: ListView.separated(
            itemBuilder: itemView,
            separatorBuilder: (BuildContext context,int index){
              return Container(
                color: Colors.grey,
                height: 10.0,
              );
            },
            itemCount: colors.length)
    );
  }


  Widget itemView(BuildContext context,int index){
    ThemeModel model = Provider.of<ThemeModel>(context);
    return InkWell(
      onTap: (){
        model.changeThemeColor(colors[index]);
      },
      child: Container(
        color: colors[index],
        height: 44.0,
        padding: EdgeInsets.only(left: 15.0),
        alignment: Alignment.center,
        child: Text(colorNames[index],style: TextStyle(
            color: Colors.white,
            fontSize: 16.0
        ),),
      ),
    );
  }
}