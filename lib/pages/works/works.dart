import 'package:flutter/material.dart';

class WorksPage extends StatefulWidget {
  final String sName = 'works';
  @override
  _WorksPageState createState() => _WorksPageState();
}

class _WorksPageState extends State<WorksPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('书影音'),
    );
  }
}