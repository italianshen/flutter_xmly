class WotingListenListModel {

  String  channelName;///频道名称
  String  slogan;/// 口号
  String  cover;/// 图片


  WotingListenListModel.fromJson(Map<String,dynamic> json){
    channelName = json["channelName"];
    slogan = json["slogan"];
    cover = json["cover"];
  }

  Map<String,dynamic> toJson() =>{
    "channelName":channelName,
    "slogan":slogan,
    "cover":cover
  };
}