class HomeVipEntity {
	int ret;
	String msg;
	HomeVipFocusimages focusImages;
	int serverMilliseconds;
	HomeVipCategorycontents categoryContents;

	HomeVipEntity({this.ret, this.msg, this.focusImages, this.serverMilliseconds, this.categoryContents});

	HomeVipEntity.fromJson(Map<String, dynamic> json) {
		ret = json['ret'];
		msg = json['msg'];
		focusImages = json['focusImages'] != null ? new HomeVipFocusimages.fromJson(json['focusImages']) : null;
		serverMilliseconds = json['serverMilliseconds'];
		categoryContents = json['categoryContents'] != null ? new HomeVipCategorycontents.fromJson(json['categoryContents']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['ret'] = this.ret;
		data['msg'] = this.msg;
		if (this.focusImages != null) {
      data['focusImages'] = this.focusImages.toJson();
    }
		data['serverMilliseconds'] = this.serverMilliseconds;
		if (this.categoryContents != null) {
      data['categoryContents'] = this.categoryContents.toJson();
    }
		return data;
	}
}

class HomeVipFocusimages {
	int ret;
	List<HomeVipFocusimagesData> data;
	int responseId;

	HomeVipFocusimages({this.ret, this.data, this.responseId});

	HomeVipFocusimages.fromJson(Map<String, dynamic> json) {
		ret = json['ret'];
		if (json['data'] != null) {
			data = new List<HomeVipFocusimagesData>();(json['data'] as List).forEach((v) { data.add(new HomeVipFocusimagesData.fromJson(v)); });
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

class HomeVipFocusimagesData {
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
	int displayType;
	int adType;
	int adId;
	int openlinkType;
	bool isAd;
	int clickType;
	bool buttonShowed;
	int clickAction;

	HomeVipFocusimagesData({this.thirdClickStatUrls, this.adBucketIds, this.targetId, this.thirdShowStatUrls, this.link, this.isShareFlag, this.isTrueExposure, this.showTokens, this.realLink, this.isInternal, this.clickTokens, this.cover, this.isLandScape, this.displayType, this.adType, this.adId, this.openlinkType, this.isAd, this.clickType, this.buttonShowed, this.clickAction});

	HomeVipFocusimagesData.fromJson(Map<String, dynamic> json) {
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
		displayType = json['displayType'];
		adType = json['adType'];
		adId = json['adId'];
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
		data['displayType'] = this.displayType;
		data['adType'] = this.adType;
		data['adId'] = this.adId;
		data['openlinkType'] = this.openlinkType;
		data['isAd'] = this.isAd;
		data['clickType'] = this.clickType;
		data['buttonShowed'] = this.buttonShowed;
		data['clickAction'] = this.clickAction;
		return data;
	}
}

class HomeVipCategorycontents {
	List<HomeVipCategorycontentsList> xList;
	String title;

	HomeVipCategorycontents({this.xList, this.title});

	HomeVipCategorycontents.fromJson(Map<String, dynamic> json) {
		title = json['title'];
		if (json['list'] != null) {
			xList = new List<HomeVipCategorycontentsList>();(json['list'] as List).forEach((v) { xList.add(new HomeVipCategorycontentsList.fromJson(v)); });
		}

	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		data['title'] = this.title;
		return data;
	}
}

class HomeVipCategorycontentsList {
	int keywordId;
	String keywordName;
	int moduleType;
	bool hasMore;
	String calcDimension;
	List<HomeVipCategorycontentsListList> xList;
	String title;
	String tagName;
	String contentType;
	String cardClass;

	HomeVipCategorycontentsList({this.keywordId, this.keywordName, this.moduleType, this.hasMore, this.calcDimension, this.xList, this.title, this.tagName, this.contentType, this.cardClass});

	HomeVipCategorycontentsList.fromJson(Map<String, dynamic> json) {
		keywordId = (json['keywordId'] != null ? json['keywordId'] : 0);
		keywordName = json['keywordName'] != null ? json['keywordName'] : "";
		moduleType = json['moduleType'];// 必有返回值
		hasMore = json['hasMore'] != null ? json['hasMore'] : false;
		calcDimension = json['calcDimension'] != null ? json['calcDimension'] : "";
		title = json['title'];
		if (json['list'] != null) {
			xList = new List<HomeVipCategorycontentsListList>();(json['list'] as List).forEach((v) { xList.add(new HomeVipCategorycontentsListList.fromJson(v)); });

			if(this.title == "热播新品" || this.title == "猜你喜欢"){
				xList = xList.sublist(0,3);
			}
		}

		tagName = json['tagName'] != null ? json['tagName'] : "";
		contentType = json['contentType'] != null ? json["contentType"] : "";
		cardClass = json['cardClass'] != null ? json['cardClass'] : "";
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['keywordId'] = this.keywordId;
		data['keywordName'] = this.keywordName;
		data['moduleType'] = this.moduleType;
		data['hasMore'] = this.hasMore;
		data['calcDimension'] = this.calcDimension;
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		data['title'] = this.title;
		data['tagName'] = this.tagName;
		data['contentType'] = this.contentType;
		data['cardClass'] = this.cardClass;
		return data;
	}
}

class HomeVipCategorycontentsListList {
	String sharePic;
	String coverPath;
	bool isExternalUrl;
	String bubbleText;
	String subtitle;
	int contentUpdatedAt;
	int id;
	bool enableShare;
	String title;
	String contentType;
	String url;
	String displayClass;
	int playsCounts;
	int tracks;
	bool isVipFree;

	HomeVipCategorycontentsListList({this.sharePic, this.coverPath, this.isExternalUrl, this.bubbleText, this.subtitle, this.contentUpdatedAt, this.id, this.enableShare, this.title, this.contentType, this.url, this.displayClass});

	HomeVipCategorycontentsListList.fromJson(Map<String, dynamic> json) {
		sharePic = json['sharePic'];
		coverPath = json['coverPath'] != null
				? json['coverPath']
				: (json['coverLarge'] != null ? json['coverLarge'] : json['coverSmall']);
		isExternalUrl = json['isExternalUrl'];
		bubbleText = json['bubbleText'];
		subtitle = json['subtitle'];
		contentUpdatedAt = json['contentUpdatedAt'];
		id = json['id'];
		enableShare = json['enableShare'];
		title = json['title'];
		contentType = json['contentType'];
		url = json['url'];
		displayClass = json['displayClass'];
		playsCounts = json['playsCounts'] != null ? json['playsCounts'] : 0;
		tracks = json['tracks'] != null ? json['tracks'] : 0;
		isVipFree = json['isVipFree'] != null ? json['isVipFree'] : true;

	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['sharePic'] = this.sharePic;
		data['coverPath'] = this.coverPath;
		data['isExternalUrl'] = this.isExternalUrl;
		data['bubbleText'] = this.bubbleText;
		data['subtitle'] = this.subtitle;
		data['contentUpdatedAt'] = this.contentUpdatedAt;
		data['id'] = this.id;
		data['enableShare'] = this.enableShare;
		data['title'] = this.title;
		data['contentType'] = this.contentType;
		data['url'] = this.url;
		data['displayClass'] = this.displayClass;
		return data;
	}
}
