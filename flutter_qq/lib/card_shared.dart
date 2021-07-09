import 'package:flutter/material.dart';
import 'package:flutterqq/base_card.dart';

class CardShared extends BaseCard {
  @override
  BaseCardState createState() => _CardSharedState();
}

class _CardSharedState extends BaseCardState {
  @override
  bottomContent() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image.network(
                  'http://www.devio.org/io/flutter_beauty/card_list.png',
                  fit: BoxFit.cover),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 9),
              child: bottomTitle("23013人"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  topTitle(String topTitle) {
    return super.topTitle("分享");
  }

  @override
  subTitle(String subtitle) {
    return super.subTitle("快乐齐分享");
  }

  @override
  void initState() {
    subTitleColor = Colors.yellow;
    super.initState();
  }
}

bottomTitle(String bottomTitle) {
  return Text(
    bottomTitle,
    style: TextStyle(fontSize: 12, color: Colors.grey),
  );
}
