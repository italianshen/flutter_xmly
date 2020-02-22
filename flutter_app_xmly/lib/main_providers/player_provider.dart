import 'package:flutter_app_xmly/Consts/Consts.dart';
import 'package:flutter/material.dart';


class PlayerStateModel with ChangeNotifier {
  /// 播放器状态
  PlayState state = PlayState.Play;

  /// 修改状态
  void changeState(PlayState mState){
    state = mState;
    notifyListeners();
  }

  /// 获取播放按钮
  String getPlayBtnIconName(){
    if(state == PlayState.Play){
      return "images/toolbar_play_n_p_78x78_@2x.png";
    }else if (state == PlayState.Pause){
      //images/toolbar_pause_n_p_78x78_@2x.png
      return "images/toolbar_pause_n_p_78x78_@2x.png";
    }else if (state == PlayState.Resume){
      return "images/toolbar_play_n_p_78x78_@2x.png";
    }else{
      return "images/toolbar_play_n_p_78x78_@2x.png";
    }
  }
}

