import 'package:flutter/material.dart';
import 'package:flutter_douban/common/style/style.dart';
import 'package:flutter_douban/widgets/douban_searchbar_widget.dart';

class SearchBar extends StatefulWidget {
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
    // TODO: 获取消息未读数量
  }

  _searchBoxRightTap() {
    // TODO: 扫码二维码被点击
  }

  _searchRightTap() {
    // TODO: 去消息中心
  }

  @override
  Widget build(BuildContext context) {
    return DoubanSearchBarWidget(
      searchBoxRight: GestureDetector(
        onTap: _searchBoxRightTap(),
        child: Icon(
          Icons.qr_code,
          size: 23,
          color: DBColors.textGreyValue,
        ),
      ),
      searchRight: GestureDetector(
        onTap: _searchRightTap(),
        child: Stack(
          children: <Widget>[
            Icon(
              Icons.mail_outline_rounded,
              size: 23,
              color: DBColors.writeValue,
            ),
            Positioned(
              right: -4,
              top: -5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(40),
                ),
                child:  Text('124', style: TextStyle(color: Colors.white, fontSize: 10),),
              ),
            )
          ],
        ),
      ),
      hintText: '童年最喜欢和小朋友玩的游戏',
    );
  }
}
