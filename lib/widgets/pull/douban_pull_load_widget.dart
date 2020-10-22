import 'package:flutter/material.dart';

class DoubanPullLoad extends StatefulWidget {
  final bool isNeedHeader;
  final Widget headerView;
  final Function renderItem;
  final Function requestApi;
  final List dataList;
  final RefreshCallback onLoadMore;
  final RefreshCallback onRefresh;
  ValueNotifier<bool> needLoadMore;
  final Key refreshKey;

  DoubanPullLoad({
    this.isNeedHeader = false,
    this.dataList,
    this.headerView,
    this.renderItem,
    this.requestApi,
    this.onLoadMore,
    this.onRefresh,
    this.refreshKey,
    this.needLoadMore
  });
  @override
  _DoubanPullLoadState createState() => _DoubanPullLoadState();
}

class _DoubanPullLoadState extends State<DoubanPullLoad> {
  List items = List();
  bool isLoading = false;

  ScrollController _scrollController = ScrollController();

  @override
  initState() {
    super.initState();
    // _getMoreData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (widget.needLoadMore.value) {
          widget.onLoadMore?.call();
        }
      }
    });
  }

  @override
  dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _renderItem(int index) {
    if (!widget.isNeedHeader && index == widget.dataList.length && widget.dataList.length != 0) {
      return _buildProgressIndicator();
    } else if (widget.isNeedHeader &&
        index == _getListCount() - 1 &&
        widget.dataList.length != 0) {
      return _buildProgressIndicator();
    } else if (widget.isNeedHeader && index == 0 && widget.dataList.length != 0) {
      return widget.headerView;
    } else if (!widget.isNeedHeader && widget.dataList.length == 0) {
      // if (isLoading) {
      //   return _buildIdLoading();
      // } else {
        return _buildEmpty();
      // }
    } else {
      return widget.renderItem(
          index, widget.dataList[widget.isNeedHeader ? index - 1 : index]);
    }
  }

  num _getListCount() {
    if (widget.isNeedHeader) {
      return (widget.dataList.length > 0) ? widget.dataList.length + 2 : widget.dataList.length + 1;
    } else {
      if (widget.dataList.length == 0) {
        return 1;
      } else {
        return (widget.dataList.length > 0) ? widget.dataList.length + 1 : widget.dataList.length;
      }
    }
  }


  // TODO: 需要重新构造组件
  Widget _buildProgressIndicator() {
    if (widget.needLoadMore.value) {
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
          Text('没用相关数据'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: widget.refreshKey,
      child: ListView.builder(
          itemBuilder: (context, index) {
            return _renderItem(index);
          },
          itemCount: _getListCount()),
      onRefresh: widget.onRefresh,
    );
  }
}
