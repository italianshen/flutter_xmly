
/// 配音
class DiscoverDubModel{

  ///头像
  String avatar;
  ///昵称
  String nickName;

  ///内容
  String content;

  /// 图片
  String pic;

  ///时间
  String time;

  /// 点赞数
  int likeCount;

  /// 评论数
  int commentCount;

  DiscoverDubModel.fromJson(Map<String,dynamic> json){
    avatar = json["avatar"];
    nickName = json["nickName"];
    content = json["content"];
    pic = json["pic"];
    time = json["time"];
    likeCount = json["likeCount"];
    commentCount = json["commentCount"];
  }

  Map<String,dynamic> toJson() =>{
    "avatar":avatar,
    "nickName":nickName,
    "content":content,
    "pic":pic,
    "likeCount":likeCount
  };
}