import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'ApiServices.dart';
import 'ArticleBeans.dart';
import 'ArticleItem.dart';

//void main() => runApp(MyApp());

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      debugShowCheckedModeBanner: false,
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: ArticleScreen(408),
//    );
//  }
//}

class ArticleScreen extends StatefulWidget {
  final int id = 408;

//  ArticleScreen(this.id);

  @override
  State<StatefulWidget> createState() {
    return new ArticleScreenState();
  }
}

class ArticleScreenState extends State<ArticleScreen>
    with AutomaticKeepAliveClientMixin {
  List<ArticleBean> _articleList = new List();

  ScrollController _scrollController = new ScrollController();

  int _page = 1;

  RefreshController _refreshController =
      new RefreshController(initialRefresh: true);

  Future getArticleList() async {
    _page = 1;
    int _id = widget.id;
    apiService.getArticleList((ArticleModel articleModel) {
      if (articleModel.isSuccess()) {
        _refreshController.refreshCompleted(resetFooterState: true);
        setState(() {
          _articleList.clear();
          _articleList.addAll(articleModel.data.datas);
        });
      } else {
        Fluttertoast.showToast(msg: articleModel.errorMsg);
      }
    }, (DioError error) {}, _id, _page);
  }

  Future getMoreArticleList() async {
    _page++;
    int _id = widget.id;
    apiService.getArticleList((ArticleModel articleModel) {
      if (articleModel.isSuccess()) {//判断是否成功
        if (articleModel.data.datas.length > 0) {//判断datas的长度
          _refreshController.loadComplete();
          setState(() {
            _articleList.addAll(articleModel.data.datas);
          });
        } else {//没有更多数据
          _refreshController.loadNoData();
        }
      } else {//失败了
        _refreshController.loadFailed();
        Fluttertoast.showToast(msg: articleModel.errorMsg);
      }
    }, (DioError error) {
      _refreshController.loadFailed();
    }, _id, _page);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _refreshController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getArticleList();
    _scrollController.addListener(() {
      /// 滑动到底部，加载更多
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        getMoreArticleList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("刷新"),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: MaterialClassicHeader(),
        controller: _refreshController,
        onRefresh: getArticleList,
        onLoading: getMoreArticleList,
        child: ListView.builder(
          itemBuilder: itemView,
          physics: new AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          itemCount: _articleList.length,
        ),
      ),
    );
  }

  Widget itemView(BuildContext context, int index) {
    return ItemArticleList(item: _articleList[index]);
  }
}
