
import 'recomend_entity.dart';
class RecomendResponseEntity {
	int ret;
	String msg;
	String code;
	List<RecomandResponseList> xList;

	RecomendResponseEntity({this.ret, this.msg, this.code, this.xList});

	RecomendResponseEntity.fromJson(Map<String, dynamic> json) {
		ret = json['ret'];
		msg = json['msg'];
		code = json['code'];
		if (json['list'] != null) {
			xList = new List<RecomandResponseList>();(json['list'] as List).forEach((v) { xList.add(new RecomandResponseList.fromJson(v)); });
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

class RecomandResponseList {
	String moduleType;
	List<RecomandResponseListKeywords> keywords;
	bool bottomHasMore;
	bool hasMore;
	bool isNewUser;
	List<RecomandResponseListList> xList;
	List<RecomendListListData> data;// data list
	String title;
	RecomendResponseListTarget target;
	int loopCount;
	int moduleId;
	bool showInterestCard;
	int categoryId;
	String direction;

	RecomandResponseList({this.moduleType, this.keywords, this.bottomHasMore, this.hasMore, this.isNewUser, this.xList, this.title, this.target, this.loopCount, this.moduleId, this.showInterestCard, this.categoryId, this.direction});

	RecomandResponseList.fromJson(Map<String, dynamic> json) {
		moduleType = json['moduleType'];
		if (json['keywords'] != null) {
			keywords = new List<RecomandResponseListKeywords>();(json['keywords'] as List).forEach((v) { keywords.add(new RecomandResponseListKeywords.fromJson(v)); });
		}
		bottomHasMore = json['bottomHasMore'];
		hasMore = json['hasMore'];
		isNewUser = json['isNewUser'];
		if (json['list'] != null) {
			// 判断
			List<Map<String,dynamic>> listArr = new List<Map<String,dynamic>>.from(json['list']);
			if (listArr.first.containsKey("data")){
				// 是轮播图数据
				print("😇是轮播图数据");
				data = new List<RecomendListListData>();
				(listArr.first['data'] as List).forEach((v) {
					data.add(
							new RecomendListListData.fromJson(v));
				});
			}else{
				print("😇是列表数据");
				xList = new List<RecomandResponseListList>();
				//判断是否为空数组
				List listArr = (json['list'] as List);
				if (listArr != null && listArr.length != 0){
					(json['list'] as List).forEach((v) {
						xList.add(
								new RecomandResponseListList.fromJson(v)
						);
					});
				}else{
						print("$title" + "list数据为空 应该是广告数据");
				}
			}
		}
		title = json['title'];
		target = json['target'] != null ? new RecomendResponseListTarget.fromJson(json['target']) : null;
		loopCount = json['loopCount'];
		moduleId = json['moduleId'];
		showInterestCard = json['showInterestCard'];
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
		data['isNewUser'] = this.isNewUser;
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		data['title'] = this.title;
		if (this.target != null) {
      data['target'] = this.target.toJson();
    }
		data['loopCount'] = this.loopCount;
		data['moduleId'] = this.moduleId;
		data['showInterestCard'] = this.showInterestCard;
		data['categoryId'] = this.categoryId;
		data['direction'] = this.direction;
		return data;
	}
}

class RecomandResponseListKeywords {
	int keywordId;
	String keywordName;
	String materialType;
	String categoryTitle;
	int keywordType;
	int categoryId;
	int realCategoryId;

	RecomandResponseListKeywords({this.keywordId, this.keywordName, this.materialType, this.categoryTitle, this.keywordType, this.categoryId, this.realCategoryId});

	RecomandResponseListKeywords.fromJson(Map<String, dynamic> json) {
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

class RecomandResponseListList {
	String sharePic;
	String coverPath;
	bool isExternalUrl;
	String bubbleText;
	int contentUpdatedAt;
	int orderNum;
	int bucketId;
	String title;
	String url;
	String displayClass;
	String subtitle;
	bool enableShare;
	int id;
	String contentType;
	String darkCoverPath;
	RecomendResponseListListProperties properties;

	RecomandResponseListList({this.sharePic, this.coverPath, this.isExternalUrl, this.bubbleText, this.contentUpdatedAt, this.orderNum, this.bucketId, this.title, this.url, this.displayClass, this.subtitle, this.enableShare, this.id, this.contentType, this.darkCoverPath, this.properties});

	RecomandResponseListList.fromJson(Map<String, dynamic> json) {
		sharePic = json['sharePic'];
		coverPath = json['coverPath'];
		isExternalUrl = json['isExternalUrl'];
		bubbleText = json['bubbleText'];
		contentUpdatedAt = json['contentUpdatedAt'];
		orderNum = json['orderNum'];
		bucketId = json['bucketId'];
		title = json['title'];
		url = json['url'];
		displayClass = json['displayClass'];
		subtitle = json['subtitle'];
		enableShare = json['enableShare'];
		id = json['id'];
		contentType = json['contentType'];
		darkCoverPath = json['darkCoverPath'];
		properties = json['properties'] != null ? new RecomendResponseListListProperties.fromJson(json['properties']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['sharePic'] = this.sharePic;
		data['coverPath'] = this.coverPath;
		data['isExternalUrl'] = this.isExternalUrl;
		data['bubbleText'] = this.bubbleText;
		data['contentUpdatedAt'] = this.contentUpdatedAt;
		data['orderNum'] = this.orderNum;
		data['bucketId'] = this.bucketId;
		data['title'] = this.title;
		data['url'] = this.url;
		data['displayClass'] = this.displayClass;
		data['subtitle'] = this.subtitle;
		data['enableShare'] = this.enableShare;
		data['id'] = this.id;
		data['contentType'] = this.contentType;
		data['darkCoverPath'] = this.darkCoverPath;
		if (this.properties != null) {
      data['properties'] = this.properties.toJson();
    }
		return data;
	}
}

class RecomendResponseListListProperties {
	bool isPaid;
	String type;
	String uri;

	RecomendResponseListListProperties({this.isPaid, this.type, this.uri});

	RecomendResponseListListProperties.fromJson(Map<String, dynamic> json) {
		isPaid = json['isPaid'];
		type = json['type'];
		uri = json['uri'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['isPaid'] = this.isPaid;
		data['type'] = this.type;
		data['uri'] = this.uri;
		return data;
	}
}

class RecomendResponseListTarget {
	int groupId;

	RecomendResponseListTarget({this.groupId});

	RecomendResponseListTarget.fromJson(Map<String, dynamic> json) {
		groupId = json['groupId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['groupId'] = this.groupId;
		return data;
	}
}
