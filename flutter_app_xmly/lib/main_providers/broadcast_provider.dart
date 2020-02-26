
import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/Consts/Consts.dart';
/// 广场数据
class SquarePanelStateModel with ChangeNotifier {
  /// 播放器状态
  SquareState state = SquareState.Unexpanded;

  /// 修改状态
  void changeState(SquareState mState){
    state = mState;
    notifyListeners();
  }
}