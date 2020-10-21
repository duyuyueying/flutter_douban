import 'package:flutter/material.dart';
import 'package:flutter_douban/common/style/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * tabbar方案三：TabBar + TabViews
 * 
 */
class DoubanTabbarWidget extends StatefulWidget {
  final TabType type;
  final List<Widget> tabItems;
  final List<Widget> tabViews;
  final double tabHeadHeight;
  final ValueChanged<int> onPageChanged;
  // final Color backgroundColor;
  final Color indicatorColor;
  // final Color unselectedLabelColor;
  // final Color labelColor;
  final TextStyle labelStyle;
  final TextStyle unselectedLabelStyle;

  const DoubanTabbarWidget({
    Key key,
    this.type = TabType.bottom,
    @required this.tabItems,
    @required this.tabViews,
    this.tabHeadHeight = 44.0,
    this.onPageChanged,
    // this.backgroundColor,
    this.indicatorColor,
    // this.unselectedLabelColor,
    // this.labelColor,
    this.labelStyle,
    this.unselectedLabelStyle
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
    return Column(
      children: <Widget>[
        Container(
          height: widget.tabHeadHeight,
          width: ScreenUtil().screenWidth,
          alignment: AlignmentDirectional.bottomCenter,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: DBColors.borderValue, width: .3),
            ),
          ),
          child: TabBar(
            tabs: widget.tabItems,
            controller: _tabController,
            isScrollable: true,
            indicatorColor:
                widget.indicatorColor ?? Theme.of(context).indicatorColor,
            indicatorWeight:2.0,
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: EdgeInsets.only(
              top: ScreenUtil().setWidth(15),
              left: ScreenUtil().setWidth(55),
              right: ScreenUtil().setWidth(55),
              bottom: ScreenUtil().setWidth(15),
            ),
            labelColor: widget.labelStyle?.color,
            unselectedLabelColor: widget.unselectedLabelStyle?.color,
            labelStyle: widget.labelStyle ?? Theme.of(context).primaryTextTheme.bodyText1,
            unselectedLabelStyle: widget.unselectedLabelStyle ?? Theme.of(context).primaryTextTheme.bodyText1,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.tabViews,
          ),
        ),
      ],
    );
  }
}

enum TabType { top, bottom }

class TabModel {
  final String iconName;
  final String name;

  TabModel({this.iconName, this.name});
}
