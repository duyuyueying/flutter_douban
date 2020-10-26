import 'package:flutter/material.dart';
import 'package:flutter_douban/common/style/style.dart';
import 'package:flutter_douban/mock/movie_mock.dart';
import 'package:flutter_douban/model/data_result.dart';
import 'package:flutter_douban/model/movie_model.dart';
import 'package:flutter_douban/pages/works/widgets/movie_page.dart';
import 'package:flutter_douban/pages/works/widgets/movie_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieTabWidget extends StatefulWidget {
  final List<String> tabs;

  const MovieTabWidget({Key key, this.tabs}) : super(key: key);

  @override
  _MovieTabWidgetState createState() => _MovieTabWidgetState();
}

class _MovieTabWidgetState extends State<MovieTabWidget> {
  int currIndex = 0;
  int count;
  List<MovieModel> dataList = List<MovieModel>();

  @override
  initState() {
    super.initState();
    this.getList();
  }

  getList() {
    DataResult res = DataResult.fromJson(MovieMock.response);
    if (res.code == 0) {
      this.setState(() {
        count = res.data['count'];
        List<MovieModel> list = List<MovieModel>();
        print(res.data['list'].toList());
        if (res.data['list'].length != 0) {
          for (int i = 0; i < res.data['list'].length; i++) {
            list.add(MovieModel.fromJson(res.data['list'][i]));
          }
          dataList = list;
        }
      });
    }
  }

  List<Widget> _renderTabHead() {
    List<Widget> tabHead = List<Widget>();
    if (widget.tabs != null) {
      for (int i = 0, len = widget.tabs.length; i < len; i++) {
        if (i != 0) {
          tabHead.add(
            Container(
              width: 1,
              margin:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
              height: ScreenUtil().setWidth(40),
              color: DBColors.border3Value,
            ),
          );
        }
        tabHead.add(GestureDetector(
          onTap: () {
            setState(() {
              currIndex = i;
              count = i == 0 ? 29 : 322;
            });
          },
          child: Text(
            widget.tabs[i],
            style: currIndex != i
                ? DBTextStyle.bigGrey1Text
                : DBTextStyle.bigDeepGreyBoldText,
          ),
        ));
      }
    }

    tabHead.add(
      Expanded(
        child: GestureDetector(
          onTap: () {
            // TODO: 去哪儿？
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '全部 $count',
                style: DBTextStyle.smallerSub1Text,
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: DBColors.sub1TextValue,
                size: ScreenUtil().setWidth(26),
              )
            ],
          ),
        ),
      ),
    );
    return tabHead;
  }

  @override
  Widget build(BuildContext context) {
    Widget tabHead = Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
      child: Row(
        children: _renderTabHead(),
      ),
    );

    List<MovieWidget> movies = List<MovieWidget>();
    for (int i = 0, len = dataList.length; i < len; i++) {
      movies.add(
        MovieWidget(
          item: dataList[i],
          marginRight: EdgeInsets.only(
            right: i == len - 1 ? 0 : ScreenUtil().setWidth(20),
          ),
        ),
      );
    }

    Widget movieList =
        ListView(scrollDirection: Axis.horizontal, children: movies);

    // TODO: 这里的高可以不设置么，让他自适应，思考下如何布局...
    return Container(
      height: ScreenUtil().setWidth(470),
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
      child: Column(
        mainAxisSize: MainAxisSize.min
        ,
        children: [tabHead, DBGaps.vGap40, Expanded(child: movieList)],
      ),
    );
  }
}
