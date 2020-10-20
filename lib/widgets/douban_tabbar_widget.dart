import 'package:flutter/material.dart';
import 'package:flutter_douban/common/style/style.dart';

/**
 * tabbar方案二PageView + TabBar
 * 
 */
class DoubanTabbarWidget extends StatefulWidget {
  final TabType type;
  final List<Widget> tabItems;
  final List<Widget> tabViews;
  final ValueChanged<int> onPageChanged;
  final Color backgroundColor;
  final Color indicatorColor;
  final Color unselectedLabelColor;
  final Color labelColor;

  const DoubanTabbarWidget({
    Key key,
    this.type = TabType.bottom,
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

class _DoubanTabbarWidgetState extends State<DoubanTabbarWidget>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  TabController _tabController;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabItems.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _navigationPageChanged(index) {
    if (index == _index) {
      return;
    }
    _index = index;
    _tabController.animateTo(index);
  }

  _navigatioTapClick(index) {
    if (index == _index) {
      return;
    }
    _index = index;
    _pageController.jumpTo(MediaQuery.of(context).size.width * index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: widget.tabViews,
        controller: _pageController,
        onPageChanged: _navigationPageChanged,
      ),
      bottomNavigationBar: Material(
        color: widget.backgroundColor ?? Theme.of(context).primaryColor,
        shape: Border(top: BorderSide(color: DBColors.border2Value, width: 0.3)),
        child: SafeArea(
          child: TabBar(
            controller: _tabController,
            tabs: widget.tabItems,
            onTap: _navigatioTapClick,
            indicatorColor: widget.indicatorColor ?? Theme.of(context).primaryColor,
            labelColor: widget.labelColor != null ? widget.labelColor : Theme.of(context).primaryTextTheme.bodyText1.color,
            unselectedLabelColor: widget.unselectedLabelColor != null ? widget.unselectedLabelColor : Theme.of(context).primaryTextTheme.bodyText1.color.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}

enum TabType { top, bottom }

class TabModel{
  final String iconName;
  final String name;

  TabModel({this.iconName, this.name});
}
