class HomeClassifyEntity {
	String msg;
	int ret;
	String code;
	List<HomeClassifyList> xList;

	HomeClassifyEntity({this.msg, this.ret, this.code, this.xList});

	HomeClassifyEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		ret = json['ret'];
		code = json['code'];
		if (json['list'] != null) {
			xList = new List<HomeClassifyList>();(json['list'] as List).forEach((v) { xList.add(new HomeClassifyList.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['msg'] = this.msg;
		data['ret'] = this.ret;
		data['code'] = this.code;
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class HomeClassifyList {
	String groupName;
	int displayStyleType;
	List<HomeClassifyListItemlist> itemList;

	HomeClassifyList({this.groupName, this.displayStyleType, this.itemList});

	HomeClassifyList.fromJson(Map<String, dynamic> json) {
		groupName = json['groupName'];
		displayStyleType = json['displayStyleType'];
		if (json['itemList'] != null) {
			itemList = new List<HomeClassifyListItemlist>();(json['itemList'] as List).forEach((v) { itemList.add(new HomeClassifyListItemlist.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['groupName'] = this.groupName;
		data['displayStyleType'] = this.displayStyleType;
		if (this.itemList != null) {
      data['itemList'] =  this.itemList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class HomeClassifyListItemlist {
	int itemType;
	String coverPath;
	bool isDisplayCornerMark;
	HomeClassifyListItemlistItemdetail itemDetail;

	HomeClassifyListItemlist({this.itemType, this.coverPath, this.isDisplayCornerMark, this.itemDetail});

	HomeClassifyListItemlist.fromJson(Map<String, dynamic> json) {
		itemType = json['itemType'];
		coverPath = (json['coverPath'] != null ? json['coverPath'] : "");
		isDisplayCornerMark = json['isDisplayCornerMark'];
		itemDetail = json['itemDetail'] != null ? new HomeClassifyListItemlistItemdetail.fromJson(json['itemDetail']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['itemType'] = this.itemType;
		data['coverPath'] = this.coverPath;
		data['isDisplayCornerMark'] = this.isDisplayCornerMark;
		if (this.itemDetail != null) {
      data['itemDetail'] = this.itemDetail.toJson();
    }
		return data;
	}
}

class HomeClassifyListItemlistItemdetail {
	int categoryType;
	int moduleType;
	String name;
	bool filterSupported;
	String title;
	int categoryId;

	HomeClassifyListItemlistItemdetail({this.categoryType, this.moduleType, this.name, this.filterSupported, this.title, this.categoryId});

	HomeClassifyListItemlistItemdetail.fromJson(Map<String, dynamic> json) {
		categoryType = json['categoryType'];
		moduleType = json['moduleType'];
		name = json['name'];
		filterSupported = json['filterSupported'];
		title = (json['title'] != null ? json['title'] : "unknown title");
		categoryId = json['categoryId'];
		if(json['title'] == null){
			if(json["keywordName"] != null){
				title = json["keywordName"];
			}else{
				title = "unknown title";
			}
		}else{
			title = json['title'];
		}

	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['categoryType'] = this.categoryType;
		data['moduleType'] = this.moduleType;
		data['name'] = this.name;
		data['filterSupported'] = this.filterSupported;
		data['title'] = this.title;
		data['categoryId'] = this.categoryId;
		return data;
	}
}
