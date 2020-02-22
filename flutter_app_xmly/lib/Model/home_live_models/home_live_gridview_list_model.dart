

/// 直播网格视图模型
class HomeLiveGridViewListModel {
   String coverLarge;/// 大图封面

   String name;/// 名称

   String nickname;/// 昵称

    /// categoryName
   String categoryName;/// 分类名

   HomeLiveGridViewListModel.fromJson(Map<String,dynamic> json){
     coverLarge = json["coverLarge"];
     name = json["name"];
     nickname = json["nickname"];
     categoryName = json["categoryName"];
   }

   Map<String,dynamic> toJson() =>{
     "coverLarge":coverLarge,
     "name":name,
     "nickname":nickname,
     "categoryName":categoryName
   };
}