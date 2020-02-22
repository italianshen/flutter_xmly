
class BaseModel {
  int code;
  dynamic data;
  String error;

  BaseModel({this.code,this.data,this.error});

  BaseModel.fromJson(Map<String,dynamic> json){
    code = json["code"];
    data = json["data"];
    error = json["error"];
  }
}