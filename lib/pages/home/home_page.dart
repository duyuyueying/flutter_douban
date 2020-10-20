import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String sName = 'home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页'),),
      body: Container(child: Text('首页'),),
    );
  }
}