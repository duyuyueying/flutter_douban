import 'package:flutter/material.dart';

class ClassifyPage extends StatefulWidget {
  final String sName = 'classify';
  @override
  _ClassifyPageState createState() => _ClassifyPageState();
}

class _ClassifyPageState extends State<ClassifyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('小组'),
    );
  }
}