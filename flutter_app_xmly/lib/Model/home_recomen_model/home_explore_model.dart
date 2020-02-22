

/// "moduleType":"categoriesForExplore",
class HomeExploreModel {

  String  albumId;
  String  albumIntro;
  int  categoryId;
  int  commentsCount;
  int  contractStatus;

  String  infoType;
  bool  isDraft;
  bool  isFinished;
  bool  isFollowing;
  bool   isPaid;
  bool isVipFree;
  int  lastUptrackAt;
  String materialType;
  String nickname;
  int  originalStatus;
  String pic;
  int playsCount;

  int preferredType;
  int priceTypeEnum;

  String recSrc;
  String recTrack;
  int refundSupportType;
  bool subscribeStatus;
  String subtitle;
  String title;
  int tracksCount;
  int type;
  int vipFreeType;


  HomeExploreModel.fromJson(Map<String,dynamic> json){
    title = json["title"];
    subtitle = json["subtitle"];
    albumId = json["albumId"];
    categoryId = json["categoryId"];
    pic = json["pic"];
    tracksCount = json["tracksCount"];
    playsCount = json["playsCount"];

  }

  Map<String,dynamic> toJson() =>{
    "title":title,
    "subtitle":subtitle,
    "albumId":albumId,
    "categoryId":categoryId,
    "pic":pic
  };

}