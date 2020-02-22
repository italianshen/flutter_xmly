import 'package:flutter/material.dart';

class MinePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MinePageState();
  }
}

class _MinePageState extends State<MinePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.green,
      child: Center(
        child: Text('我的'),
      ),
    );
  }
}
