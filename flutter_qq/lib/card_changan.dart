import 'package:flutter/material.dart';
import 'package:flutterqq/base_card.dart';

class CardChangAn extends BaseCard {
  @override
  _CardChangAnState createState() => _CardChangAnState();
}

class _CardChangAnState extends BaseCardState {
  @override
  void initState() {
    super.initState();
  }

  @override
  topContent() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 55, right: 55, top: 25, bottom: 30),
          decoration: BoxDecoration(color: Color(0xfffffcf7)),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey, blurRadius: 20, offset: Offset(0, 10))
            ]),
            child: Image.network(
                'http://www.devio.org/io/flutter_beauty/card_1.jpg'),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 15),
          decoration: BoxDecoration(color: Color(0xfff7f3ea)),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '长安十二时晨..',
                    style: TextStyle(fontSize: 15, color: Color(0xff473b25)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      '马伯庸',
                      style: TextStyle(fontSize: 10, color: Color(0xff7d725c)),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        colors: [Color(0xffd9bc82), Color(0xffecd9ae)])),
                child: Text(
                  '分享免费领取',
                  style: TextStyle(color: Color(0xff4f3b1a), fontSize: 13),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  bottomContent() {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, //水平撑开
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  'http://www.devio.org/io/flutter_beauty/double_quotes.jpg',
                  width: 20,
                  height: 20,
                ),
                Text('揭露历史真相')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
