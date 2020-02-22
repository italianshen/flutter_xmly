class HomeNovelListModel {

  int  albumId;
  String  albumIntro;
  int  categoryId;
  int  commentsCount;
  int  contractStatus;

  String  infoType;
  bool  isDraft;
  int  isFinished;
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


  HomeNovelListModel.fromJson(Map<String,dynamic> json){
    title = json["title"];
    subtitle = json["subtitle"];
    if(json["albumId"] != null){
      albumId = json["albumId"];
    }

    if(json["categoryId"] != null){
      categoryId = json["categoryId"];
    }

    if(json["pic"] != null){
      pic = json["pic"];
    }

    if(json["tracksCount"] != null){
      tracksCount = json["tracksCount"];
    }

    if(json["playsCount"] != null){
      playsCount = json["playsCount"];
    }
    if (json["coverPath"] != null){
      pic = json["coverPath"];
    }

    //lastUptrackAt
    lastUptrackAt = json["lastUptrackAt"] != null ? json["lastUptrackAt"] : 0;
  }

  Map<String,dynamic> toJson() =>{
    "title":title,
    "subtitle":subtitle,
    "albumId":albumId,
    "categoryId":categoryId,
    "pic":pic
  };


}