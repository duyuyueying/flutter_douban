import 'package:flutter/material.dart';
import 'package:flutter_douban/common/style/style.dart';
import 'package:flutter_douban/widgets/douban_searchbar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

class SearchBar extends StatefulWidget {
  final Color backgroundColor;
  final String hintText;

  const SearchBar({Key key, this.backgroundColor = DBColors.writeValue, this.hintText = ''}) : super(key: key);
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  int unReadCount = 0;
  @override
  void initState() {
    super.initState();
    this.getUnRead();
  }

  getUnRead() {
    // showToast('获取消息未读数量');
    // TODO: 获取消息未读数量
  }

  _searchBoxRightTap() {
    showToast('扫码二维码被点击');
    // TODO: 扫码二维码被点击
  }

  _searchRightTap() {
    showToast('去消息中心');
    // TODO: 去消息中心
  }

  _searchTap() {
    showToast('去搜索页面');
    // TODO: 去搜索页面
  }

  @override
  Widget build(BuildContext context) {
    return DoubanSearchBarWidget(
      searchAble: false,
      backgroundColor: widget.backgroundColor,
      toolBarHeight: ScreenUtil().setWidth(70),
      searchBoxRight: GestureDetector(
        onTap: _searchBoxRightTap,
        child: Icon(
          Icons.qr_code,
          size: 23,
          color: DBColors.textGreyValue,
        ),
      ),
      searchRight: GestureDetector(
        onTap: _searchRightTap,
        child: Container(
          width: ScreenUtil().setWidth(100),
          height: ScreenUtil().setWidth(70),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Icon(
                Icons.mail_outline_rounded,
                size: 23,
                color: widget.backgroundColor != DBColors.writeValue ?  DBColors.textGreyValue : DBColors.writeValue,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    '12',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      hintText: widget.hintText,
      searchTapClick: _searchTap
    );
  }
}
