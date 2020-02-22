import 'package:flutter/material.dart';

class HeaderRowListView extends StatelessWidget {
  final List<int> _listData = List<int>.generate(100, (i) => i);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: _listData.map((i) {
          return i % 10 == 0
              ? Container(
            color: Colors.grey.withOpacity(.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("Header",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    )),
                Text("Feb 26th, 2019",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black45,
                    )),
              ],
            ),
            padding: EdgeInsets.all(10.0),
          )
              : ListTile(
            title: Text("Item $i"),
          );
        }).toList(),
      ),
    );
  }
}