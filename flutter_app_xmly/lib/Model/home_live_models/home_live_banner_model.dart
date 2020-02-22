class HomeLiveBannerModel {

  String cover;

  HomeLiveBannerModel.fromJson(Map<String,dynamic> json){
    cover = json["cover"];
  }

  Map<String,dynamic> toJson() =>{
    "cover":cover
  };
}