import 'package:flutter/material.dart';
import 'package:flutter_douban/pages/home/home_page.dart';

class DoubanApp extends StatefulWidget {
  @override
  _DoubanAppState createState() => _DoubanAppState();
}

class _DoubanAppState extends State<DoubanApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '豆瓣',
      home: HomePage(),
    );
  }
}