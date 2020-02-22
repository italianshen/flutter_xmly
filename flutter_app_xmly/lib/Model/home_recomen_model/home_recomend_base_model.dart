

class HomeRecomendBaseListModel {

  bool showInterestCard;
  List<Map<String,dynamic>> list;
  bool bottomHasMore;
  int loopCount;
  bool isNewUser;
  int moduleId;
  bool hasMore;
  String moduleType;
  int categoryId;
  String title;


  HomeRecomendBaseListModel.fromJson(Map<String, dynamic> json) {
    moduleType = json['moduleType'];
    bottomHasMore = json['bottomHasMore'];
    hasMore = json['hasMore'];
    isNewUser = json['isNewUser'];
    categoryId = json['categoryId'];
    title = json['title'];
    if (json['list'] != null) {
      // 判断
      List<Map<String,dynamic>> listArr = new List<Map<String,dynamic>>.from(json['list']);
      if(listArr != null && listArr.length != 0){
        list = listArr;
      }
    }
    loopCount = json['loopCount'];
    moduleId = json['moduleId'];
    showInterestCard = json['showInterestCard'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['moduleType'] = this.moduleType;

    data['bottomHasMore'] = this.bottomHasMore;
    data['hasMore'] = this.hasMore;
    data['isNewUser'] = this.isNewUser;
    data['loopCount'] = this.loopCount;
    data['moduleId'] = this.moduleId;
    data['showInterestCard'] = this.showInterestCard;
    return data;
  }

}
