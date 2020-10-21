import 'package:flutter/material.dart';
import 'package:flutter_douban/common/style/style.dart';
import 'package:flutter_douban/components/search_bar.dart';
import 'package:flutter_douban/widgets/douban_tabbar_widget2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  final String sName = 'home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  Widget _renderTabItem(String tabName) {
    return Text(tabName);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [_renderTabItem('动态'), _renderTabItem('推荐')];
    List<Widget> tabViews = [
      Text('动态'),
      Text('推荐'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(hintText: '我的2020上半年总结'),
      ),
      body: DoubanTabbarWidget(
        tabItems: tabs,
        tabViews: tabViews,
        indicatorColor: DBColors.textPrimaryValue,
        labelStyle: DBTextStyle.middlePrimayBoldText ,
        unselectedLabelStyle: DBTextStyle.middleGreyText,
      ),
    );
  }
}
