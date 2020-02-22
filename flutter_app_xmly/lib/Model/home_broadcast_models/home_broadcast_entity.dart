class HomeBroadcastEntity {
	int ret;
	HomeBroadcastData data;

	HomeBroadcastEntity({this.ret, this.data});

	HomeBroadcastEntity.fromJson(Map<String, dynamic> json) {
		ret = json['ret'];
		data = json['data'] != null ? new HomeBroadcastData.fromJson(json['data']) : null;
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

class HomeBroadcastData {
	List<HomeBroadcastDataLocalradio> localRadios;
	List<HomeBroadcastDataRadiosquareresult> radioSquareResults;
	String location;
	List<HomeBroadcastDataCategory> categories;
	List<HomeBroadcastDataTopradio> topRadios;

	HomeBroadcastData({this.localRadios, this.radioSquareResults, this.location, this.categories, this.topRadios});

	HomeBroadcastData.fromJson(Map<String, dynamic> json) {
		if (json['localRadios'] != null) {
			localRadios = new List<HomeBroadcastDataLocalradio>();(json['localRadios'] as List).forEach((v) { localRadios.add(new HomeBroadcastDataLocalradio.fromJson(v)); });
		}
		if (json['radioSquareResults'] != null) {
			radioSquareResults = new List<HomeBroadcastDataRadiosquareresult>();(json['radioSquareResults'] as List).forEach((v) { radioSquareResults.add(new HomeBroadcastDataRadiosquareresult.fromJson(v)); });
		}
		location = json['location'];
		if (json['categories'] != null) {
			categories = new List<HomeBroadcastDataCategory>();(json['categories'] as List).forEach((v) { categories.add(new HomeBroadcastDataCategory.fromJson(v)); });
		}
		if (json['topRadios'] != null) {
			topRadios = new List<HomeBroadcastDataTopradio>();(json['topRadios'] as List).forEach((v) { topRadios.add(new HomeBroadcastDataTopradio.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.localRadios != null) {
      data['localRadios'] =  this.localRadios.map((v) => v.toJson()).toList();
    }
		if (this.radioSquareResults != null) {
      data['radioSquareResults'] =  this.radioSquareResults.map((v) => v.toJson()).toList();
    }
		data['location'] = this.location;
		if (this.categories != null) {
      data['categories'] =  this.categories.map((v) => v.toJson()).toList();
    }
		if (this.topRadios != null) {
      data['topRadios'] =  this.topRadios.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class HomeBroadcastDataLocalradio {
	String coverSmall;
	int playCount;
	String programName;
	bool publish;
	String name;
	int fmUid;
	int id;
	String coverLarge;
	int programScheduleId;
	int programId;
	HomeBroadcastDataLocalradiosPlayurl playUrl;

	HomeBroadcastDataLocalradio({this.coverSmall, this.playCount, this.programName, this.publish, this.name, this.fmUid, this.id, this.coverLarge, this.programScheduleId, this.programId, this.playUrl});

	HomeBroadcastDataLocalradio.fromJson(Map<String, dynamic> json) {
		coverSmall = json['coverSmall'];
		playCount = json['playCount'];
		programName = json['programName'];
		publish = json['publish'];
		name = json['name'];
		fmUid = json['fmUid'];
		id = json['id'];
		coverLarge = json['coverLarge'];
		programScheduleId = json['programScheduleId'];
		programId = json['programId'];
		playUrl = json['playUrl'] != null ? new HomeBroadcastDataLocalradiosPlayurl.fromJson(json['playUrl']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['coverSmall'] = this.coverSmall;
		data['playCount'] = this.playCount;
		data['programName'] = this.programName;
		data['publish'] = this.publish;
		data['name'] = this.name;
		data['fmUid'] = this.fmUid;
		data['id'] = this.id;
		data['coverLarge'] = this.coverLarge;
		data['programScheduleId'] = this.programScheduleId;
		data['programId'] = this.programId;
		if (this.playUrl != null) {
      data['playUrl'] = this.playUrl.toJson();
    }
		return data;
	}
}

class HomeBroadcastDataLocalradiosPlayurl {
	String aac24;
	String aac64;
	String ts24;
	String ts64;

	HomeBroadcastDataLocalradiosPlayurl({this.aac24, this.aac64, this.ts24, this.ts64});

	HomeBroadcastDataLocalradiosPlayurl.fromJson(Map<String, dynamic> json) {
		aac24 = json['aac24'];
		aac64 = json['aac64'];
		ts24 = json['ts24'];
		ts64 = json['ts64'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['aac24'] = this.aac24;
		data['aac64'] = this.aac64;
		data['ts24'] = this.ts24;
		data['ts64'] = this.ts64;
		return data;
	}
}

class HomeBroadcastDataRadiosquareresult {
	String icon;
	int id;
	String title;
	String uri;

	HomeBroadcastDataRadiosquareresult({this.icon, this.id, this.title, this.uri});

	HomeBroadcastDataRadiosquareresult.fromJson(Map<String, dynamic> json) {
		icon = json['icon'];
		id = json['id'];
		title = json['title'];
		uri = json['uri'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['icon'] = this.icon;
		data['id'] = this.id;
		data['title'] = this.title;
		data['uri'] = this.uri;
		return data;
	}
}

class HomeBroadcastDataCategory {
	String name;
	int id;

	HomeBroadcastDataCategory({this.name, this.id});

	HomeBroadcastDataCategory.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['id'] = this.id;
		return data;
	}
}

class HomeBroadcastDataTopradio {
	String coverSmall;
	int playCount;
	String programName;
	bool publish;
	String name;
	int fmUid;
	int id;
	String coverLarge;
	int programScheduleId;
	int programId;
	HomeBroadcastDataTopradiosPlayurl playUrl;

	HomeBroadcastDataTopradio({this.coverSmall, this.playCount, this.programName, this.publish, this.name, this.fmUid, this.id, this.coverLarge, this.programScheduleId, this.programId, this.playUrl});

	HomeBroadcastDataTopradio.fromJson(Map<String, dynamic> json) {
		coverSmall = json['coverSmall'];
		playCount = json['playCount'];
		programName = json['programName'];
		publish = json['publish'];
		name = json['name'];
		fmUid = json['fmUid'];
		id = json['id'];
		coverLarge = json['coverLarge'];
		programScheduleId = json['programScheduleId'];
		programId = json['programId'];
		playUrl = json['playUrl'] != null ? new HomeBroadcastDataTopradiosPlayurl.fromJson(json['playUrl']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['coverSmall'] = this.coverSmall;
		data['playCount'] = this.playCount;
		data['programName'] = this.programName;
		data['publish'] = this.publish;
		data['name'] = this.name;
		data['fmUid'] = this.fmUid;
		data['id'] = this.id;
		data['coverLarge'] = this.coverLarge;
		data['programScheduleId'] = this.programScheduleId;
		data['programId'] = this.programId;
		if (this.playUrl != null) {
      data['playUrl'] = this.playUrl.toJson();
    }
		return data;
	}
}

class HomeBroadcastDataTopradiosPlayurl {
	String aac24;
	String aac64;
	String ts24;
	String ts64;

	HomeBroadcastDataTopradiosPlayurl({this.aac24, this.aac64, this.ts24, this.ts64});

	HomeBroadcastDataTopradiosPlayurl.fromJson(Map<String, dynamic> json) {
		aac24 = json['aac24'];
		aac64 = json['aac64'];
		ts24 = json['ts24'];
		ts64 = json['ts64'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['aac24'] = this.aac24;
		data['aac64'] = this.aac64;
		data['ts24'] = this.ts24;
		data['ts64'] = this.ts64;
		return data;
	}
}
