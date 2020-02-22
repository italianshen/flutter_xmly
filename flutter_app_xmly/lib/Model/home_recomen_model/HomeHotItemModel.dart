class HomeHotItemModel {

  String  coverPath;
  String  title;

  HomeHotItemModel(this.coverPath,this.title);

  HomeHotItemModel.fromJson(Map<String,dynamic> json){
    coverPath = json["coverPath"];
    title = json["title"];
  }

  Map<String,dynamic> toJson() =>{
    "title":title,
    "coverPath":coverPath
  };
}

