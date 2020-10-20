import 'package:flutter/material.dart';
import 'package:flutter_douban/common/style/style.dart';
import 'package:flutter_douban/pages/index/index.dart';

class DoubanApp extends StatefulWidget {
  @override
  _DoubanAppState createState() => _DoubanAppState();
}

class _DoubanAppState extends State<DoubanApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '豆瓣',
      theme: ThemeData(primaryColor: DBColors.primaryValue),
      home: IndexPage(),
    );
  }
}