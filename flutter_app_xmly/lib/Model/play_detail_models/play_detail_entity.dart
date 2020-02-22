class PlayDetailEntity {
	int ret;
	String msg;
	int costTimeAlbumPaidWithVipInfo;
	int costTimeAlbumUserInfo;
	int costTimeAlbumInfo;
	PlayDetailData data;
	int costTimeAlbumPaidCommonInfo;
	String costTime;
	int costTimeAlbumAnchorInfo;

	PlayDetailEntity({this.ret, this.msg, this.costTimeAlbumPaidWithVipInfo, this.costTimeAlbumUserInfo, this.costTimeAlbumInfo, this.data, this.costTimeAlbumPaidCommonInfo, this.costTime, this.costTimeAlbumAnchorInfo});

	PlayDetailEntity.fromJson(Map<String, dynamic> json) {
		ret = json['ret'];
		msg = json['msg'];
		costTimeAlbumPaidWithVipInfo = json['costTimeAlbumPaidWithVipInfo'];
		costTimeAlbumUserInfo = json['costTimeAlbumUserInfo'];
		costTimeAlbumInfo = json['costTimeAlbumInfo'];
		data = json['data'] != null ? new PlayDetailData.fromJson(json['data']) : null;
		costTimeAlbumPaidCommonInfo = json['costTimeAlbumPaidCommonInfo'];
		costTime = json['costTime'];
		costTimeAlbumAnchorInfo = json['costTimeAlbumAnchorInfo'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['ret'] = this.ret;
		data['msg'] = this.msg;
		data['costTimeAlbumPaidWithVipInfo'] = this.costTimeAlbumPaidWithVipInfo;
		data['costTimeAlbumUserInfo'] = this.costTimeAlbumUserInfo;
		data['costTimeAlbumInfo'] = this.costTimeAlbumInfo;
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['costTimeAlbumPaidCommonInfo'] = this.costTimeAlbumPaidCommonInfo;
		data['costTime'] = this.costTime;
		data['costTimeAlbumAnchorInfo'] = this.costTimeAlbumAnchorInfo;
		return data;
	}
}

class PlayDetailData {
	String viewTab;
	bool isShowTopic;
	PlayDetailDataAnchorotheralbums anchorOtherAlbums;
	PlayDetailDataAlbum album;
	String giftAlbum;
	bool isShowCommunity;
	PlayDetailDataAlbumranklist albumRankList;
	PlayDetailDataEbookinfo ebookInfo;
	PlayDetailDataTracks tracks;
	bool isOfflineHidden;
//	double minRecSubscribeScore;
	PlayDetailDataLoginuser loginUser;
	PlayDetailDataUser user;
	String recAlbumsPanelTitle;

	PlayDetailData({this.viewTab, this.isShowTopic, this.anchorOtherAlbums, this.album, this.giftAlbum, this.isShowCommunity, this.albumRankList, this.ebookInfo, this.tracks, this.isOfflineHidden, this.loginUser, this.user, this.recAlbumsPanelTitle});

	PlayDetailData.fromJson(Map<String, dynamic> json) {
		viewTab = json['viewTab'];
		isShowTopic = json['isShowTopic'];
		anchorOtherAlbums = json['anchorOtherAlbums'] != null ? new PlayDetailDataAnchorotheralbums.fromJson(json['anchorOtherAlbums']) : null;
		album = json['album'] != null ? new PlayDetailDataAlbum.fromJson(json['album']) : null;
		giftAlbum = json['giftAlbum'];
		isShowCommunity = json['isShowCommunity'];
		albumRankList = json['albumRankList'] != null ? new PlayDetailDataAlbumranklist.fromJson(json['albumRankList']) : null;
		ebookInfo = json['ebookInfo'] != null ? new PlayDetailDataEbookinfo.fromJson(json['ebookInfo']) : null;
		tracks = json['tracks'] != null ? new PlayDetailDataTracks.fromJson(json['tracks']) : null;
		isOfflineHidden = json['isOfflineHidden'];
		loginUser = json['loginUser'] != null ? new PlayDetailDataLoginuser.fromJson(json['loginUser']) : null;
		user = json['user'] != null ? new PlayDetailDataUser.fromJson(json['user']) : null;
		recAlbumsPanelTitle = json['recAlbumsPanelTitle'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['viewTab'] = this.viewTab;
		data['isShowTopic'] = this.isShowTopic;
		if (this.anchorOtherAlbums != null) {
      data['anchorOtherAlbums'] = this.anchorOtherAlbums.toJson();
    }
		if (this.album != null) {
      data['album'] = this.album.toJson();
    }
		data['giftAlbum'] = this.giftAlbum;
		data['isShowCommunity'] = this.isShowCommunity;
		if (this.albumRankList != null) {
      data['albumRankList'] = this.albumRankList.toJson();
    }
		if (this.ebookInfo != null) {
      data['ebookInfo'] = this.ebookInfo.toJson();
    }
		if (this.tracks != null) {
      data['tracks'] = this.tracks.toJson();
    }
		data['isOfflineHidden'] = this.isOfflineHidden;
//		data['minRecSubscribeScore'] = this.minRecSubscribeScore;
		if (this.loginUser != null) {
      data['loginUser'] = this.loginUser.toJson();
    }
		if (this.user != null) {
      data['user'] = this.user.toJson();
    }
		data['recAlbumsPanelTitle'] = this.recAlbumsPanelTitle;
		return data;
	}
}

class PlayDetailDataAnchorotheralbums {
	PlayDetailDataAnchorotheralbumsAlbums albums;
	bool showMoreButton;
	bool isShowMoreButton;

	PlayDetailDataAnchorotheralbums({this.albums, this.showMoreButton, this.isShowMoreButton});

	PlayDetailDataAnchorotheralbums.fromJson(Map<String, dynamic> json) {
		albums = json['albums'] != null ? new PlayDetailDataAnchorotheralbumsAlbums.fromJson(json['albums']) : null;
		showMoreButton = json['showMoreButton'];
		isShowMoreButton = json['isShowMoreButton'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.albums != null) {
      data['albums'] = this.albums.toJson();
    }
		data['showMoreButton'] = this.showMoreButton;
		data['isShowMoreButton'] = this.isShowMoreButton;
		return data;
	}
}

class PlayDetailDataAnchorotheralbumsAlbums {
	int maxPageId;
	int pageSize;
	int totalCount;
	List<PlayDetailDataAnchorotheralbumsAlbumsList> xList;
	int pageId;

	PlayDetailDataAnchorotheralbumsAlbums({this.maxPageId, this.pageSize, this.totalCount, this.xList, this.pageId});

	PlayDetailDataAnchorotheralbumsAlbums.fromJson(Map<String, dynamic> json) {
		maxPageId = json['maxPageId'];
		pageSize = json['pageSize'];
		totalCount = json['totalCount'];
		if (json['list'] != null) {
			xList = new List<PlayDetailDataAnchorotheralbumsAlbumsList>();(json['list'] as List).forEach((v) { xList.add(new PlayDetailDataAnchorotheralbumsAlbumsList.fromJson(v)); });
		}
		pageId = json['pageId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['maxPageId'] = this.maxPageId;
		data['pageSize'] = this.pageSize;
		data['totalCount'] = this.totalCount;
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		data['pageId'] = this.pageId;
		return data;
	}
}

class PlayDetailDataAnchorotheralbumsAlbumsList {
	bool albumTimeLimited;
	int offlineReason;
	int playTimes;
	int saleScope;
	bool isDraft;
	String customTitle;
	int type;
	int playTrackId;
	String coverSmall;
	int createdAt;
	bool isAuthorized;
	bool isVipFree;
	String intro;
	int vipFirstStatus;
	String coverWebLarge;
	int freeToPaidStatus;
	int updatedAt;
	int vipFreeType;
	int authorizedExpireTime;
	int serializeStatus;
	String coverMiddle;
	int serialState;
	int authorizedTypeId;
	String salePoint;
	bool isDefault;
	int isFinished;
	String tags;
	bool isPaid;
	int originalStatus;
	bool canInviteListen;
	int offlineType;
	int financialStatus;
	int status;
	bool canShareAndStealListen;
	String recommendReason;
	int albumId;
	String salePointPopup;
	String title;
	String shortIntro;
	int shares;
	int uid;
	bool isPublic;
	int lastUptrackAt;
	String coverLarge;
	int freeToPaidTime;
	String customSubTitle;
	bool tracksIsAllPurchased;
	int preferredType;
	int lastUptrackId;
	int contractStatus;
	String lastUptrackTitle;
	int ageLevel;
	int tracks;
	int unReadAlbumCommentCount;
	bool isRecordDesc;
	String lastUptrackCoverPath;
	int categoryId;
	int shareSupportType;

	PlayDetailDataAnchorotheralbumsAlbumsList({this.albumTimeLimited, this.offlineReason, this.playTimes, this.saleScope, this.isDraft, this.customTitle, this.type, this.playTrackId, this.coverSmall, this.createdAt, this.isAuthorized, this.isVipFree, this.intro, this.vipFirstStatus, this.coverWebLarge, this.freeToPaidStatus, this.updatedAt, this.vipFreeType, this.authorizedExpireTime, this.serializeStatus, this.coverMiddle, this.serialState, this.authorizedTypeId, this.salePoint, this.isDefault, this.isFinished, this.tags, this.isPaid, this.originalStatus, this.canInviteListen, this.offlineType, this.financialStatus, this.status, this.canShareAndStealListen, this.recommendReason, this.albumId, this.salePointPopup, this.title, this.shortIntro, this.shares, this.uid, this.isPublic, this.lastUptrackAt, this.coverLarge, this.freeToPaidTime, this.customSubTitle, this.tracksIsAllPurchased, this.preferredType, this.lastUptrackId, this.contractStatus, this.lastUptrackTitle, this.ageLevel, this.tracks, this.unReadAlbumCommentCount, this.isRecordDesc, this.lastUptrackCoverPath, this.categoryId, this.shareSupportType});

	PlayDetailDataAnchorotheralbumsAlbumsList.fromJson(Map<String, dynamic> json) {
		albumTimeLimited = json['albumTimeLimited'];
		offlineReason = json['offlineReason'];
		playTimes = json['playTimes'];
		saleScope = json['saleScope'];
		isDraft = json['isDraft'];
		customTitle = json['customTitle'];
		type = json['type'];
		playTrackId = json['playTrackId'];
		coverSmall = json['coverSmall'];
		createdAt = json['createdAt'];
		isAuthorized = json['isAuthorized'];
		isVipFree = json['isVipFree'];
		intro = json['intro'];
		vipFirstStatus = json['vipFirstStatus'];
		coverWebLarge = json['coverWebLarge'];
		freeToPaidStatus = json['freeToPaidStatus'];
		updatedAt = json['updatedAt'];
		vipFreeType = json['vipFreeType'];
		authorizedExpireTime = json['authorizedExpireTime'];
		serializeStatus = json['serializeStatus'];
		coverMiddle = json['coverMiddle'];
		serialState = json['serialState'];
		authorizedTypeId = json['authorizedTypeId'];
		salePoint = json['salePoint'];
		isDefault = json['is_default'];
		isFinished = json['isFinished'];
		tags = json['tags'];
		isPaid = json['isPaid'];
		originalStatus = json['originalStatus'];
		canInviteListen = json['canInviteListen'];
		offlineType = json['offlineType'];
		financialStatus = json['financialStatus'];
		status = json['status'];
		canShareAndStealListen = json['canShareAndStealListen'];
		recommendReason = json['recommendReason'];
		albumId = json['albumId'];
		salePointPopup = json['salePointPopup'];
		title = json['title'];
		shortIntro = json['shortIntro'];
		shares = json['shares'];
		uid = json['uid'];
		isPublic = json['isPublic'];
		lastUptrackAt = json['lastUptrackAt'];
		coverLarge = json['coverLarge'];
		freeToPaidTime = json['freeToPaidTime'];
		customSubTitle = json['customSubTitle'];
		tracksIsAllPurchased = json['tracksIsAllPurchased'];
		preferredType = json['preferredType'];
		lastUptrackId = json['lastUptrackId'];
		contractStatus = json['contractStatus'];
		lastUptrackTitle = json['lastUptrackTitle'];
		ageLevel = json['ageLevel'];
		tracks = json['tracks'];
		unReadAlbumCommentCount = json['unReadAlbumCommentCount'];
		isRecordDesc = json['isRecordDesc'];
		lastUptrackCoverPath = json['lastUptrackCoverPath'];
		categoryId = json['categoryId'];
		shareSupportType = json['shareSupportType'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['albumTimeLimited'] = this.albumTimeLimited;
		data['offlineReason'] = this.offlineReason;
		data['playTimes'] = this.playTimes;
		data['saleScope'] = this.saleScope;
		data['isDraft'] = this.isDraft;
		data['customTitle'] = this.customTitle;
		data['type'] = this.type;
		data['playTrackId'] = this.playTrackId;
		data['coverSmall'] = this.coverSmall;
		data['createdAt'] = this.createdAt;
		data['isAuthorized'] = this.isAuthorized;
		data['isVipFree'] = this.isVipFree;
		data['intro'] = this.intro;
		data['vipFirstStatus'] = this.vipFirstStatus;
		data['coverWebLarge'] = this.coverWebLarge;
		data['freeToPaidStatus'] = this.freeToPaidStatus;
		data['updatedAt'] = this.updatedAt;
		data['vipFreeType'] = this.vipFreeType;
		data['authorizedExpireTime'] = this.authorizedExpireTime;
		data['serializeStatus'] = this.serializeStatus;
		data['coverMiddle'] = this.coverMiddle;
		data['serialState'] = this.serialState;
		data['authorizedTypeId'] = this.authorizedTypeId;
		data['salePoint'] = this.salePoint;
		data['is_default'] = this.isDefault;
		data['isFinished'] = this.isFinished;
		data['tags'] = this.tags;
		data['isPaid'] = this.isPaid;
		data['originalStatus'] = this.originalStatus;
		data['canInviteListen'] = this.canInviteListen;
		data['offlineType'] = this.offlineType;
		data['financialStatus'] = this.financialStatus;
		data['status'] = this.status;
		data['canShareAndStealListen'] = this.canShareAndStealListen;
		data['recommendReason'] = this.recommendReason;
		data['albumId'] = this.albumId;
		data['salePointPopup'] = this.salePointPopup;
		data['title'] = this.title;
		data['shortIntro'] = this.shortIntro;
		data['shares'] = this.shares;
		data['uid'] = this.uid;
		data['isPublic'] = this.isPublic;
		data['lastUptrackAt'] = this.lastUptrackAt;
		data['coverLarge'] = this.coverLarge;
		data['freeToPaidTime'] = this.freeToPaidTime;
		data['customSubTitle'] = this.customSubTitle;
		data['tracksIsAllPurchased'] = this.tracksIsAllPurchased;
		data['preferredType'] = this.preferredType;
		data['lastUptrackId'] = this.lastUptrackId;
		data['contractStatus'] = this.contractStatus;
		data['lastUptrackTitle'] = this.lastUptrackTitle;
		data['ageLevel'] = this.ageLevel;
		data['tracks'] = this.tracks;
		data['unReadAlbumCommentCount'] = this.unReadAlbumCommentCount;
		data['isRecordDesc'] = this.isRecordDesc;
		data['lastUptrackCoverPath'] = this.lastUptrackCoverPath;
		data['categoryId'] = this.categoryId;
		data['shareSupportType'] = this.shareSupportType;
		return data;
	}
}

class PlayDetailDataAlbum {
	bool albumTimeLimited;
	int offlineReason;
	int playTimes;
	int saleScope;
	bool isDraft;
	String customTitle;
	int type;
	int playTrackId;
	String coverSmall;
	int createdAt;
	bool isAuthorized;
	bool hasRecs;
	bool isVipFree;
	String intro;
	String introRich;
	int vipFirstStatus;
	String coverWebLarge;
	int freeToPaidStatus;
	int updatedAt;
	int vipFreeType;
	int authorizedExpireTime;
	int serializeStatus;
	String coverMiddle;
	String otherTitle;
	int serialState;
	String shortIntroRich;
	int authorizedTypeId;
	String salePoint;
	bool isDefault;
	int isFinished;
	bool autoStart;
	String tags;
	bool isPaid;
	int followers;
	int originalStatus;
	bool canInviteListen;
	String detailCoverPath;
	bool isNoCopyright;
	int offlineType;
	int subscribeCount;
	int financialStatus;
	String otherContent;
	String buyNotes;
	int status;
	bool canShareAndStealListen;
	bool isVerified;
	String recommendReason;
	int albumId;
	String salePointPopup;
	String title;
	String categoryName;
	String shortIntro;
	int shares;
	int uid;
	String outline;
	String nickname;
	bool isInBlacklist;
	bool isPublic;
	int lastUptrackAt;
	String coverLarge;
	int freeToPaidTime;
	String customSubTitle;
	bool tracksIsAllPurchased;
	int preferredType;
	int lastUptrackId;
	int contractStatus;
	String lastUptrackTitle;
	String avatarPath;
	int ageLevel;
	int tracks;
	int unReadAlbumCommentCount;
	String personalDescription;
	bool isRecordDesc;
	String lastUptrackCoverPath;
	int categoryId;
	int shareSupportType;

	PlayDetailDataAlbum({this.albumTimeLimited, this.offlineReason, this.playTimes, this.saleScope, this.isDraft, this.customTitle, this.type, this.playTrackId, this.coverSmall, this.createdAt, this.isAuthorized, this.hasRecs, this.isVipFree, this.intro, this.introRich, this.vipFirstStatus, this.coverWebLarge, this.freeToPaidStatus, this.updatedAt, this.vipFreeType, this.authorizedExpireTime, this.serializeStatus, this.coverMiddle, this.otherTitle, this.serialState, this.shortIntroRich, this.authorizedTypeId, this.salePoint, this.isDefault, this.isFinished, this.autoStart, this.tags, this.isPaid, this.followers, this.originalStatus, this.canInviteListen, this.detailCoverPath, this.isNoCopyright, this.offlineType, this.subscribeCount, this.financialStatus, this.otherContent, this.buyNotes, this.status, this.canShareAndStealListen, this.isVerified, this.recommendReason, this.albumId, this.salePointPopup, this.title, this.categoryName, this.shortIntro, this.shares, this.uid, this.outline, this.nickname, this.isInBlacklist, this.isPublic, this.lastUptrackAt, this.coverLarge, this.freeToPaidTime, this.customSubTitle, this.tracksIsAllPurchased, this.preferredType, this.lastUptrackId, this.contractStatus, this.lastUptrackTitle, this.avatarPath, this.ageLevel, this.tracks, this.unReadAlbumCommentCount, this.personalDescription, this.isRecordDesc, this.lastUptrackCoverPath, this.categoryId, this.shareSupportType});

	PlayDetailDataAlbum.fromJson(Map<String, dynamic> json) {
		albumTimeLimited = json['albumTimeLimited'];
		offlineReason = json['offlineReason'];
		playTimes = json['playTimes'];
		saleScope = json['saleScope'];
		isDraft = json['isDraft'];
		customTitle = json['customTitle'];
		type = json['type'];
		playTrackId = json['playTrackId'];
		coverSmall = json['coverSmall'];
		createdAt = json['createdAt'];
		isAuthorized = json['isAuthorized'];
		hasRecs = json['hasRecs'];
		isVipFree = json['isVipFree'];
		intro = json['intro'];
		introRich = json['introRich'];
		vipFirstStatus = json['vipFirstStatus'];
		coverWebLarge = json['coverWebLarge'];
		freeToPaidStatus = json['freeToPaidStatus'];
		updatedAt = json['updatedAt'];
		vipFreeType = json['vipFreeType'];
		authorizedExpireTime = json['authorizedExpireTime'];
		serializeStatus = json['serializeStatus'];
		coverMiddle = json['coverMiddle'];
		otherTitle = json['other_title'];
		serialState = json['serialState'];
		shortIntroRich = json['shortIntroRich'];
		authorizedTypeId = json['authorizedTypeId'];
		salePoint = json['salePoint'];
		isDefault = json['is_default'];
		isFinished = json['isFinished'];
		autoStart = json['autoStart'];
		tags = json['tags'];
		isPaid = json['isPaid'];
		followers = json['followers'];
		originalStatus = json['originalStatus'];
		canInviteListen = json['canInviteListen'];
		detailCoverPath = json['detailCoverPath'];
		isNoCopyright = json['isNoCopyright'];
		offlineType = json['offlineType'];
		subscribeCount = json['subscribeCount'];
		financialStatus = json['financialStatus'];
		otherContent = json['other_content'];
		buyNotes = json['buyNotes'];
		status = json['status'];
		canShareAndStealListen = json['canShareAndStealListen'];
		isVerified = json['isVerified'];
		recommendReason = json['recommendReason'];
		albumId = json['albumId'];
		salePointPopup = json['salePointPopup'];
		title = json['title'];
		categoryName = json['categoryName'];
		shortIntro = json['shortIntro'];
		shares = json['shares'];
		uid = json['uid'];
		outline = json['outline'];
		nickname = json['nickname'];
		isInBlacklist = json['isInBlacklist'];
		isPublic = json['isPublic'];
		lastUptrackAt = json['lastUptrackAt'];
		coverLarge = json['coverLarge'];
		freeToPaidTime = json['freeToPaidTime'];
		customSubTitle = json['customSubTitle'];
		tracksIsAllPurchased = json['tracksIsAllPurchased'];
		preferredType = json['preferredType'];
		lastUptrackId = json['lastUptrackId'];
		contractStatus = json['contractStatus'];
		lastUptrackTitle = json['lastUptrackTitle'];
		avatarPath = json['avatarPath'];
		ageLevel = json['ageLevel'];
		tracks = json['tracks'];
		unReadAlbumCommentCount = json['unReadAlbumCommentCount'];
		personalDescription = json['personalDescription'];
		isRecordDesc = json['isRecordDesc'];
		lastUptrackCoverPath = json['lastUptrackCoverPath'];
		categoryId = json['categoryId'];
		shareSupportType = json['shareSupportType'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['albumTimeLimited'] = this.albumTimeLimited;
		data['offlineReason'] = this.offlineReason;
		data['playTimes'] = this.playTimes;
		data['saleScope'] = this.saleScope;
		data['isDraft'] = this.isDraft;
		data['customTitle'] = this.customTitle;
		data['type'] = this.type;
		data['playTrackId'] = this.playTrackId;
		data['coverSmall'] = this.coverSmall;
		data['createdAt'] = this.createdAt;
		data['isAuthorized'] = this.isAuthorized;
		data['hasRecs'] = this.hasRecs;
		data['isVipFree'] = this.isVipFree;
		data['intro'] = this.intro;
		data['introRich'] = this.introRich;
		data['vipFirstStatus'] = this.vipFirstStatus;
		data['coverWebLarge'] = this.coverWebLarge;
		data['freeToPaidStatus'] = this.freeToPaidStatus;
		data['updatedAt'] = this.updatedAt;
		data['vipFreeType'] = this.vipFreeType;
		data['authorizedExpireTime'] = this.authorizedExpireTime;
		data['serializeStatus'] = this.serializeStatus;
		data['coverMiddle'] = this.coverMiddle;
		data['other_title'] = this.otherTitle;
		data['serialState'] = this.serialState;
		data['shortIntroRich'] = this.shortIntroRich;
		data['authorizedTypeId'] = this.authorizedTypeId;
		data['salePoint'] = this.salePoint;
		data['is_default'] = this.isDefault;
		data['isFinished'] = this.isFinished;
		data['autoStart'] = this.autoStart;
		data['tags'] = this.tags;
		data['isPaid'] = this.isPaid;
		data['followers'] = this.followers;
		data['originalStatus'] = this.originalStatus;
		data['canInviteListen'] = this.canInviteListen;
		data['detailCoverPath'] = this.detailCoverPath;
		data['isNoCopyright'] = this.isNoCopyright;
		data['offlineType'] = this.offlineType;
		data['subscribeCount'] = this.subscribeCount;
		data['financialStatus'] = this.financialStatus;
		data['other_content'] = this.otherContent;
		data['buyNotes'] = this.buyNotes;
		data['status'] = this.status;
		data['canShareAndStealListen'] = this.canShareAndStealListen;
		data['isVerified'] = this.isVerified;
		data['recommendReason'] = this.recommendReason;
		data['albumId'] = this.albumId;
		data['salePointPopup'] = this.salePointPopup;
		data['title'] = this.title;
		data['categoryName'] = this.categoryName;
		data['shortIntro'] = this.shortIntro;
		data['shares'] = this.shares;
		data['uid'] = this.uid;
		data['outline'] = this.outline;
		data['nickname'] = this.nickname;
		data['isInBlacklist'] = this.isInBlacklist;
		data['isPublic'] = this.isPublic;
		data['lastUptrackAt'] = this.lastUptrackAt;
		data['coverLarge'] = this.coverLarge;
		data['freeToPaidTime'] = this.freeToPaidTime;
		data['customSubTitle'] = this.customSubTitle;
		data['tracksIsAllPurchased'] = this.tracksIsAllPurchased;
		data['preferredType'] = this.preferredType;
		data['lastUptrackId'] = this.lastUptrackId;
		data['contractStatus'] = this.contractStatus;
		data['lastUptrackTitle'] = this.lastUptrackTitle;
		data['avatarPath'] = this.avatarPath;
		data['ageLevel'] = this.ageLevel;
		data['tracks'] = this.tracks;
		data['unReadAlbumCommentCount'] = this.unReadAlbumCommentCount;
		data['personalDescription'] = this.personalDescription;
		data['isRecordDesc'] = this.isRecordDesc;
		data['lastUptrackCoverPath'] = this.lastUptrackCoverPath;
		data['categoryId'] = this.categoryId;
		data['shareSupportType'] = this.shareSupportType;
		return data;
	}
}

class PlayDetailDataAlbumranklist {
	int clusterType;
	int rankingListId;
	String showLabel;
	int categoryId;

	PlayDetailDataAlbumranklist({this.clusterType, this.rankingListId, this.showLabel, this.categoryId});

	PlayDetailDataAlbumranklist.fromJson(Map<String, dynamic> json) {
		clusterType = json['clusterType'];
		rankingListId = json['rankingListId'];
		showLabel = json['showLabel'];
		categoryId = json['categoryId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['clusterType'] = this.clusterType;
		data['rankingListId'] = this.rankingListId;
		data['showLabel'] = this.showLabel;
		data['categoryId'] = this.categoryId;
		return data;
	}
}

class PlayDetailDataEbookinfo {
	String authorName;
	String bookTip;
	int albumId;
	String originalUrl;
	String bookWxCover;
	String bookName;
	String landingUrl;
	bool isShow;
	int bookId;

	PlayDetailDataEbookinfo({this.authorName, this.bookTip, this.albumId, this.originalUrl, this.bookWxCover, this.bookName, this.landingUrl, this.isShow, this.bookId});

	PlayDetailDataEbookinfo.fromJson(Map<String, dynamic> json) {
		authorName = json['authorName'];
		bookTip = json['bookTip'];
		albumId = json['albumId'];
		originalUrl = json['originalUrl'];
		bookWxCover = json['bookWxCover'];
		bookName = json['bookName'];
		landingUrl = json['landingUrl'];
		isShow = json['isShow'];
		bookId = json['bookId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['authorName'] = this.authorName;
		data['bookTip'] = this.bookTip;
		data['albumId'] = this.albumId;
		data['originalUrl'] = this.originalUrl;
		data['bookWxCover'] = this.bookWxCover;
		data['bookName'] = this.bookName;
		data['landingUrl'] = this.landingUrl;
		data['isShow'] = this.isShow;
		data['bookId'] = this.bookId;
		return data;
	}
}

class PlayDetailDataTracks {
	int maxPageId;
	int pageSize;
	int totalCount;
	List<PlayDetailDataTracksList> xList;
	int pageId;

	PlayDetailDataTracks({this.maxPageId, this.pageSize, this.totalCount, this.xList, this.pageId});

	PlayDetailDataTracks.fromJson(Map<String, dynamic> json) {
		maxPageId = json['maxPageId'];
		pageSize = json['pageSize'];
		totalCount = json['totalCount'];
		if (json['list'] != null) {
			xList = new List<PlayDetailDataTracksList>();(json['list'] as List).forEach((v) { xList.add(new PlayDetailDataTracksList.fromJson(v)); });
		}
		pageId = json['pageId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['maxPageId'] = this.maxPageId;
		data['pageSize'] = this.pageSize;
		data['totalCount'] = this.totalCount;
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		data['pageId'] = this.pageId;
		return data;
	}
}

class PlayDetailDataTracksList {
	int processState;
	int opType;
	bool isDraft;
	int orderNum;
	int albumId;
	int sampleDuration;
	int type;
	String title;
	bool isRichAudio;
	int duration;
	String coverSmall;
	int shares;
	String playUrl64;
	int uid;
	String playPathAacv224;
	int createdAt;
	bool isAuthorized;
	String playPathHq;
	String nickname;
	bool isPublic;
	int vipFirstStatus;
	String playPathAacv164;
	int id;
	String coverLarge;
	bool isHoldCopyright;
	int likes;
	String coverMiddle;
	int comments;
	int orderNo;
	int trackId;
	int userSource;
	int playtimes;
	String smallLogo;
	bool isVideo;
	int trackRecordId;
	int relatedId;
	bool isPaid;
	String playUrl32;
	String commentId;
	int categoryId;
	int status;

	PlayDetailDataTracksList({this.processState, this.opType, this.isDraft, this.orderNum, this.albumId, this.sampleDuration, this.type, this.title, this.isRichAudio, this.duration, this.coverSmall, this.shares, this.playUrl64, this.uid, this.playPathAacv224, this.createdAt, this.isAuthorized, this.playPathHq, this.nickname, this.isPublic, this.vipFirstStatus, this.playPathAacv164, this.id, this.coverLarge, this.isHoldCopyright, this.likes, this.coverMiddle, this.comments, this.orderNo, this.trackId, this.userSource, this.playtimes, this.smallLogo, this.isVideo, this.trackRecordId, this.relatedId, this.isPaid, this.playUrl32, this.commentId, this.categoryId, this.status});

	PlayDetailDataTracksList.fromJson(Map<String, dynamic> json) {
		processState = json['processState'];
		opType = json['opType'];
		isDraft = json['isDraft'];
		orderNum = json['orderNum'];
		albumId = json['albumId'];
		sampleDuration = json['sampleDuration'];
		type = json['type'];
		title = json['title'];
		isRichAudio = json['isRichAudio'];
		duration = json['duration'];
		coverSmall = json['coverSmall'];
		shares = json['shares'];
		playUrl64 = json['playUrl64'];
		uid = json['uid'];
		playPathAacv224 = json['playPathAacv224'];
		createdAt = json['createdAt'];
		isAuthorized = json['isAuthorized'];
		playPathHq = json['playPathHq'];
		nickname = json['nickname'];
		isPublic = json['isPublic'];
		vipFirstStatus = json['vipFirstStatus'];
		playPathAacv164 = json['playPathAacv164'];
		id = json['id'];
		coverLarge = json['coverLarge'];
		isHoldCopyright = json['isHoldCopyright'];
		likes = json['likes'];
		coverMiddle = json['coverMiddle'];
		comments = json['comments'];
		orderNo = json['orderNo'];
		trackId = json['trackId'];
		userSource = json['userSource'];
		playtimes = json['playtimes'];
		smallLogo = json['smallLogo'];
		isVideo = json['isVideo'];
		trackRecordId = json['trackRecordId'];
		relatedId = json['relatedId'];
		isPaid = json['isPaid'];
		playUrl32 = json['playUrl32'];
		commentId = json['commentId'];
		categoryId = json['categoryId'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['processState'] = this.processState;
		data['opType'] = this.opType;
		data['isDraft'] = this.isDraft;
		data['orderNum'] = this.orderNum;
		data['albumId'] = this.albumId;
		data['sampleDuration'] = this.sampleDuration;
		data['type'] = this.type;
		data['title'] = this.title;
		data['isRichAudio'] = this.isRichAudio;
		data['duration'] = this.duration;
		data['coverSmall'] = this.coverSmall;
		data['shares'] = this.shares;
		data['playUrl64'] = this.playUrl64;
		data['uid'] = this.uid;
		data['playPathAacv224'] = this.playPathAacv224;
		data['createdAt'] = this.createdAt;
		data['isAuthorized'] = this.isAuthorized;
		data['playPathHq'] = this.playPathHq;
		data['nickname'] = this.nickname;
		data['isPublic'] = this.isPublic;
		data['vipFirstStatus'] = this.vipFirstStatus;
		data['playPathAacv164'] = this.playPathAacv164;
		data['id'] = this.id;
		data['coverLarge'] = this.coverLarge;
		data['isHoldCopyright'] = this.isHoldCopyright;
		data['likes'] = this.likes;
		data['coverMiddle'] = this.coverMiddle;
		data['comments'] = this.comments;
		data['orderNo'] = this.orderNo;
		data['trackId'] = this.trackId;
		data['userSource'] = this.userSource;
		data['playtimes'] = this.playtimes;
		data['smallLogo'] = this.smallLogo;
		data['isVideo'] = this.isVideo;
		data['trackRecordId'] = this.trackRecordId;
		data['relatedId'] = this.relatedId;
		data['isPaid'] = this.isPaid;
		data['playUrl32'] = this.playUrl32;
		data['commentId'] = this.commentId;
		data['categoryId'] = this.categoryId;
		data['status'] = this.status;
		return data;
	}
}

class PlayDetailDataLoginuser {
	int uid;
	int vLogoType;

	PlayDetailDataLoginuser({this.uid, this.vLogoType});

	PlayDetailDataLoginuser.fromJson(Map<String, dynamic> json) {
		uid = json['uid'];
		vLogoType = json['vLogoType'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['uid'] = this.uid;
		data['vLogoType'] = this.vLogoType;
		return data;
	}
}

class PlayDetailDataUser {
	int albums;
	int anchorGrade;
	int vLogoType;
	bool isVerified;
	int liveRoomId;
	String smallLogo;
	bool currentAnchorIsLiving;
	int tracks;
	int uid;
	int followers;
	String personalSignature;
	int followings;
	String nickname;
	String ptitle;
	String personDescribe;
	int liveStatus;
	int verifyType;

	PlayDetailDataUser({this.albums, this.anchorGrade, this.vLogoType, this.isVerified, this.liveRoomId, this.smallLogo, this.currentAnchorIsLiving, this.tracks, this.uid, this.followers, this.personalSignature, this.followings, this.nickname, this.ptitle, this.personDescribe, this.liveStatus, this.verifyType});

	PlayDetailDataUser.fromJson(Map<String, dynamic> json) {
		albums = json['albums'];
		anchorGrade = json['anchorGrade'];
		vLogoType = json['vLogoType'];
		isVerified = json['isVerified'];
		liveRoomId = json['liveRoomId'];
		smallLogo = json['smallLogo'];
		currentAnchorIsLiving = json['currentAnchorIsLiving'];
		tracks = json['tracks'];
		uid = json['uid'];
		followers = json['followers'];
		personalSignature = json['personalSignature'];
		followings = json['followings'];
		nickname = json['nickname'];
		ptitle = json['ptitle'];
		personDescribe = json['personDescribe'];
		liveStatus = json['liveStatus'];
		verifyType = json['verifyType'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['albums'] = this.albums;
		data['anchorGrade'] = this.anchorGrade;
		data['vLogoType'] = this.vLogoType;
		data['isVerified'] = this.isVerified;
		data['liveRoomId'] = this.liveRoomId;
		data['smallLogo'] = this.smallLogo;
		data['currentAnchorIsLiving'] = this.currentAnchorIsLiving;
		data['tracks'] = this.tracks;
		data['uid'] = this.uid;
		data['followers'] = this.followers;
		data['personalSignature'] = this.personalSignature;
		data['followings'] = this.followings;
		data['nickname'] = this.nickname;
		data['ptitle'] = this.ptitle;
		data['personDescribe'] = this.personDescribe;
		data['liveStatus'] = this.liveStatus;
		data['verifyType'] = this.verifyType;
		return data;
	}
}
