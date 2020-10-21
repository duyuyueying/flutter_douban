import 'package:flutter/material.dart';
import 'package:flutter_douban/common/style/style.dart';
import 'package:flutter_douban/pages/index/index.dart';
import 'package:oktoast/oktoast.dart';

class DoubanApp extends StatefulWidget {
  @override
  _DoubanAppState createState() => _DoubanAppState();
}

class _DoubanAppState extends State<DoubanApp> {
  @override
  Widget build(BuildContext context) {
   
    return OKToast(
        // backgroundColor: Color(0xDD000000).withOpacity(.7),
        // textPadding: EdgeInsets.symmetric(
        //   horizontal: 12.0,
        //   vertical: 6.0,
        // ),
        child: MaterialApp(
          title: '豆瓣',
          theme: ThemeData(primaryColor: DBColors.primaryValue),
          home: IndexPage(),
        ));
  }
}
