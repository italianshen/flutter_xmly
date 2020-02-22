import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'ArticleBeans.dart';

class ItemArticleList extends StatefulWidget {
  final ArticleBean item;

  ItemArticleList({this.item});

  @override
  State<StatefulWidget> createState() {
    return new ItemArticleListState();
  }
}

class ItemArticleListState extends State<ItemArticleList> {
  @override
  Widget build(BuildContext context) {
    var item = widget.item;
    return InkWell(
      onTap: () {
        Fluttertoast.showToast(msg: item.title);
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    item.title,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
          Divider(height: 1),
        ],
      ),
    );
  }

}
