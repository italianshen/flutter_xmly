// "moduleType":"guessYouLike",


class HomeLiveModel {

  String actualStartAt;
  int categoryId;
  String categoryName;
  int chatId;
  String coverLarge;
  String coverMiddle;
  String coverSmall;
  int endAt;
  int id;
  String name;
  String nickname;
  int playCount;
  String recSrc;
  String recTrack;
  int roomId;
  int startAt;
  int status;
  int uid;


  HomeLiveModel.fromJson(Map<String,dynamic> json){
    actualStartAt =  json["actualStartAt"];
    categoryId = json["categoryId"];
    categoryName = json["categoryName"];
    chatId = json["chatId"];
    coverLarge = json["coverLarge"];
    coverMiddle = json["coverMiddle"];
    coverSmall = json["coverSmall"];
    endAt = json["endAt"];
    id = json["id"];
    name = json["name"];
    nickname =  json["nickname"];
    playCount = json["playCount"];
    recSrc  = json["recSrc"];
    recTrack = json["recTrack"];
    roomId = json["roomId"];
    startAt=json["startAt"];
    status = json["status"];
    uid = json["uid"];

  }

  Map<String,dynamic> toJson() =>{
    "categoryName":categoryName,
    "coverSmall":coverSmall,
    "name":name,
    "nickname":nickname
  };
}