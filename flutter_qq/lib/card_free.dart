import 'dart:convert';
import 'dart:developer';

import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterqq/base_card.dart';
import 'package:flutterqq/card_shared.dart';
import 'package:flutterqq/network/http.dart';
import 'package:flutterqq/utils/button_resubmit_util.dart';

class CardFree extends BaseCard {
  @override
  _CardFreeState createState() => _CardFreeState();
}

const BOOK_LIST = [
  {'title': '暴力沟通', 'cover': '51VykQqGq9L._SY346_.jpg', 'price': '19.6'},
  {'title': '论中国', 'cover': '41APiBzC41L.jpg', 'price': '36.6'},
  {'title': '饥饿的盛世：乾隆时代的得与失', 'cover': '51M6M87AXOL.jpg', 'price': '15.92'},
  {'title': '焚天之怒第4卷至大结局', 'cover': '51oIE7H5gnL.jpg', 'price': '56.9'},
  {'title': '我就是风口', 'cover': '51vzcX1U1FL.jpg', 'price': '88.8'},
  {'title': '大宋的智慧', 'cover': '517DW6EbhGL.jpg', 'price': '22.8'}
];

class _CardFreeState extends BaseCardState {
  String _buttonText = "免费收听";
  final wordPair = new WordPair("xiao", "good");

  @override
  void initState() {
    return super.initState();
  }

  @override
  bottomContent() {
    // TODO: implement bottomContent
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            Expanded(child: _booklist()),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),
            _bottomButton()
          ],
        ),
      ),
    );
  }

  @override
  topTitle(String topTitle) {
    return super.topTitle("免费听说");
  }

  @override
  subTitle(String subtitle) {
    // TODO: implement subTitle
    return super.subTitle("free is best");
  }

  _booklist() {
    return GridView.count(
      crossAxisCount: 3,
      //垂直间距
      mainAxisSpacing: 10,
      //水平间距
      crossAxisSpacing: 15,
      //长宽比
      childAspectRatio: 0.46,
      padding: EdgeInsets.only(left: 15, right: 15),
      children: BOOK_LIST.map((item) {
        return _item(item);
      }).toList(),
    );
  }

  _bottomButton() {
    return FractionallySizedBox(
        widthFactor: 1,
        alignment: AlignmentDirectional.center,
        child: RaisedButton(
          onPressed: () {
            bool isResubmit = ResubmitDeal.resubmitDealFunction();

            if (isResubmit) {
            } else {
              Map<String, String> parms = {"vmacId": "3141"};
              DioManager.getInstance()
                  .get("/second/findbyVmacIDforExcetion", parms, (data) {
                setState(() {
                  _buttonText == "免费收听"
                      ? _buttonText = '正在收听...'
                      : _buttonText = "免费收听";
                });
              }, (error) {
                log(error);
              });
            }

//            Navigator.push(
//                context, MaterialPageRoute(builder: (context) => CardShared()));
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.blue,
          padding: EdgeInsets.only(top: 12, bottom: 15, left: 10, right: 10),
          child: Text(_buttonText),
        ));
  }

  Widget _item(Map<String, String> item) {
    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Image.network(
                  'http://www.devio.org/io/flutter_beauty/card_1.jpg'),
              Container(
                width: 30,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black38,
                ),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
              Positioned(
                  bottom: 1,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(color: Colors.black54),
                    child: Text(
                      "单价${item['price']}",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 1),
            child: Text(
              item['title'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
