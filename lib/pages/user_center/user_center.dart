import 'package:flutter/material.dart';

class UserCenterPage extends StatefulWidget {
  final String sName = 'userCenter';
  @override
  _UserCenterPageState createState() => _UserCenterPageState();
}

class _UserCenterPageState extends State<UserCenterPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('个人中心'),
    );
  }
}