
/// 直播排名模型
class HomeLiveRankLoopModel {
  String dimensionName;

  List<HomeLiveRankLoopRankModel> ranks;

  HomeLiveRankLoopModel.fromJson(Map<String,dynamic> json){
    dimensionName = json["dimensionName"];
    List ranksList = json["ranks"];
    if (ranksList != null){
      List<HomeLiveRankLoopRankModel> models = new List();
      ranksList.forEach((temp){
        models.add(HomeLiveRankLoopRankModel.fromJson(temp));
      });
      ranks = models;
    }else{
      ranks = new List();
    }
  }

  Map<String,dynamic> toJson() =>{
    "dimensionName":dimensionName
  };


}

class HomeLiveRankLoopRankModel {

  /// 封面
  String coverSmall;
  /// uid
  int uid;
  /// 昵称
  String nickname;


  HomeLiveRankLoopRankModel.fromJson(Map<String,dynamic> json){
    coverSmall = json["coverSmall"];
    uid = json["uid"];
    nickname = json["nickname"];
  }

  Map<String,dynamic> toJson() =>{
    "coverSmall":coverSmall,
    "uid":uid,
    "nickname":nickname
  };
}