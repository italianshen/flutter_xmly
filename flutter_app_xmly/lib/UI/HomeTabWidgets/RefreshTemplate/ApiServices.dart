import 'package:dio/dio.dart';

import 'ArticleBeans.dart';

ApiService _apiService = new ApiService();

ApiService get apiService => _apiService;

class ApiService {
  Dio dio = Dio();

  /// 获取公众号文章列表数据
  void getArticleList(
      Function callback, Function errorCallback, int _id, int _page) async {
    String baseUrl = "https://www.wanandroid.com/wxarticle/list";
    dio.get(baseUrl + "/$_id/$_page/json").then((response) {
      callback(ArticleModel.fromJson(response.data));
    }).catchError((e) {
      errorCallback(e);
    });
  }
}
