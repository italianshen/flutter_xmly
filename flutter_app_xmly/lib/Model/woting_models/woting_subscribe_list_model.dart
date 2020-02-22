class WotingSubscribeListModel{

  String  albumCover;//图片
  String  albumTitle;// 标题
  String  trackTitle;// 推薦理由
  int     lastUpdateAt;///更新時間


  WotingSubscribeListModel.fromJson(Map<String,dynamic> json){
    albumCover = json["albumCover"];
    albumTitle = json["albumTitle"];
    trackTitle = json["trackTitle"];
    lastUpdateAt = json["lastUpdateAt"];
  }

  Map<String,dynamic> toJson() =>{
    "albumCover":albumCover,
    "albumTitle":albumTitle,
    "lastUpdateAt":lastUpdateAt,
    "trackTitle":trackTitle
  };

}