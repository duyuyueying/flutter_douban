import 'package:flutter/material.dart';
import 'package:flutter_douban/common/style/style.dart';
import 'package:flutter_douban/model/movie_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieWidget extends StatefulWidget {
  final MovieModel item;
  final EdgeInsets marginRight;

  const MovieWidget(
      {Key key,
      this.item,
      this.marginRight = const EdgeInsets.only(right: 10.0)})
      : super(key: key);

  @override
  _MovieWidgetState createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget> {
  // 想看
  bool wantToSee = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.marginRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Stack(
              children: [
                Image.network(
                  widget.item.imageUrl,
                  width: ScreenUtil().setWidth(200),
                  height: ScreenUtil().setWidth(280),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  child: Container(
                    child: Icon(Icons.golf_course_outlined),
                  ),
                )
              ],
            ),
          ),
          Text(
            widget.item.name,
            style: DBTextStyle.smallerDeepGreyText
                .copyWith(height: 2.2, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.item.score.toString(),
            style: DBTextStyle.minGrey1Text,
          )
        ],
      ),
    );
  }
}
