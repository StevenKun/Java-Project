import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BaseCard extends StatefulWidget {
  @override
  BaseCardState createState() => BaseCardState();
}

class BaseCardState extends State<BaseCard> {
  Color subTitleColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias, //抗锯齿
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[topContent(), bottomContent()],
        ),
      ),
    );
  }

  topContent() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 24, bottom: 10, top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget>[
              topTitle(''),
            ],
          ),
          subTitle('')
        ],
      ),
    );
  }

  bottomContent() {
    return Container();
  }

  subTitle(String subtitle) {
    return Padding(
      padding: EdgeInsets.only(top: 5, left: 50),
      child: Text(
        subtitle,
        style: TextStyle(fontSize: 11, color: subTitleColor),
      ),
    );
  }

  topTitle(String topTitle) {
    return Text(
      topTitle,
      style: TextStyle(fontSize: 22),
    );
  }

  void getHttp() async {
    try {
      Response response = await Dio().get("http://www.baidu.com");
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
