
// 首页推荐data对应的模型 "moduleType":"focus"
class HomeRecomendDataModel {


  List<Null> thirdClickStatUrls;
  String adBucketIds;
  int targetId;
  List<Null> thirdShowStatUrls;
  String link;
  bool isShareFlag;
  bool isTrueExposure;
  List<Null> showTokens;
  String realLink;
  int isInternal;
  List<Null> clickTokens;
  String cover;
  bool isLandScape;
  int adType;
  int displayType;
  int adId;
  String dpRealLink;
  int openlinkType;
  bool isAd;
  int clickType;
  bool buttonShowed;
  int clickAction;

  HomeRecomendDataModel({this.thirdClickStatUrls, this.adBucketIds, this.targetId, this.thirdShowStatUrls, this.link, this.isShareFlag, this.isTrueExposure, this.showTokens, this.realLink, this.isInternal, this.clickTokens, this.cover, this.isLandScape, this.adType, this.displayType, this.adId, this.dpRealLink, this.openlinkType, this.isAd, this.clickType, this.buttonShowed, this.clickAction});

  HomeRecomendDataModel.fromJson(Map<String, dynamic> json) {
    if (json['thirdClickStatUrls'] != null) {
      thirdClickStatUrls = new List<Null>();
    }
    adBucketIds = json['adBucketIds'];
    targetId = json['targetId'];
    if (json['thirdShowStatUrls'] != null) {
      thirdShowStatUrls = new List<Null>();
    }
    link = json['link'];
    isShareFlag = json['isShareFlag'];
    isTrueExposure = json['isTrueExposure'];
    if (json['showTokens'] != null) {
      showTokens = new List<Null>();
    }
    realLink = json['realLink'];
    isInternal = json['isInternal'];
    if (json['clickTokens'] != null) {
      clickTokens = new List<Null>();
    }
    cover = json['cover'];
    isLandScape = json['isLandScape'];
    adType = json['adType'];
    displayType = json['displayType'];
    adId = json['adId'];
    dpRealLink = json['dpRealLink'];
    openlinkType = json['openlinkType'];
    isAd = json['isAd'];
    clickType = json['clickType'];
    buttonShowed = json['buttonShowed'];
    clickAction = json['clickAction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thirdClickStatUrls != null) {
      data['thirdClickStatUrls'] =  [];
    }
    data['adBucketIds'] = this.adBucketIds;
    data['targetId'] = this.targetId;
    if (this.thirdShowStatUrls != null) {
      data['thirdShowStatUrls'] =  [];
    }
    data['link'] = this.link;
    data['isShareFlag'] = this.isShareFlag;
    data['isTrueExposure'] = this.isTrueExposure;
    if (this.showTokens != null) {
      data['showTokens'] =  [];
    }
    data['realLink'] = this.realLink;
    data['isInternal'] = this.isInternal;
    if (this.clickTokens != null) {
      data['clickTokens'] =  [];
    }
    data['cover'] = this.cover;
    data['isLandScape'] = this.isLandScape;
    data['adType'] = this.adType;
    data['displayType'] = this.displayType;
    data['adId'] = this.adId;
    data['dpRealLink'] = this.dpRealLink;
    data['openlinkType'] = this.openlinkType;
    data['isAd'] = this.isAd;
    data['clickType'] = this.clickType;
    data['buttonShowed'] = this.buttonShowed;
    data['clickAction'] = this.clickAction;
    return data;
  }
}