import 'package:flutter/material.dart';
import 'package:flutter_douban/common/style/style.dart';
import 'package:flutter_douban/pages/classify/classify.dart';
import 'package:flutter_douban/pages/home/home_page.dart';
import 'package:flutter_douban/pages/store/store.dart';
import 'package:flutter_douban/pages/user_center/user_center.dart';
import 'package:flutter_douban/pages/works/works.dart';
import 'package:flutter_douban/widgets/douban_tabbar_widget1.dart';

class IndexPage extends StatefulWidget {
  static final String sName = "index";

  @override
  _IndexPageState createState() => _IndexPageState();
}

BottomNavigationBarItem _renderTab(TabModel item) {
  return BottomNavigationBarItem(
    icon: Image.asset("assets/images/${item.iconName}.png", width: 30,),
    activeIcon: Image.asset("assets/images/${item.iconName}_active.png", width: 30,),
    label: item.name,
  );
}

class _IndexPageState extends State<IndexPage> {
  List<BottomNavigationBarItem> tabs = [
    _renderTab(TabModel(iconName: 'home', name: '首页')),
    _renderTab(TabModel(iconName: 'subject', name: '书影音')),
    _renderTab(TabModel(iconName: 'group', name: '小组')),
    _renderTab(TabModel(iconName: 'mall', name: '市集')),
    _renderTab(TabModel(iconName: 'profile', name: '我的')),
  ];
  @override
  Widget build(BuildContext context) {
    return DoubanTabbarWidget(
        tabItems: tabs,
        tabViews: <Widget>[
          HomePage(),
          WorksPage(),
          ClassifyPage(),
          StorePage(),
          UserCenterPage()
        ],
        backgroundColor: DBColors.tagBgValue,
        indicatorColor: Colors.transparent,
        labelColor: DBColors.primaryValue,
        unselectedLabelColor: DBColors.textGreyValue);
  }
}
