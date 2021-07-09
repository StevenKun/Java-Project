import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterqq/content_pagerview.dart';

///
///底部导航框架搭建
///
class TabNavigate extends StatefulWidget {
  @override
  _TabNavigateState createState() => _TabNavigateState();
}

class _TabNavigateState extends State<TabNavigate> {
  final defaultColor = Colors.grey;
  final activeColor = Colors.blue;
  int _currentIndex = 0;

  final PageViewController pageViewController = PageViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xffedeef0),
          Color(0xd3e6e7e9),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: PageViewer(
          pageViewController: pageViewController,
          onPageChanged: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          pageViewController.jumpToPage(index);
          //修改状态
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          _bottomItem('本周', Icons.folder, 0),
          _bottomItem('分享', Icons.explore, 1),
          _bottomItem('免费', Icons.free_breakfast, 2),
          _bottomItem('长安', Icons.location_city, 3),
        ],
      ),
    );
  }

  _bottomItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
        icon: Icon(icon, color: defaultColor),
        activeIcon: Icon(
          icon,
          color: activeColor,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: _currentIndex != index ? defaultColor : activeColor),
        ));
  }
}
