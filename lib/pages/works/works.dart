import 'package:flutter/material.dart';
import 'package:flutter_douban/components/search_bar.dart';
import 'package:flutter_douban/widgets/douban_tabbar_widget2.dart';

class WorksPage extends StatefulWidget {
  final String sName = 'works';
  @override
  _WorksPageState createState() => _WorksPageState();
}

class _WorksPageState extends State<WorksPage> {

  Widget _renderTabItem(String tabName) {
    return Text(tabName);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [_renderTabItem('电影'), _renderTabItem('电视'), _renderTabItem('读书'), _renderTabItem('原创小说'), _renderTabItem('音乐'), _renderTabItem('同城')];
    List<Widget> tabViews = [
      Text('电影'),
      Text('电视'),
      Text('读书'),
      Text('原创小说'),
      Text('音乐'),
      Text('同城'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(hintText:'影视作品如何影响你的现实生活'),
      ),
      body: DoubanTabbarWidget(tabItems: tabs, tabViews: tabViews),
    );
  }
}
