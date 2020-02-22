class HomeCityCategoryModel {

  String  albumId;
  String infoType;
  String intro;
  bool  isDraft;
  bool  isFinished;
  bool   isPaid;
  bool isVipFree;
  String materialType;
  String nickname;
  String pic;
  int playsCount;

  int refundSupportType;
  bool subscribeStatus;
  String subtitle;
  String title;
  int tracksCount;
  int type;
  int vipFreeType;


  HomeCityCategoryModel.fromJson(Map<String,dynamic> json){
    title = json["title"];
    subtitle = json["subtitle"];
    albumId = json["albumId"];
    intro = json["intro"];
    pic = json["pic"];
    tracksCount = json["tracksCount"];
    playsCount = json["playsCount"];
    nickname = json["nickname"];
    playsCount = json["playsCount"];
  }

  Map<String,dynamic> toJson() =>{
    "title":title,
    "subtitle":subtitle,
    "albumId":albumId,
    "intro":intro,
    "pic":pic
  };

}