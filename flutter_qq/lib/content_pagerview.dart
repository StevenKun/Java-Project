import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterqq/card_changan.dart';
import 'package:flutterqq/card_free.dart';
import 'package:flutterqq/card_recommend.dart';
import 'package:flutterqq/card_shared.dart';

import 'custom_appbar.dart';

class PageViewer extends StatefulWidget {
  final ValueChanged<int> onPageChanged;

  final PageViewController pageViewController;

  //构造方法,可选参数
  const PageViewer({
    Key key,
    this.onPageChanged,
    this.pageViewController,
  }) : super(key: key); //构造方法}):
  @override
  _PageViewState createState() => _PageViewState();
}

class _PageViewState extends State<PageViewer> {
  PageController _pageController = PageController(viewportFraction: 0.8);
  static List<Color> colors = [
    Colors.blue,
    Colors.grey,
    Colors.red,
    Colors.yellow,
    Colors.green
  ];

  @override
  void initState() {
    if (widget.pageViewController != null) {
      widget.pageViewController._pageController = _pageController;
    }
    _statusBar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomAppBar(),
        Expanded(
            //高度撑开,否则在Collo
            child: PageView(
          onPageChanged: widget.onPageChanged,
          controller: _pageController,
          children: <Widget>[
//            _wrapItem(0),
//            _wrapItem(1),
//            _wrapItem(2),
//            _wrapItem(3),
            _wrapItem(CardRecommend()),
            _wrapItem(CardShared()),
            _wrapItem(CardFree()),
            _wrapItem(CardChangAn()),
          ],
        ))
      ],
    );
  }

  _wrapItem(Widget  widget) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: widget ,
//      Container(
//        decoration: BoxDecoration(color: colors[index]),
//      ),
    );
  }

  //沉浸式状态栏
  _statusBar() {
    SystemUiOverlayStyle uiOverlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarDividerColor: null,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );

    SystemChrome.setSystemUIOverlayStyle(uiOverlayStyle);
  }
}

class PageViewController {
  PageController _pageController;

  void jumpToPage(int page) {
    //dart 编程技巧:安全的调用
    _pageController?.jumpToPage(page);
  }
}
