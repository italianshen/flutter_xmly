import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class WotingPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WotingPageState();
  }
}

class _WotingPageState extends State<WotingPage>{
  // 获取json资料的url
  final String url = "https://jsonplaceholder.typicode.com/posts";

  List<Map<String,dynamic>> datas;


  getJsonFile() async {
    debugPrint("获取json");
  }




  //MARK: - 使用gridViewCount
  Widget buildGridViewCount(){
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 2/3,
      children: List.generate(100, (index){
        return Card(
          child: Container(
            color: Colors.green,
            child: Center(
              child: Text("index$index"),
            ),
          ),
        );
      }),
    );
  }

  // 使用SliverGridDelegateWithFixedCrossAxisCount
  Widget buildFixedCrossCount(){
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0
        ),
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Container(
              color: Colors.orange,
              child: Center(
                child: Image.network(
                  "https://resources.ninghao.net/images/childhood-in-a-picture.jpg",
                  fit: BoxFit.cover,),
              ),
            ),
          );
        });
  }

  Widget buildMaxCrossCount(){
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          childAspectRatio: 2/3
        ),
        itemBuilder: (BuildContext context,int index){
          return InkWell(
            onTap: (){
              debugPrint('你点击了item');
//              getJsonFile();
//              Navigator.of(context).pushNamed("formdemo");
              Navigator.of(context).pushNamed("test");
            },
            child: Card(
              child: Container(
                color: Colors.purple,
                child: Center(
                  child: Image.network(
                    "https://resources.ninghao.net/images/childhood-in-a-picture.jpg",
                    fit: BoxFit.cover,),
                ),
              ),
            ),
          );
        });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('我听'),),
      body: buildMaxCrossCount()
    );
  }
}

class TestPage extends StatefulWidget{

@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestPageState();
  }
}

class _TestPageState extends State<TestPage>{

  final titleStyle = TextStyle(
    fontSize: 24.0,
    fontFamily: "yahei",
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.dashed,
    color: Colors.yellow
  );

  final subTitleStyle = TextStyle(
      fontSize: 14.0,
      fontFamily: "yahei",
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.dashed,
      color: Colors.orange
  );

  // 获取json资料的url
  final String url = "https://jsonplaceholder.typicode.com/posts";
    // 数据源
    //
  List<Map<String,dynamic>> datas;

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}


class DannyStudyPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DannyStudyPageState();
  }

}

class _DannyStudyPageState extends State<DannyStudyPage>{

  // 选择城市列表
  List<DropdownMenuItem> listCities = [];

  var selectedCity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final shanghai = DropdownMenuItem(child: Text('上海'));
    final beijing = DropdownMenuItem(child: Text('北京'));
    final shenzhen = DropdownMenuItem(child: Text('深圳'));
    final guangzhou = DropdownMenuItem(child: Text('广州'));
    listCities.add(shanghai);
    listCities.add(beijing);
    listCities.add(shenzhen);
    listCities.add(guangzhou);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("学习"),
      ),
      body: Column(
        children: <Widget>[
          Text.rich(TextSpan(
            children: [
              TextSpan(
                text: '主页',
                style: TextStyle(
                  color: Colors.black
                )
              ),
              TextSpan(
                  text: 'https://www.baidu.com',
                  style: TextStyle(
                      color: Colors.blue
                  )
              ),
            ]
          )),

          // 下拉框
          MyCustomDropDownMenu()

        ],
      ),
    );
  }
}

class MyFormDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyFormDemoState();
  }
}

class _MyFormDemoState extends State<MyFormDemo>{

  GlobalKey _formKey = new GlobalKey<FormState>();

  TextEditingController _textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Form Demo"),),
      body: Column(
        children: <Widget>[
          new Form(
              key: _formKey,
              autovalidate: true,
              child: TextFormField(
                controller: _textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "请输入用户名",
                  labelText: "用户名",
                  icon: Icon(Icons.perm_contact_calendar)
                ),
                validator: (val){
                  return val.trim().length > 0 ? null : "输入错误";
                },
              )),
          RaisedButton(
              child: Text('提交'),
              onPressed: (){
              if ((_formKey.currentState as FormState).validate()){
                print(_textEditingController.text);
                print("提交数据给后台");
              }
          })
        ],
      ),
    );
  }
}


class MyCustomDropDownMenu extends StatefulWidget{
  @override
  _MyCustomDropDownMenuState createState() {
    // TODO: implement createState
    return _MyCustomDropDownMenuState();
  }
}

class _MyCustomDropDownMenuState extends State<MyCustomDropDownMenu>{


  // 选择城市列表
  List<DropdownMenuItem> listCities = [];

  var selectedCity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final shanghai = DropdownMenuItem(child: Text('上海'),value: "shanghai");
    final beijing = DropdownMenuItem(child: Text('北京'),value: "beijing");
    final shenzhen = DropdownMenuItem(child: Text('深圳'),value: "shenzhen");
    final guangzhou = DropdownMenuItem(child: Text('广州'),value: "guangzhou");
    listCities.add(shanghai);
    listCities.add(beijing);
    listCities.add(shenzhen);
    listCities.add(guangzhou);
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        DropdownButton(
        items: listCities,
        hint: Text("请选择城市"),
        value: selectedCity,
        onChanged: (val){
          setState(() {
            this.selectedCity = val;
          });
        })
      ],
    );
  }
}

class MyFlexLayoutPage extends StatefulWidget{

  @override
  _MyFlexLayoutPageState createState() {
    // TODO: implement createState
    return _MyFlexLayoutPageState();
  }
}

class _MyFlexLayoutPageState extends State<MyFlexLayoutPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Wrap(
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 200,
          height: 100,
          color: Colors.red,
        ),
        Container(
          width: 200,
          height: 100,
          color: Colors.green,
        ),
        Container(
          width: 200,
          height: 100,
          color: Colors.blue,
        ),
      ],
    );
  }
}
