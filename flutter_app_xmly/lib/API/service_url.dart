const  home_recomend_ad_server_url = "http://adse.ximalaya.com";// 推荐页面穿插的广告
const  service_base_url = "http://mobile.ximalaya.com";//基础的路径地址
/// 直播详情base_url
const  live_category_service_base_url = "http://mobwsa.ximalaya.com";//基础的路径地址

// path
const servicePath = {
  "recommendList":"/discovery-firstpage/v2/explore/ts-1532411485052",//推荐列表
  "recommendForYouList":"/mobile/discovery/v4/recommend/albums",// 为你推荐
  "recommendAdList":"/ting/feed/ts-1532656780625",//推荐页面穿插的广告
  "guessYouLikeMoreList":"/discovery-firstpage/guessYouLike/list/ts-1534815616591",// 猜你喜欢更多
  "changeGuessYouLikeList":"/discovery-firstpage/guessYouLike/cycle/ts-1535167862593",// 更换猜你喜欢
  "changePaidCategoryList":"/mobile/discovery/v1/guessYouLike/paidCategory/ts-1535167980873",//更换精品
  "changeLiveList":"/lamia/v1/hotpage/exchange",// 更换直播
  "changeOtherCategory":"/mobile/discovery/v4/albums/ts-1535168024113",// 更换其他
  "liveCategoryDetailList":"/lamia/v4/live/subchannel/homepage",// 直播分类详情
  "albumDetail":"/mobile/v1/album/ts-1534832680180",
  "albumPlayDetailApiPath":"/mobile/track/v2/playpage/8281672/ts-1535003263717"
};