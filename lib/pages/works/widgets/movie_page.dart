import 'package:flutter/material.dart';
import 'package:flutter_douban/common/style/style.dart';
import 'package:flutter_douban/pages/works/widgets/entry_widget.dart';
import 'package:flutter_douban/pages/works/widgets/movie_tab_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviePage extends StatelessWidget {
  gotoFindMovie() {
    // TODO: 找电影页面
  }

  gotoBillboard() {
    // TODO: 豆瓣榜单页面
  }

  gotoReady() {
    // TODO: 即将上映
  }

  gotoMovieSource() {
    // TODO: 豆瓣片单
  }

  Widget _renderMovieItem() {
    return Container(
      child: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Image.network('www.baidu.com'),
                Positioned(
                  child: Container(
                    child: Icon(Icons.golf_course_outlined),
                  ),
                )
              ],
            ),
          ),
          Text('金刚川'),
          Text('我是评分')
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<EntryItem> entryItems = [
      EntryItem(Icons.read_more, '找电影', DBColors.iconBlueValue, gotoFindMovie),
      EntryItem(
          Icons.insights, '豆瓣榜单', DBColors.iconYellowValue, gotoBillboard),
      EntryItem(Icons.update, '即将上映', DBColors.iconGreenValue, gotoReady),
      EntryItem(Icons.movie_filter, '豆瓣片单', DBColors.iconPurpleValue,
          gotoMovieSource),
    ];

    // 影院热映Tab
    // TODO: 这里的tab应该可以切换，做成statul组件合适
    Widget tabHead = Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
      child: Row(
        children: [
          GestureDetector(
            child: Text(
              '影院热映',
              style: DBTextStyle.bigDeepGreyBoldText,
            ),
          ),
          Container(
            width: 1,
            margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
            height: ScreenUtil().setWidth(40),
            color: DBColors.border3Value,
          ),
          GestureDetector(
            child: Text('豆瓣热门', style: DBTextStyle.bigGrey1Text),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '全部 25',
                style: DBTextStyle.smallerSub1Text,
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: DBColors.sub1TextValue,
                size: ScreenUtil().setWidth(26),
              )
            ],
          ))
        ],
      ),
    );

    Widget movieList = ListView(scrollDirection: Axis.horizontal, children: [
      _renderMovieItem(),
    ]);

    return Container(
      color: DBColors.writeValue,
      child: Column(
        children: [
          DBGaps.vGap40,
          EntryWidget(
            entryItems: entryItems,
          ),
          DBGaps.vGap80,
          MovieTabWidget(tabs: ['影院热映', '豆瓣热门'])
        ],
      ),
    );
  }
}
