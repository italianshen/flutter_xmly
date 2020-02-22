
/// 关注动态和推荐动态的模型
class DiscoverActivityModel{

  ///头像
  String avatar;
  ///昵称
  String nickName;

  ///内容
  String content;

  /// 图片数组
  List<String> images;

  ///时间
  String time;

  /// 点赞数
  int likeCount;

  /// 评论数
  int commentCount;

  DiscoverActivityModel.fromJson(Map<String,dynamic> json){
    avatar = json["avatar"];
    nickName = json["nickName"];
    content = json["content"];
    images = new List<String>.from(json["images"]);
    time = json["time"];
    likeCount = json["likeCount"];
    commentCount = json["commentCount"];
  }

  Map<String,dynamic> toJson() =>{
    "avatar":avatar,
    "nickName":nickName,
    "content":content,
    "images":images,
    "likeCount":likeCount
  };
}