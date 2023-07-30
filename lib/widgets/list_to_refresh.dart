
import 'package:fitness/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListToRefresh extends StatefulWidget {

  final Function onRefresh;
  final Function onLoading;
  final bool onRefreshStatus;
  final bool onLoadingStatus;
  final Widget child;
  final bool backGround ;
  final int totalItems;
  final int listCount;

  const ListToRefresh({
    required this.onRefresh,
    required this.onLoading,
    this.onRefreshStatus = true,
    this.onLoadingStatus = true,
    required this.child,
    this.backGround = false,
    required this.totalItems,
    required this.listCount
  });

  @override
  State<ListToRefresh> createState() => _ListToRefreshState();
}

class _ListToRefreshState extends State<ListToRefresh> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await widget.onRefresh();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await widget.onLoading();

    if(widget.listCount >= widget.totalItems) {
      _refreshController.loadNoData();
    }else {
      _refreshController.loadComplete();
    }
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return RefreshConfiguration(
      dragSpeedRatio: 0.91,
      enableLoadingWhenNoData: false,
      enableRefreshVibrate: false,
      enableLoadMoreVibrate: false,

      child: Container(
          width: width,
          height: height ,
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),

          decoration: widget.backGround == true ? BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10),
          ) : BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SmartRefresher(
            enablePullDown: widget.onRefreshStatus,
            enablePullUp: widget.onLoadingStatus,
            header: const WaterDropMaterialHeader(
              backgroundColor: MainColors.primaryColor,
            ),
            footer: CustomFooter(
              builder: (BuildContext context, LoadStatus? mode) {
                debugPrint(mode.toString());
                Widget body ;
                if(mode == LoadStatus.idle) {
                  body =  const Text("pull up load");
                }
                else if(mode == LoadStatus.loading) {
                  body =  const CircularProgressIndicator(color: MainColors.primaryColor,);
                }
                else if(mode == LoadStatus.failed) {
                  body = const Text("Load Failed! Click retry!");
                }
                else if(mode == LoadStatus.canLoading) {
                  body = const Text("release to load more");
                }
                else {
                  body = const Text("No more Data");
                }
                return SizedBox(
                  height: 55.0,
                  child: Center(child:body),
                );
              },
            ),
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: widget.child,
          )
      ),
    );
  }
}