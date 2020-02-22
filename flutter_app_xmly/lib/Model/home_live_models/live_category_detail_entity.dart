class LiveCategoryDetailEntity {
	int ret;
	LiveCategoryDetailData data;

	LiveCategoryDetailEntity({this.ret, this.data});

	LiveCategoryDetailEntity.fromJson(Map<String, dynamic> json) {
		ret = json['ret'];
		data = json['data'] != null ? new LiveCategoryDetailData.fromJson(json['data']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['ret'] = this.ret;
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		return data;
	}
}

class LiveCategoryDetailData {
	LiveCategoryDetailDataHomepagevo homePageVo;
	LiveCategoryDetailDataMaterialvo materialVo;
	LiveCategoryDetailDataFocuspictureadresponsefacade focusPictureAdResponseFacade;

	LiveCategoryDetailData({this.homePageVo, this.materialVo, this.focusPictureAdResponseFacade});

	LiveCategoryDetailData.fromJson(Map<String, dynamic> json) {
		homePageVo = json['homePageVo'] != null ? new LiveCategoryDetailDataHomepagevo.fromJson(json['homePageVo']) : null;
		materialVo = json['materialVo'] != null ? new LiveCategoryDetailDataMaterialvo.fromJson(json['materialVo']) : null;
		focusPictureAdResponseFacade = json['focusPictureAdResponseFacade'] != null ? new LiveCategoryDetailDataFocuspictureadresponsefacade.fromJson(json['focusPictureAdResponseFacade']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.homePageVo != null) {
      data['homePageVo'] = this.homePageVo.toJson();
    }
		if (this.materialVo != null) {
      data['materialVo'] = this.materialVo.toJson();
    }
		if (this.focusPictureAdResponseFacade != null) {
      data['focusPictureAdResponseFacade'] = this.focusPictureAdResponseFacade.toJson();
    }
		return data;
	}
}

class LiveCategoryDetailDataHomepagevo {
	bool lastPage;
	List<LiveCategoryDetailDataHomepagevoLife> lives;
	int pageSize;
	int pageId;

	LiveCategoryDetailDataHomepagevo({this.lastPage, this.lives, this.pageSize, this.pageId});

	LiveCategoryDetailDataHomepagevo.fromJson(Map<String, dynamic> json) {
		lastPage = json['lastPage'];
		if (json['lives'] != null) {
			lives = new List<LiveCategoryDetailDataHomepagevoLife>();(json['lives'] as List).forEach((v) { lives.add(new LiveCategoryDetailDataHomepagevoLife.fromJson(v)); });
		}
		pageSize = json['pageSize'];
		pageId = json['pageId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['lastPage'] = this.lastPage;
		if (this.lives != null) {
      data['lives'] =  this.lives.map((v) => v.toJson()).toList();
    }
		data['pageSize'] = this.pageSize;
		data['pageId'] = this.pageId;
		return data;
	}
}

class LiveCategoryDetailDataHomepagevoLife {
	String coverMiddle;
	int permissionType;
	int chatId;
	String avatar;
	int type;
	int endAt;
	String categoryName;
	int roomId;
	String coverSmall;
	LiveCategoryDetailDataHomepagevoLivesMode mode;
	int playCount;
	int uid;
	double price;
	String name;
	String nickname;
	int id;
	String coverLarge;
	int actualStartAt;
	int categoryId;
	int startAt;
	int status;

	LiveCategoryDetailDataHomepagevoLife({this.coverMiddle, this.permissionType, this.chatId, this.avatar, this.type, this.endAt, this.categoryName, this.roomId, this.coverSmall, this.mode, this.playCount, this.uid, this.price, this.name, this.nickname, this.id, this.coverLarge, this.actualStartAt, this.categoryId, this.startAt, this.status});

	LiveCategoryDetailDataHomepagevoLife.fromJson(Map<String, dynamic> json) {
		coverMiddle = json['coverMiddle'];
		permissionType = json['permissionType'];
		chatId = json['chatId'];
		avatar = json['avatar'];
		type = json['type'];
		endAt = json['endAt'];
		categoryName = json['categoryName'];
		roomId = json['roomId'];
		coverSmall = json['coverSmall'];
		mode = json['mode'] != null ? new LiveCategoryDetailDataHomepagevoLivesMode.fromJson(json['mode']) : null;
		playCount = json['playCount'];
		uid = json['uid'];
		price = json['price'];
		name = json['name'];
		nickname = json['nickname'];
		id = json['id'];
		coverLarge = json['coverLarge'];
		actualStartAt = json['actualStartAt'];
		categoryId = json['categoryId'];
		startAt = json['startAt'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['coverMiddle'] = this.coverMiddle;
		data['permissionType'] = this.permissionType;
		data['chatId'] = this.chatId;
		data['avatar'] = this.avatar;
		data['type'] = this.type;
		data['endAt'] = this.endAt;
		data['categoryName'] = this.categoryName;
		data['roomId'] = this.roomId;
		data['coverSmall'] = this.coverSmall;
		if (this.mode != null) {
      data['mode'] = this.mode.toJson();
    }
		data['playCount'] = this.playCount;
		data['uid'] = this.uid;
		data['price'] = this.price;
		data['name'] = this.name;
		data['nickname'] = this.nickname;
		data['id'] = this.id;
		data['coverLarge'] = this.coverLarge;
		data['actualStartAt'] = this.actualStartAt;
		data['categoryId'] = this.categoryId;
		data['startAt'] = this.startAt;
		data['status'] = this.status;
		return data;
	}
}

class LiveCategoryDetailDataHomepagevoLivesMode {
	String modeName;
	int modeType;
	String secondColor;
	String firstColor;

	LiveCategoryDetailDataHomepagevoLivesMode({this.modeName, this.modeType, this.secondColor, this.firstColor});

	LiveCategoryDetailDataHomepagevoLivesMode.fromJson(Map<String, dynamic> json) {
		modeName = json['modeName'];
		modeType = json['modeType'];
		secondColor = json['secondColor'];
		firstColor = json['firstColor'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['modeName'] = this.modeName;
		data['modeType'] = this.modeType;
		data['secondColor'] = this.secondColor;
		data['firstColor'] = this.firstColor;
		return data;
	}
}

class LiveCategoryDetailDataMaterialvo {
	String coverPath;
	int id;
	String title;
	int type;
	String targetUrl;

	LiveCategoryDetailDataMaterialvo({this.coverPath, this.id, this.title, this.type, this.targetUrl});

	LiveCategoryDetailDataMaterialvo.fromJson(Map<String, dynamic> json) {
		coverPath = json['coverPath'];
		id = json['id'];
		title = json['title'];
		type = json['type'];
		targetUrl = json['targetUrl'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['coverPath'] = this.coverPath;
		data['id'] = this.id;
		data['title'] = this.title;
		data['type'] = this.type;
		data['targetUrl'] = this.targetUrl;
		return data;
	}
}

class LiveCategoryDetailDataFocuspictureadresponsefacade {
	int ret;
	int responseId;

	LiveCategoryDetailDataFocuspictureadresponsefacade({this.ret, this.responseId});

	LiveCategoryDetailDataFocuspictureadresponsefacade.fromJson(Map<String, dynamic> json) {
		ret = json['ret'];
		responseId = json['responseId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['ret'] = this.ret;
		data['responseId'] = this.responseId;
		return data;
	}
}
