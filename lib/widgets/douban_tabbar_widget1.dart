import 'package:flutter/material.dart';
import 'package:flutter_douban/common/style/style.dart';

/**
 * 
 * tabbar方案一：IndexedStack + BottomNavigationBar
 */
class DoubanTabbarWidget extends StatefulWidget {
  final List<BottomNavigationBarItem> tabItems;
  final List<Widget> tabViews;
  final ValueChanged<int> onPageChanged;
  final Color backgroundColor;
  final Color indicatorColor;
  final Color unselectedLabelColor;
  final Color labelColor;

  const DoubanTabbarWidget({
    Key key,
    @required this.tabItems,
    @required this.tabViews,
    this.onPageChanged,
    this.backgroundColor,
    this.indicatorColor,
    this.unselectedLabelColor,
    this.labelColor,
  }) : super(key: key);

  @override
  _DoubanTabbarWidgetState createState() => _DoubanTabbarWidgetState();
}

class _DoubanTabbarWidgetState extends State<DoubanTabbarWidget> {
  int _index = 1;

  @override
  void dispose() {
    super.dispose();
  }

  _navigationTapClick(index) {
    if (index == _index) {
      return;
    }
    _index = index;
    this.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: widget.tabViews,
      ),
      bottomNavigationBar: Material(
        color: widget.backgroundColor ?? Theme.of(context).primaryColor,
        shape:
            Border(top: BorderSide(color: DBColors.border2Value, width: 0.3)),
        child: SafeArea(
          child: BottomNavigationBar(
            currentIndex: _index,
            items: widget.tabItems,
            onTap: _navigationTapClick,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: widget.labelColor != null
                ? widget.labelColor
                : Theme.of(context).primaryTextTheme.bodyText1.color,
            unselectedItemColor: widget.unselectedLabelColor != null
                ? widget.unselectedLabelColor
                : Theme.of(context).primaryTextTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}

enum TabType { top, bottom }

class TabModel {
  final String iconName;
  final String name;

  TabModel({this.iconName, this.name});
}
