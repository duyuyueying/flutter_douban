import 'package:flutter/material.dart';
import 'package:flutter_douban/components/search_bar.dart';

class ClassifyPage extends StatefulWidget {
  final String sName = 'classify';
  @override
  _ClassifyPageState createState() => _ClassifyPageState();
}

class _ClassifyPageState extends State<ClassifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          hintText: '抠门男性联合会',
        ),
      ),
      body: Container(
        child: Text('小组'),
      ),
    );
  }
}
