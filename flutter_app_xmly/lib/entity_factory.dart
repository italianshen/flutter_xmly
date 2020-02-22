import 'package:flutter_app_xmly/Model/home_broadcast_models/home_broadcast_entity.dart';
import 'package:flutter_app_xmly/Model/home_vip_model/home_vip_entity.dart';
import 'package:flutter_app_xmly/Model/home_live_models/live_category_detail_entity.dart';
import 'package:flutter_app_xmly/Model/home_recomen_model/recomend_response_entity.dart';
import 'package:flutter_app_xmly/Model/home_recomen_model/recomend_entity.dart';
import 'package:flutter_app_xmly/Model/home_classify_models/home_classify_entity.dart';
import 'package:flutter_app_xmly/Model/play_detail_models/play_detail_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "HomeBroadcastEntity") {
      return HomeBroadcastEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeVipEntity") {
      return HomeVipEntity.fromJson(json) as T;
    } else if (T.toString() == "LiveCategoryDetailEntity") {
      return LiveCategoryDetailEntity.fromJson(json) as T;
    } else if (T.toString() == "RecomendResponseEntity") {
      return RecomendResponseEntity.fromJson(json) as T;
    } else if (T.toString() == "RecomendEntity") {
      return RecomendEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeClassifyEntity") {
      return HomeClassifyEntity.fromJson(json) as T;
    } else if (T.toString() == "PlayDetailEntity") {
      return PlayDetailEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}