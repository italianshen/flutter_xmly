import 'package:dio/dio.dart';
import 'package:flutter_app_xmly/Model/net_util.dart';
import 'service_url.dart';
import 'package:flutter/material.dart';
class HomeApi {

  final Dio _dio = new Dio();

  // 获取猜你喜欢列表数据
  void requestGuessYouLikeListData(int page,Function success, Function failure){
    String path = service_base_url + servicePath["guessYouLikeMoreList"];
    Map<String,dynamic> params = guessYouLikeMoreListParams(page);
    debugPrint("请求的地址:$path");
    debugPrint("请求的参数:$params");
    NetUtil.getGuessYouLikeListData(path, params,success: (responseJson){
      success(responseJson);
    },failure: (error){
      failure(error);
    });
  }

  /// 获取首页推荐列表数据
  void requestRecommendListData(Function success, Function failure){
    String path = service_base_url + servicePath["recommendList"];
    Map<String,dynamic> params = recommendListParams();
    debugPrint("请求的地址:$path");
    debugPrint("请求的参数:$params");
    NetUtil.getRecomendListData(path, params,success: (list){
      success(list);
    },failure: (error){
      failure(error);
    });
  }

  // 获取猜你喜欢列表数据
  Future getGuessYouLikeMoreList(int page) async{
    print("🟣开始请求猜你喜欢的列表数据");
    try{
      String path = service_base_url + servicePath["guessYouLikeMoreList"];
      var params = guessYouLikeMoreListParams(page);
      print("🟣请求地址>>>$path");
      print("🟣请求参数$params");
      var response = await _dio.get(path,queryParameters: params);
      if(response.statusCode == 200){
        return response.data;
      }else{
        throw Exception(["request error:" + path]);
      }
    }catch(e){
      return print(e);
    }
  }

  /// 请求直播分类详情的数据
  void requestLiveCategoryDetailList(int page,int channelId,Function success, Function failure) async{
    print("🟣开始请求猜你喜欢的列表数据");
    String path = live_category_service_base_url + servicePath["liveCategoryDetailList"];
    var params = liveCategoryDetailListParams(page, channelId);
    print("🟣请求地址>>>$path");
    print("🟣请求参数$params");
    debugPrint("请求的参数:$params");
    NetUtil.getLiveCategoryListData(path, params,success: (responseJson){
      success(responseJson);
    },failure: (error){
      failure(error);
    });
  }


  /// 获取播放页详情的数据
  void requestAlbumPlayDetailData(int albumId,Function success, Function failure) async{
    print("🟣获取播放页详情的数据");
    String path = service_base_url + servicePath["albumDetail"];
    var params = albumPlayDetailParams(albumId);
    print("🟣请求地址>>>$path");
    print("🟣请求参数$params");
    debugPrint("请求的参数:$params");
    NetUtil.getAlbumDetailData(path, params,success: (responseJson){
      success(responseJson);
    },failure: (error){
      failure(error);
    });
  }

  /// playerPageInfoParams 播放器详情页请求
  // 获取猜你喜欢列表数据
  Future getAlbumInfoPlayer(int albumId,int trackUid,int uid) async{
    print("🟣开始请求播放器详情列表数据");
    try{
      String path = service_base_url + servicePath["albumPlayDetailApiPath"];
      var params = playerPageInfoParams(albumId, trackUid, uid);
      print("🟣请求地址>>>$path");
      print("🟣请求参数$params");
      var response = await _dio.get(path,queryParameters: params);
      if(response.statusCode == 200){
        return response.data;
      }else{
        throw Exception(["request error:" + path]);
      }
    }catch(e){
      return print(e);
    }
  }

  /// 播放页详情的参数专辑详情
  Map<String,dynamic> albumPlayDetailParams(int albumId){
    var map = new Map<String,dynamic>();
    map["source"] = 4;
    map["ac"] = "WIFI";
    map["isQueryInvitationBrand"] = false;
    map["device"] = "iPhone";
    map["albumId"] = albumId;
    map["pageSize"] = 20;
    map["isAsc"] = false;
    return map;
  }

  /// 直播分类详情的参数
  Map<String,dynamic> liveCategoryDetailListParams(int page,int channelId){
    var map = new Map<String,dynamic>();
    map["appid"] = 0;
    map["pageSize"] = 20;
    map["network"] = "WIFI";
    map["operator"] = 3;
    map["scale"] = 3;
    map["pageId"] = page;
    map["device"] = "iPhone";
    map["version"] = "6.5.3";
    map["xt"] = new DateTime.now().millisecondsSinceEpoch;
    map["channelId"] = channelId;
    return map;
  }



/*
*
* ac=WIFI&albumId=2863318&appid=0&device=iPhone&deviceId=5DC0EF2A-01F6-41D1-8455-C4A1BF927E36&network=WIFI&operator=3&scale=3&trackUid=1076337&uid=124057809&version=6.5.3&xt=1535003263718
* */
  /// 获取播放器页面的数据
  Map<String,dynamic> playerPageInfoParams(int albumId,int trackUid,int uid){
    var map = new Map<String,dynamic>();
    map["ac"] = "WIFI";
    map["albumId"] = albumId;
    map["appid"] = 0;
    map["device"] = "iPhone";
    map["deviceId"] = "5DC0EF2A-01F6-41D1-8455-C4A1BF927E3";
    map["network"] = "WIFI";
    map["operator"] = 3;
    map["scale"] = 3;
    map["trackUid"] = trackUid;
    map["uid"] = uid;
    map["xt"] = new DateTime.now().millisecondsSinceEpoch;
    return map;
  }




  // 获取猜你喜欢的参数map
  /*
  * ?device=iPhone
  * &appid=0&
  * inreview=false
  * &network=WIFI
  * &operator=3
  * &pageId=1
  * &pageSize=20
  * &scale=3
  * &uid=124057809
  * &version=6.5.3
  * &xt=1580391846
  * &deviceId=03508a1a232a9ec86e232a0bb2e
  * */
  Map<String,dynamic> guessYouLikeMoreListParams(int page){
    var map = new Map<String,dynamic>();
    map["device"] = "iPhone";
    map["appid"] = 0;
    map["inreview"] = false;
    map["network"] = "WIFI";
    map["operator"] = 3;
    map["pageId"] = page;
    map["pageSize"] = 20;
    map["scale"] = 3;
    map["uid"] = 124057809;
    map["version"] = "6.5.3";
    map["xt"] = new DateTime.now().millisecondsSinceEpoch;
    map["deviceId"] = "03508a1a232a9ec86e232a0bb2e";
    return map;
  }

  /// 首页推荐列表的参数
  /// http://mobile.ximalaya.com/discovery-firstpage/v2/explore/ts-1532411485052
  /// ?pullToRefresh=true&operator=3&version=6.5.3&categoryId=-2&scale=3&network=WIFI&appid=0&channel=ios-b1&uid=0&deviceId=B2AA436D-50B6-4BB3-B0D3-8A5D07EFBCA6&code=43_310000_3100&includeActivity=true&xt=1581398883&device=iPhone&includeSpecial=true
  Map<String,dynamic> recommendListParams(){
    var map = new Map<String,dynamic>();
    map["pullToRefresh"] = true;
    map["operator"] = 3;
    map["version"] = "6.5.3";
    map["categoryId"] = -2;
    map["scale"] = 3;
    map["network"] = "WIFI";
    map["appid"] = 0;
    map["channel"] = "ios-b1";
    map["uid"] = 0;
    map["deviceId"] = "B2AA436D-50B6-4BB3-B0D3-8A5D07EFBCA6";
    map["code"] = "43_310000_3100";
    map["includeActivity"] = true;
    map["xt"] = new DateTime.now().millisecondsSinceEpoch ;
    map["device"] = "iPhone";
    map["includeSpecial"] = true;
    return map;
  }




}
