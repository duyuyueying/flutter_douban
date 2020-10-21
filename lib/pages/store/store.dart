import 'package:flutter/material.dart';
import 'package:flutter_douban/common/style/style.dart';
import 'package:flutter_douban/widgets/douban_tabbar_widget2.dart';

class StorePage extends StatefulWidget {
  final String sName = 'store';
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {

   Widget _renderTabItem(String tabName) {
    return Text(tabName);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [_renderTabItem('豆瓣豆品'), _renderTabItem('豆瓣时间')];
    List<Widget> tabViews = [
      Text('豆瓣豆品'),
      Text('豆瓣时间'),
    ];
    return Scaffold(
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