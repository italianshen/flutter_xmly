
class BaseResponseModel {
  String msg = "";
  int ret = -1;// ret = 0算请求成功
  bool hasInterest = false;
  bool hasMore = true;
  String title = "";
  int totalCount = 0;
  // 列表数据
  List<dynamic> list = [];

  BaseResponseModel.fromJson(Map<String,dynamic> json){
    msg = json["msg"];
    ret = json["ret"];
    hasInterest = json["hasInterest"];
    hasMore = json["hasMore"];
    totalCount = json["totalCount"];
    list = json["list"];
  }
}

class BaseListModel {

}

class HomeGuessYouLikeListModel extends BaseListModel{
  int ageLevel = 0;
  String albumCoverUrl290 = "";// 专辑封面
  int albumId = 0;

  int albumType = 0;
  int basedRelativeAlbumId = 0;
  int categoryId = 0;

  String categoryTag = "";// 专辑封面
  int commentsCount = 0;
  int contractStatus = 0;

  String coverLarge = "";//大
  String coverMiddle = "";//中
  String coverSmall = "";//小

  // 不喜欢的理由
  Map<String,dynamic> dislikeReasons = {};

  bool draft = true;
  int id = 0;
  int isFinished = 0;
  bool isPaid = true;

  int lastUptrackAt = 0;
  int lastUptrackId = 0;

  String lastUptrackTitle = "";
  String materialType = "";

  String nickname = "";

  int playsCounts = 0;
  int preferredType = 0;

  int priceTypeEnum = 0;
  int priceTypeId = 0;
  String provider = "";

  String recReason = "";//根据你的兴趣推荐
  String recSrc = "";

  String recTrack = "";
  int refundSupportType = 0;
  int serialState = 0;
  int subscribesCounts = 0;

  String tags = "";
  String title = "";
  int trackId = 0;
  String trackTitle = "";
  int tracks = 0;
  int tracksCounts = 0;
  int type = 0;
  int uid = 0;
  bool vipFree = false;
  int vipFreeType = 0;

  HomeGuessYouLikeListModel.fromJson(Map<String,dynamic> json)
      :title = json["title"],
        recReason = json["recReason"],
        subscribesCounts = json["subscribesCounts"],
        tracks = json["tracks"],
        coverMiddle = json["coverMiddle"],
        coverSmall = json["coverSmall"],
        coverLarge = json["coverLarge"],
        playsCounts = json["playsCounts"];



  Map<String,dynamic> toJson() =>{
    "title":title,
    "recReason":recReason,
    "subscribesCounts":subscribesCounts,
    "tracks":tracks,
    "coverMiddle":coverMiddle,
    "coverSmall":coverSmall,
    "coverLarge":coverLarge
  };
}