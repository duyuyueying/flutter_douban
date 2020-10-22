import 'package:flutter/material.dart';

mixin DoubanListState<T extends StatefulWidget> on State<T>, AutomaticKeepAliveClientMixin<T>{
  bool isLoading = false;
  int page = 1;
  bool isRefreshing = false;
  bool isLoadMoring = false;
  static const PAGE_SIZE = 15;
  ValueNotifier<bool> needLoadMore =  new ValueNotifier(false);
  final List dataList = List();

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  _lockToAwait() async{
    doDelayed() async{
      await Future.delayed(Duration(seconds: 1)).then((_) async{
        if(isLoading) {
          return await doDelayed();
        } else {
          return null;
        }
      });
    }
    await doDelayed();
  }

  showRefreshLoading() {
    Future.delayed(Duration(seconds: 0), () {
      refreshIndicatorKey.currentState.show().then((e){});
      return true;
    });
  }
  
  @protected
  resolveRefreshResult(res){
    if(res != null && res.data != null) {
      setState(() {
        dataList.clear();
        dataList.addAll(res.data);
      });
    }
  }

  

  @protected
  Future<Null> handleRefresh() async{
    if(isLoading){
      if(isRefreshing){
        return null;
      }
      await _lockToAwait();
    }
    isLoading = true;
    isRefreshing = true;
    page = 1;
    var res = await requestRefresh();
    print("handleRefres$dataList");
    resolveRefreshResult(res);
    resolveDataResult(res);
    isLoading = false;
    isRefreshing = false;
    return null;
  }

  @protected
  Future<Null> onLoadMore() async{
    if(isLoading){
      if(isLoadMoring){
        return null;
      }
      await _lockToAwait();
    }
    isLoading = true;
    isLoadMoring = true;
    page++;
    var res = await requestLoadMore();
    if(res != null && res.result) {
      setState(() {
        dataList.addAll(res.data);
      });
    }
    resolveDataResult(res);
    isLoading = false;
    isLoadMoring = false;
    return null;
  }

  

  @protected
  resolveDataResult(res){
    needLoadMore.value = (res != null &&
            res.data != null &&
            res.data.length >= PAGE_SIZE);
  }

  @protected
  clearData() {
    setState(() {
      dataList.clear();
    });
  }

  // 下拉刷新数据
  @protected
  requestRefresh() async {}

  // 上拉更多请求数据
  @protected
  requestLoadMore() async{}

  @protected
  bool get isRefreshFirst;

  // 是否需要头部
  @protected
  bool get needHeader => false;

  ///是否需要保持
  @override
  bool get wantKeepAlive => true;

  List get getDataList => dataList;

  @override
  void initState() {
    super.initState();
    if(getDataList.length == 0 && isRefreshFirst){
      showRefreshLoading();
    }
  }

  @override
  void dispose() {
    super.dispose();
    isLoading = false;
  }

}