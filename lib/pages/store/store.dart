import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  final String sName = 'store';
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('市集'),
    );
  }
}