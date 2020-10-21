import 'package:flutter/material.dart';

class DoubanPullLoad extends StatefulWidget {
  final bool isNeedHeader;
  final Widget headerView;
  final Function renderItem;
  final Function requestApi;

  const DoubanPullLoad(
      {Key key,
      this.isNeedHeader = false,
      this.headerView,
      this.renderItem,
      this.requestApi})
      : super(key: key);
  @override
  _DoubanPullLoadState createState() => _DoubanPullLoadState();
}

class _DoubanPullLoadState extends State<DoubanPullLoad> {
  List items = List();
  bool isLoading = false;
  bool _hasMore = true;
  int _pageIndex = 0;
  int _pageSize = 15;

  ScrollController _scrollController = ScrollController();

  @override
  initState() {
    super.initState();
    _getMoreData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (_hasMore) {
          _getMoreData();
        }
      }
    });
  }

  @override
  dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  // TODO: 需要解构
  Future _getMoreData() async {
    if (!isLoading && _hasMore) {
      if (mounted) {
        setState(() {
          isLoading = true;
        });
      }
      List list = await httpGetListData(isRefresh: false);
      this.setState(() {
        items.addAll(list);
        isLoading = false;
        _hasMore = items.length >= _pageIndex * _pageSize;
        _pageIndex = _pageIndex + 1;
      });
    }
  }

  // TODO: 这个方法放在这里并不合理，每个项目的接口结构不一样的话都需要修改这里，不合理，望修改
  Future<List> httpGetListData({bool isRefresh = false}) async {
    if (widget.requestApi != null) {
      Map list = Map<String, dynamic>();
      list = await widget.requestApi(
          {'pageIndex': isRefresh ? 1 : _pageIndex, 'isRefresh': isRefresh});
      // return list;
      return [1,2,3,4,5,6,7,8,9];
    }
    return Future.delayed(Duration(seconds: 2), () {
      return [1,2,3,4,5,6,7,8,9];
    });
  }

  Widget _renderItem(int index) {
    if (!widget.isNeedHeader && index == items.length && items.length != 0) {
      return _buildProgressIndicator();
    } else if (widget.isNeedHeader &&
        index == _getListCount() - 1 &&
        items.length != 0) {
      return _buildProgressIndicator();
    } else if (widget.isNeedHeader && index == 0 && items.length != 0) {
      return widget.headerView;
    } else if (!widget.isNeedHeader && items.length == 0) {
      if (isLoading) {
        return _buildIdLoading();
      } else {
        return _buildEmpty();
      }
    } else {
      return widget.renderItem(
          index, items[widget.isNeedHeader ? index - 1 : index]);
    }
  }

  num _getListCount() {
    if (widget.isNeedHeader) {
      return (items.length > 0) ? items.length + 2 : items.length + 1;
    } else {
      if (items.length == 0) {
        return 1;
      } else {
        return (items.length > 0) ? items.length + 1 : items.length;
      }
    }
  }

  Future<Null> _handleRefresh() async {
    List list = await httpGetListData(isRefresh: true);
    this.setState(() {
      items.clear();
      items.addAll(list);
      isLoading = false;
      _hasMore = items.length >= _pageIndex * _pageSize;
      _pageIndex = _pageIndex + 1;
    });
  }

  // TODO: 需要重新构造组件
  Widget _buildProgressIndicator() {
    if (_hasMore) {
      return Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                child: Text(
                  '正在加载..',
                  style: TextStyle(color: Colors.black54, fontSize: 15.0),
                ),
                padding: EdgeInsets.only(left: 10.0),
              )
            ],
          ),
        ),
      );
    }
    return Container(
      child: Center(
        child: Text(
          '没有更多数据',
          style: TextStyle(color: Colors.black54, fontSize: 15.0),
        ),
      ),
    );
  }

  // TODO: 需要重新构造组件
  Widget _buildIdLoading() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .85,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              child: Text(
                '正在加载..',
                style: TextStyle(color: Colors.black54, fontSize: 15.0),
              ),
              padding: EdgeInsets.only(left: 10.0),
            )
          ],
        ),
      ),
    );
  }

  // TODO: 需要重新构造组件
  Widget _buildEmpty() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('页面出错了！！'),
          RaisedButton(
            child: Text('重新加载'),
            onPressed: () {
              if (this.mounted) {
                this.setState(() {
                  items.clear();
                  isLoading = false;
                  _hasMore = true;
                  _pageIndex = 1;
                });
                _getMoreData();
              }
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView.builder(
          itemBuilder: (context, index) {
            return _renderItem(index);
          },
          itemCount: _getListCount()),
      onRefresh: _handleRefresh,
    );
  }
}
