import 'package:flutter/material.dart';
import 'package:flutter_douban/common/style/style.dart';
import 'package:flutter_douban/model/author_model.dart';
import 'package:flutter_douban/model/recommendModel.dart';
import 'package:flutter_douban/model/topic_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

// TODO: 这个listitem还有很多细节要扣，现在不想扣了，去做别的了，以后再回来扣，特别是图片部分。

class ListItem extends StatelessWidget {
  RecommendModel item;
  AvatarDisplay displayType;
  ListItem({this.item, this.displayType = AvatarDisplay.row});

  // 作者信息
  Widget _renderAvatar(AuthorModel user) {
    Widget avatarContent;
    if (displayType == AvatarDisplay.row) {
      avatarContent = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            user.name,
            style: DBTextStyle.smallDeepGreyText,
          ),
          GestureDetector(
            child: Icon(
              Icons.more_horiz,
              color: DBColors.textGreyLightValue,
              size: 22,
            ),
          ),
        ],
      );
    } else {
      avatarContent = Column(
        children: <Widget>[
          Text(
            user.name,
            style: DBTextStyle.smallDeepGreyText,
          ),
          Row(
            children: <Widget>[
              Expanded(child: Text('当前动态的类型')),
              Text('昨天22:30'),
              GestureDetector(
                child: Icon(
                  Icons.more_horiz,
                  color: DBColors.textGreyLightValue,
                  size: 22,
                ),
              ),
            ],
          ),
        ],
      );
    }
    return Row(
      children: <Widget>[
        Container(
          width: ScreenUtil().setWidth(60),
          height: ScreenUtil().setWidth(60),
          margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
          child: Image.network(user.avatar),
        ),
        Expanded(
          child: avatarContent,
        ),
      ],
    );
  }

  // 内容
  Widget _renderContent() {
    List<InlineSpan> textSpans = List<InlineSpan>();
    if (item.title != null && item.title.isNotEmpty) {
      textSpans
          .add(TextSpan(text: item.title, style: DBTextStyle.middleBoldText));
    }
    textSpans.add(TextSpan(text: item.content));
    return Container(
      child: GestureDetector(
        child: RichText(
          text: TextSpan(
              children: textSpans,
              style: DBTextStyle.middleSubText.copyWith(height: 1.5)),
        ),
      ),
    );
  }

  // 话题
  Widget _renderTopic(TopicModel topic) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: ScreenUtil().setWidth(10),
          horizontal: ScreenUtil().setWidth(20)),
      decoration: BoxDecoration(
        color: DBColors.tagBgValue,
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(48)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.topic,
            size: 20,
            color: DBColors.textPrimaryValue.withOpacity(.8),
          ),
          DBGaps.hGap10,
          Text(
            topic.name,
            style: DBTextStyle.smallerPrimayText,
          ),
        ],
      ),
    );
  }

  // 图片集
  Widget _renderImages(BuildContext context) {
    if (item.images.length == 1) {
      // Image image = Image.network(item.images[0]);
      // image.image.resolve(ImageConfiguration()).addListener(
      //   ImageStreamListener((ImageInfo info, bool _) {
      //     if (info.image.width >= info.image.height) {
      //       double size = ((MediaQuery.of(context).size.width -
      //                       ScreenUtil().setWidth(100)) /
      //                   3) *
      //               2 +
      //           ScreenUtil().setWidth(10);
      //       // singleWidth = size;
      //     } else {
      //       double size = ((MediaQuery.of(context).size.width -
      //               ScreenUtil().setWidth(90)) /
      //           2);
      //       // singleWidth = size;
      //     }
      //   }),
      // );
       double size = ((MediaQuery.of(context).size.width -
                            ScreenUtil().setWidth(100)) /
                        3) *
                    2 +
                ScreenUtil().setWidth(10);
      return Container(
            width: size,
            // height: size,
            child: Image.network(
              item.images[0],
              width: size,
              // height: size,
            ),
          );
    }
    List<Widget> images = List<Widget>();
    double size =
        (MediaQuery.of(context).size.width - ScreenUtil().setWidth(100)) / 3;
    if (item.images.length == 4) {
      for (int i = 0, len = item.images.length; i < len; i++) {
        if (i == 2) {
          images.add(Container(
            width: size,
            height: size,
          ));
        }
        images.add(
          Container(
            width: size,
            height: size,
            child: Image.network(
              item.images[i],
              width: size,
              height: size,
            ),
          ),
        );
      }
    } else {
      for (int i = 0, len = item.images.length; i < len; i++) {
        images.add(
          Container(
            width: size,
            height: size,
            child: Image.network(
              item.images[i],
              width: size,
              height: size,
            ),
          ),
        );
      }
    }

    return Wrap(
      spacing: ScreenUtil().setWidth(10),
      runSpacing: ScreenUtil().setWidth(10),
      children: images,
    );
  }

  Widget _renderBottomItem(IconData icon, String number) {
    return Flexible(
      child: GestureDetector(
        onTap: () {
          showToast('点击...$number');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              icon,
              size: 25,
              color: DBColors.textGreyValue,
            ),
            Text(
              number,
              style: DBTextStyle.minGreyText,
            ),
          ],
        ),
      ),
    );
  }

  // 底部操作栏目
  Widget _renderOperationBottom() {
    return Container(
      height: ScreenUtil().setWidth(70),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _renderBottomItem(Icons.clean_hands, item.likeNum),
          _renderBottomItem(Icons.message, item.commentNum),
          _renderBottomItem(Icons.share, item.transmitNum),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = List<Widget>();
    widgets.add(_renderAvatar(item.author));
    widgets.add(DBGaps.vGap20);
    // widgets.add(DBGaps.vGap20);
    if (item.topic != null) {
      widgets.add(_renderTopic(item.topic));
      widgets.add(DBGaps.vGap20);
    }
    widgets.add(_renderContent());
    if (item.images?.length != 0) {
      widgets.add(DBGaps.vGap20);
      widgets.add(_renderImages(context));
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(40)),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              bottom: ScreenUtil().setWidth(25),
              right: ScreenUtil().setWidth(40),
              left: ScreenUtil().setWidth(40),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widgets,
            ),
          ),
          _renderOperationBottom()
        ],
      ),
    );
  }
}

enum AvatarDisplay { row, column }
