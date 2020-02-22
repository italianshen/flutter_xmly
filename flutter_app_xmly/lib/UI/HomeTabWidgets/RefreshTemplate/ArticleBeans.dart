class ArticleBean {
  String title;

  ArticleBean({this.title});

  ArticleBean.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }
}

class ArticleModel {
  ArticleListBean data;
  int errorCode;
  String errorMsg;

  ArticleModel({this.data, this.errorCode, this.errorMsg});

  bool isSuccess() {
    return errorCode == 0;
  }

  ArticleModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new ArticleListBean.fromJson(json['data'])
        : null;
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }
}

class ArticleListBean {//基础的结构
  List<ArticleBean> datas;
  int size;
  int total;

  ArticleListBean({this.datas, this.size, this.total});

  ArticleListBean.fromJson(Map<String, dynamic> json) {
    if (json['datas'] != null) {
      datas = new List<ArticleBean>();
      json['datas'].forEach((v) {
        datas.add(new ArticleBean.fromJson(v));
      });
    }
    size = json['size'];
    total = json['total'];
  }
}
