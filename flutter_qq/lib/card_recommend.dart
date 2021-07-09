import 'package:flutter/material.dart';
import 'package:flutterqq/base_card.dart';

///本周推荐
class CardRecommend extends BaseCard {
  _CardRecommendState createState() => _CardRecommendState();
}

class _CardRecommendState extends BaseCardState {
  @override
  void initState() {
    subTitleColor = Color(0xffb99444);
    super.initState();
  }

  @override
  bottomContent() {
    return Expanded(
        child: Container(
      constraints: BoxConstraints.expand(),
      margin: EdgeInsets.only(top: 20),
      child: Image.network('http://www.devio.org/io/flutter_beauty/card_1.jpg',
          fit: BoxFit.cover),
    ));
  }

//  @override
//  bottomContent() {
//    return Expanded(
//        child: Container(
//            constraints: BoxConstraints.expand(),
//            margin: EdgeInsets.only(top: 20),
//            child: ListView(
//              padding: EdgeInsets.symmetric(vertical: 8),
//              children: <Widget>[
//
//                ListTile(
//                  onTap: () {
//
//                  },
//                  leading: ExcludeSemantics(
//                    child: CircleAvatar(
//                      child: Text("1"),
//                    ),
//                  ),
//                )
//              ],
//            )));
//  }

  @override
  Widget subTitle(String subtitle) {
    return super.subTitle("精彩每一天");
  }

  @override
  topTitle(String topTitle) {
    return super.topTitle("本周推荐");
  }
}
