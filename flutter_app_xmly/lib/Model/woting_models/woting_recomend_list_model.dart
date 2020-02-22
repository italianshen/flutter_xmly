class WotingRecomendListModel {

  String  coverSmall;//图片
  String  coverMiddle;// 图片
  String title;// 标题
  String  recReason;// 推荐理由
  int playsCount;
  int tracks;


  WotingRecomendListModel.fromJson(Map<String,dynamic> json){
    coverSmall = json["coverSmall"];
    coverMiddle = json["coverMiddle"];
    title = json["title"];
    recReason = json["recReason"];
    playsCount = json["playsCount"];
    tracks = json["tracks"];
  }

  Map<String,dynamic> toJson() =>{
    "coverSmall":coverSmall,
    "coverMiddle":coverMiddle,
    "title":title,
    "recReason":recReason,
    "playsCount":playsCount,
    "tracks":tracks
  };

}