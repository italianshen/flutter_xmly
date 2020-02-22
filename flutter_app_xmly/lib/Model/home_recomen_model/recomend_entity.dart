class RecomendEntity {
	int ret;
	String msg;
	String code;
	List<RecomandList> xList;

	RecomendEntity({this.ret, this.msg, this.code, this.xList});

	RecomendEntity.fromJson(Map<String, dynamic> json) {
		ret = json['ret'];
		msg = json['msg'];
		code = json['code'];
		if (json['list'] != null) {
			xList = new List<RecomandList>();(json['list'] as List).forEach((v) { xList.add(new RecomandList.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['ret'] = this.ret;
		data['msg'] = this.msg;
		data['code'] = this.code;
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class RecomandList {
	String moduleType;
	List<RecomandListKeywords> keywords;
	bool bottomHasMore;
	bool hasMore;
	List<RecomandListList> xList;
	bool isNewUser;
	String title;
	RecomendListTarget target;
	int loopCount;
	bool showInterestCard;
	int moduleId;
	int categoryId;
	String direction;

	RecomandList({this.moduleType, this.keywords, this.bottomHasMore, this.hasMore, this.xList, this.isNewUser, this.title, this.target, this.loopCount, this.showInterestCard, this.moduleId, this.categoryId, this.direction});

	RecomandList.fromJson(Map<String, dynamic> json) {
		moduleType = json['moduleType'];
		if (json['keywords'] != null) {
			keywords = new List<RecomandListKeywords>();(json['keywords'] as List).forEach((v) { keywords.add(new RecomandListKeywords.fromJson(v)); });
		}
		bottomHasMore = json['bottomHasMore'];
		hasMore = json['hasMore'];
		if (json['list'] != null) {// list

			xList = new List<RecomandListList>();(json['list'] as List).forEach((v) { xList.add(new RecomandListList.fromJson(v)); });
		}
		isNewUser = json['isNewUser'];
		title = json['title'];
		target = json['target'] != null ? new RecomendListTarget.fromJson(json['target']) : null;
		loopCount = json['loopCount'];
		showInterestCard = json['showInterestCard'];
		moduleId = json['moduleId'];
		categoryId = json['categoryId'];
		direction = json['direction'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['moduleType'] = this.moduleType;
		if (this.keywords != null) {
      data['keywords'] =  this.keywords.map((v) => v.toJson()).toList();
    }
		data['bottomHasMore'] = this.bottomHasMore;
		data['hasMore'] = this.hasMore;
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		data['isNewUser'] = this.isNewUser;
		data['title'] = this.title;
		if (this.target != null) {
      data['target'] = this.target.toJson();
    }
		data['loopCount'] = this.loopCount;
		data['showInterestCard'] = this.showInterestCard;
		data['moduleId'] = this.moduleId;
		data['categoryId'] = this.categoryId;
		data['direction'] = this.direction;
		return data;
	}
}

class RecomandListKeywords {
	int keywordId;
	String keywordName;
	String materialType;
	String categoryTitle;
	int keywordType;
	int categoryId;
	int realCategoryId;

	RecomandListKeywords({this.keywordId, this.keywordName, this.materialType, this.categoryTitle, this.keywordType, this.categoryId, this.realCategoryId});

	RecomandListKeywords.fromJson(Map<String, dynamic> json) {
		keywordId = json['keywordId'];
		keywordName = json['keywordName'];
		materialType = json['materialType'];
		categoryTitle = json['categoryTitle'];
		keywordType = json['keywordType'];
		categoryId = json['categoryId'];
		realCategoryId = json['realCategoryId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['keywordId'] = this.keywordId;
		data['keywordName'] = this.keywordName;
		data['materialType'] = this.materialType;
		data['categoryTitle'] = this.categoryTitle;
		data['keywordType'] = this.keywordType;
		data['categoryId'] = this.categoryId;
		data['realCategoryId'] = this.realCategoryId;
		return data;
	}
}

class RecomandListList {
	int ret;
	List<RecomendListListData> data;
	int responseId;

	RecomandListList({this.ret, this.data, this.responseId});

	RecomandListList.fromJson(Map<String, dynamic> json) {
		ret = json['ret'];
		if (json['data'] != null) {
			data = new List<RecomendListListData>();(json['data'] as List).forEach((v) { data.add(new RecomendListListData.fromJson(v)); });
		}
		responseId = json['responseId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['ret'] = this.ret;
		if (this.data != null) {
      data['data'] =  this.data.map((v) => v.toJson()).toList();
    }
		data['responseId'] = this.responseId;
		return data;
	}
}

class RecomendListListData {
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

	RecomendListListData({this.thirdClickStatUrls, this.adBucketIds, this.targetId, this.thirdShowStatUrls, this.link, this.isShareFlag, this.isTrueExposure, this.showTokens, this.realLink, this.isInternal, this.clickTokens, this.cover, this.isLandScape, this.adType, this.displayType, this.adId, this.dpRealLink, this.openlinkType, this.isAd, this.clickType, this.buttonShowed, this.clickAction});

	RecomendListListData.fromJson(Map<String, dynamic> json) {
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

class RecomendListTarget {
	int groupId;

	RecomendListTarget({this.groupId});

	RecomendListTarget.fromJson(Map<String, dynamic> json) {
		groupId = json['groupId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['groupId'] = this.groupId;
		return data;
	}
}
