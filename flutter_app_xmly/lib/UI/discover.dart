import 'package:flutter/material.dart';
class DiscoveryPage extends StatefulWidget{
  @override
  _DiscoveryPageState createState() {
    // TODO: implement createState
    return _DiscoveryPageState();
  }
}

class _DiscoveryPageState extends State<DiscoveryPage>
    with SingleTickerProviderStateMixin{
  /// tabController
  TabController tabController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("发现"),
          leading: Icon(Icons.mail),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(Icons.search),
            )
          ],
        ),
        body: Container(
          color: Colors.orange,
        )
    );
  }

}

