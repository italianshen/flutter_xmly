import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_app_xmly/API/HomeApi.dart';
import 'dart:convert';
import 'package:flutter_app_xmly/Consts/Consts.dart';
import 'package:flutter_app_xmly/Model/play_detail_models/play_detail_entity.dart';
import 'package:flutter_app_xmly/main_providers/player_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NovelPlayPage extends StatefulWidget {

  /// 请求数据需要的参数
  PlayDetailDataTracksList track;
  /// 构造方法
  NovelPlayPage(this.track);

  @override
  _NovelPlayPageState createState() => _NovelPlayPageState();
}

class _NovelPlayPageState extends State<NovelPlayPage> {


  /// 播放器
  AudioPlayer audioPlayer = AudioPlayer();
  /// 滑块的值
  double _sliderValue = 0;
  /// 已播放的毫秒数
  int hasPlayedMillionSeconds = 0;

  /// 播放
  play(String url) async {
    int result = await audioPlayer.play(url);
    if (result == 1) {
      // success
      print('play success');
    } else {
      print('play failed');
    }
  }

  /// 继续
  resume() async {
    int result = await audioPlayer.resume();
    if (result == 1) {
      // success
      print('resume success');
    } else {
      print('resume failed');
    }
  }


  /// 暂停
  pause() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      // success
      print('pause success');
    } else {
      print('pause failed');
    }
  }


  /// 跳转
  jump(int startMilliseconds) async {
    int result = await audioPlayer.seek(new Duration(milliseconds: startMilliseconds));
    if (result == 1) {
      print('go to success');
    } else {
      print('go to failed');
    }
  }


  @override
  void initState() {
    super.initState();
    audioPlayer.onAudioPositionChanged.listen((p) async {
      // p参数可以获取当前进度，也是可以调整的，比如p.inMilliseconds
      double value = p.inMilliseconds.toDouble()/(widget.track.duration.toDouble() * 1000.0);
      setState(() {
        this.hasPlayedMillionSeconds = p.inMilliseconds;
        _sliderValue = 10.0 * value;
      });
    });
  }

  @override
  void deactivate() async{
    print('结束');
    int result = await audioPlayer.release();
    if (result == 1) {
      print('release success');
    } else {
      print('release failed');
    }
    super.deactivate();
  }


  /// 请求数据
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios,color: Colors.black,),
          onTap: (){
            PlayerStateModel model = Provider.of<PlayerStateModel>(context);
            model.changeState(PlayState.Play);
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 15.0),
            child: InkWell(
              child: Icon(Icons.more_horiz,color: Colors.black,),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 15.0),
            child: InkWell(
              child: Icon(Icons.share,color: Colors.black,),
            ),
          ),
        ],
      ),
      body: _createActivityView(context),
    );
  }

  /// 初始化动态视图
  Widget _createActivityView(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          /// 上面的专辑信息
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10.0,),
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(left: 15.0,right: 15.0),
                child: Text(widget.track.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                ),),
              ),
              SizedBox(height: 10.0,),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.width * 0.6,
                child:Image.network(
                  widget.track.coverLarge,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              _buildProgressWidget(context),
              _buildPlayAreaWidget(context, widget.track.playUrl64),
            ],
          )
        ],
      ),
    );
  }

  /// 创建进度条
  Widget _buildProgressWidget(BuildContext context){
    PlayerStateModel model = Provider.of<PlayerStateModel>(context);
    return  Container(
      margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
      height: 10.0,
      alignment: Alignment.center,
      child: Slider(
        value: _sliderValue,
        onChanged: (data){
          print('change:$data');
          /// 跳转到
          int millionSeconds = ((data/10.0) * widget.track.duration.toDouble()).toInt() * 1000;
          jump(millionSeconds);
          setState(() {
            this._sliderValue = data;
          });
        },
        onChangeStart: (data){
          print('start:$data');
        },
        onChangeEnd: (data){
          print('end:$data');
        },
        min: 0.0,
        max: 10.0,
        divisions: 10,
        label: '$_sliderValue',
        activeColor: Color.fromRGBO(254, 73, 42, 1.0),
        inactiveColor: Colors.grey,
        semanticFormatterCallback: (double newValue) {
          return '${newValue.round()} dollars}';
        },
      )

    );
  }

  /*时间*/
  /// 时间 参数 毫秒
  String getTime(int time){
    // 分
    int min = (time ~/ 1000) ~/ 60;
    // 秒
    int seconds = (time ~/ 1000) - min * 60;
    String m = min.toString().padLeft(2, "0");
    String s = seconds.toString().padLeft(2, "0").substring(0,2);
    return "$m:$s";
  }

  /// 构建播放区域按钮
  Widget _buildPlayAreaWidget(BuildContext context,String playUrl){
   return Consumer<PlayerStateModel>(
     builder: (context,model,_){
       return  Container(
         height: 42.0,
         color: Colors.white,
         alignment: Alignment.topCenter,
         padding: EdgeInsets.only(left: 15.0,right: 15.0),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Container(
               padding: EdgeInsets.only(top: 0.0,left: 2),
               color: Colors.white,
               child: Text(getTime(hasPlayedMillionSeconds)),
             ),
             InkWell(
               child: Image.asset(model.getPlayBtnIconName()),
               onTap: (){
                 print("播放");
                 if(model.state == PlayState.Play){
                   play(playUrl); // 按钮变成暂停
                   model.changeState(PlayState.Pause);
                 }else if (model.state == PlayState.Pause){
                   pause();// 暂停按钮变成播放
                   model.changeState(PlayState.Resume);
                 }else{
                   resume();
                   model.changeState(PlayState.Pause);
                 }
               },
             ),
             Container(
               padding: EdgeInsets.only(right: 6.0),
               color: Colors.white,
               child: Text(getTime(widget.track.duration * 1000)),
             ),
           ],
         ),
       );
     },
   );
  }

}
