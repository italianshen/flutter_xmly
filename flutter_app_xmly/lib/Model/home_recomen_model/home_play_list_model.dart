class HomePlayListModel {

  String subtitle;
  String title;

  int specialId;
  String footnote;
  String coverPath;
  String contentType;

  int columnType;

  HomePlayListModel.fromJson(Map<String,dynamic> json){
    title = json["title"];
    subtitle = json["subtitle"];
    columnType = json["columnType"];
    contentType = json["contentType"];
    coverPath = json["coverPath"];
    footnote = json["footnote"];
    specialId = json["specialId"];
  }

  Map<String,dynamic> toJson() =>{
    "title":title,
    "subtitle":subtitle
  };

}