import 'package:flutter/material.dart';
import 'package:flutter_app_xmly/API/HomeApi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_xmly/Model/BaseResponseModel.dart';
import 'package:flutter_app_xmly/UI/HomeTabWidgets/guess_you_like_list_item.dart';
class HomeGuessYouLikePage extends StatefulWidget{
  
  @override
  _HomeGuessYouLikePageState createState() => _HomeGuessYouLikePageState();
  
}

class _HomeGuessYouLikePageState extends State<HomeGuessYouLikePage> {

  // 首页网络请求工具类
  HomeApi _homeApi = HomeApi();

  List<Map<String,dynamic>> arr = new List();

  int page = 1;

  // 控制器监听listViw滚动属性
  ScrollController _controller = new ScrollController();


  Future<Map> getGuessYouLikeMoreData(int page) async{
    return _homeApi.getGuessYouLikeMoreList(page);
  }

  Future<void> _onRefresh() async{
    this.page = 1;
    await getGuessYouLikeMoreData(this.page);
  }

  Future<void> _onLoadMoreRefresh() async{
    this.page += 1;
    await getGuessYouLikeMoreData(this.page);

    Future.delayed(Duration(seconds: 2)).then((e){
      for (int i=0;i<this.arr.length;i++){
        var index = 1000 + (i % 1000);
        this.arr.add(
            {
              "title":"TT免费双播总裁｜隐婚前妻疼你入骨&宠妻入怀作者同名作",
              "recReason":"不知道为啥",
              "tracks":index,
              "coverMiddle":"http://imagev2.xmcdn.com/group61/M0B/65/C1/wKgMcF0cSEyDfjBZAAI9zodqLCI549.jpg!op_type=5&upload_type=album&device_type=ios&name=medium&magick=png",
              "coverSmall":"http://imagev2.xmcdn.com/group61/M0B/65/C1/wKgMcF0cSEyDfjBZAAI9zodqLCI549.jpg!op_type=5&upload_type=album&device_type=ios&name=medium&magick=png",
              "coverLarge":"http://imagev2.xmcdn.com/group61/M0B/65/C1/wKgMcF0cSEyDfjBZAAI9zodqLCI549.jpg!op_type=5&upload_type=album&device_type=ios&name=medium&magick=png"
            }
        );
      }
      setState(() {
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 给controller添加监听
    _controller.addListener((){
      // 判断是否华东道了页面的最底部
      if(_controller.position.pixels == _controller.position.maxScrollExtent){
        debugPrint("上拉加载更多");
      }
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("猜你喜欢"),
      ),
      body: FutureBuilder(
          future: _homeApi.getGuessYouLikeMoreList(this.page),
          builder: (BuildContext context,AsyncSnapshot snapshot){
           if (snapshot.connectionState == ConnectionState.waiting){
             return Container(
               child: Center(
                 child: CircularProgressIndicator(),
               ),
             );
           }else{
             if(snapshot.hasError){
               return Container(
                 child: Center(
                   child: Text("请求数据失败"),
                 ),
               );
             }else{
               var responseData = snapshot.data;
               debugPrint("🍅 获取到的服务器数据1:$responseData");
               List<dynamic> listArr1 = responseData["list"];
               if(this.page == 1){
                 this.arr.clear();
               }
               listArr1.forEach((dict){
                 Map<String,dynamic> data = dict as Map<String,dynamic>;
                 this.arr.add(data);
               });

               return RefreshIndicator(
                   child: ListView.builder(
                       controller: _controller,
                       physics: BouncingScrollPhysics(),
                       itemCount: this.arr == null ? 0 : this.arr.length,
                       itemBuilder: (BuildContext context,index){
                         Map<String,dynamic> data = this.arr[index];
                         debugPrint("🤡 $data");
                         String title = data["title"];
                         String recReason = data["recReason"];
                         debugPrint("🤡 🤡$title");
                         debugPrint("🤡 🤡 🤡 $recReason");
                         HomeGuessYouLikeListModel model = HomeGuessYouLikeListModel.fromJson(data);
                         return GuessYouLikeListItemView(model);
                       }),
                   onRefresh: _onRefresh);
             }
           }
          })
    );
  }
  
}