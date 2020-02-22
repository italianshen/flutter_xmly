//"moduleType":"topBuzz",
class HometopBuzzModel {

  String  albumId;
  String  albumTitle;
  int  commentsCounts;
  String  coverLarge;
  String  coverMiddle;

  String  coverSmall;
  int  createdAt;
  int  duration;
  int  favoritesCounts;
  int  id;
  bool isAuthorized;
  bool isFree;
  bool isPaid;
  bool isSample;
  bool isVideo;
  String nickname;
  String playPath32;
  String playPath64;

  String playPathAacv164;
  String playPathAacv224;

  int playsCounts;
  int priceTypeId;
  int sampleDuration;
  int sharesCounts;
  String tags;
  String title;
  int trackId;
  int uid;
  int updatedAt;
  int userSource;


  HometopBuzzModel.fromJson(Map<String,dynamic> json){
    title = json["title"];
    playPath32 = json["playPath32"];
    id = json["id"];
  }

  Map<String,dynamic> toJson() =>{
    "title":title,
    "playPath32":playPath32,
    "id":id
  };
}