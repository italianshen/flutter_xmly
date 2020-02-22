import 'net.dart';

class NetUtil {

//  static void login(Map<String,dynamic> params,{Function success, Function failure}){
//    Net().post(NetUrl.LOGIN_USER, params,success: success,failure: failure);
//  }

  // 获取列表数据getGuessYouLikeMoreList(int page)
  static void getGuessYouLikeListData(String url,Map<String,dynamic> params,{Function success, Function failure}){
    Net().get(url, params,success: success,failure: failure);
  }

  /// 获取首页推荐数据
  static void getRecomendListData(String url,Map<String,dynamic> params,{Function success, Function failure}){
    Net().get(url, params,success: success,failure: failure);
  }

  /// 获取直播分类数据推荐数据
  static void getLiveCategoryListData(String url,Map<String,dynamic> params,{Function success, Function failure}){
    Net().get(url, params,success: success,failure: failure);
  }

  /// 获取专辑详情数据
  static void getAlbumDetailData(String url,Map<String,dynamic> params,{Function success, Function failure}){
    Net().get(url, params,success: success,failure: failure);
  }
}