import 'package:flutter/material.dart';
import 'package:flutter_douban/common/style/style.dart';

class DoubanSearchBarWidget extends StatefulWidget {
  // 是否可以输入
  final bool searchAble;
  final double toolBarHeight;
  // placeholder
  final String hintText;
  final Widget searchBoxRight;
  final Widget searchRight;

  final Function searchTapClick;
  final Function searchBoxRightTapClick;
  final Function searchRightTapClick;

  const DoubanSearchBarWidget(
      {Key key,
      this.searchAble,
      this.toolBarHeight = 35.0,
      this.hintText,
      this.searchBoxRight,
      this.searchRight,
      this.searchTapClick,
      this.searchBoxRightTapClick,
      this.searchRightTapClick})
      : super(key: key);

  @override
  _DoubanSearchBarWidgetState createState() => _DoubanSearchBarWidgetState();
}

class _DoubanSearchBarWidgetState extends State<DoubanSearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    Widget searchBox = Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      margin: EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: DBColors.writeValue),
      child: Row(
        children: <Widget>[
          Icon(Icons.search, size: 23, color: DBColors.textGreyValue,),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 5, left: 5),
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  // icon: Icon(Icons.search, size: 23, color: DBColors.textGreyValue,),
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  hintStyle: DBTextStyle.smallGreyLightText,
                ),
              ),
            ),
          ),
          widget.searchBoxRight ?? Container()
        ],
      ),
    );
    if (widget.searchRight != null) {
      searchBox = Row(
        children: <Widget>[Expanded(child: searchBox), widget.searchRight],
      );
    }

    return Container(
      height: widget.toolBarHeight,
      child: searchBox,
    );
  }
}
