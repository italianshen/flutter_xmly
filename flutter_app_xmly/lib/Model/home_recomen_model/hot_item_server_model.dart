
// 运营入口对应的模型 "moduleType":"square"
class HomeHotItemServerModel {

  String  coverPath;
  String  title;
  int  id;
  String  url;

  HomeHotItemServerModel(this.coverPath,this.title);

  HomeHotItemServerModel.fromJson(Map<String,dynamic> json){
    coverPath = json["coverPath"];
    title = json["title"];
    id = json["id"];
    url = json["url"];
  }

  Map<String,dynamic> toJson() =>{
    "title":title,
    "coverPath":coverPath
  };
}