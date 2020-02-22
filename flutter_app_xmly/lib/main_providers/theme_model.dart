import 'package:flutter_app_xmly/Consts/Consts.dart';
import 'package:flutter/material.dart';

class ThemeModel with ChangeNotifier {
  /// 播放器状态
  ThemeType type = ThemeType.Night;

  /// 主题颜色
  Color themeColor = Colors.blueAccent;

  /// 修改状态
  void changeThemeType(ThemeType mType){
    type = mType;
    notifyListeners();
  }

  /// 切换主题
  void reverseThemeType(){
    if(type == ThemeType.Night){
      type = ThemeType.Day;
    }else{
      type = ThemeType.Night;
    }
    notifyListeners();
  }

  // 获取主题颜色
  Color getCurrentThemeColor(){
    return themeColor;
  }

  /// 修改主题颜色
  void changeThemeColor(Color color){
    themeColor = color;
    notifyListeners();
  }

  /// 获取标题
  String getModeTypeText(){
    return "设置主题";
  }
}