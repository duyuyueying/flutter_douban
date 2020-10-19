import 'package:flutter/material.dart';

class DoubanTabbarWidget extends StatefulWidget {
  final TabType type;
  final List<Widget> tabItems;
  final List<Widget> tabViews;
  final ValueChanged<int> onPageChanged;

  const DoubanTabbarWidget({
    Key key, this.type, this.tabItems, this.tabViews, this.onPageChanged})
      : super(key: key);

  @override
  _DoubanTabbarWidgetState createState() => _DoubanTabbarWidgetState();
}

class _DoubanTabbarWidgetState extends State<DoubanTabbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

enum TabType { top, bottom }
