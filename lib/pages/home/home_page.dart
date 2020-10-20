import 'package:flutter/material.dart';
import 'package:flutter_douban/components/search_bar.dart';

class HomePage extends StatefulWidget {
  final String sName = 'home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(),
      ),
      body: Container(
        child: Text('首页'),
      ),
    );
  }
}
