import 'package:flutter/material.dart';
import 'package:flutter_douban/model/author_model.dart';
import 'package:flutter_douban/model/recommendModel.dart';
import 'package:flutter_douban/model/topic_model.dart';

class ListItem extends StatelessWidget {
  RecommendModel item;
  AvatarDisplay displayType;
  ListItem({this.item, this.displayType = AvatarDisplay.row});

  // 作者信息
  Widget _renderAvatar(AuthorModel user) {
    Widget avatarContent;
    if (displayType == AvatarDisplay.row) {
      avatarContent = Row(
        children: <Widget>[
          Text(user.name),
          GestureDetector(
            child: Icon(Icons.more_horiz),
          ),
        ],
      );
    } else {
      avatarContent = Column(
        children: <Widget>[
          Text(user.name),
          Row(
            children: <Widget>[
              Expanded(child: Text('当前动态的类型')),
              Text('昨天22:30'),
              GestureDetector(
                child: Icon(Icons.more_horiz),
              ),
            ],
          ),
        ],
      );
    }
    return Row(
      children: <Widget>[
        Container(
          child: Image.network(user.avatar),
        ),
        Expanded(
          child: avatarContent,
        ),
      ],
    );
  }

  // 作者内容
  Widget _renderContent() {}

  // 话题
  Widget _renderTopic(TopicModel topic) {}

  // 图片集
  Widget _renderImages() {}

  // 底部操作栏目
  Widget _renderOperationBottom() {}

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = List<Widget>();
    widgets.add(_renderAvatar(item.author));
    if (item.topic != null) {
      widgets.add(_renderTopic(item.topic));
    }
    widgets.add(_renderContent());
    if (item.images?.length != 0) {
      widgets.add(_renderImages());
    }

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
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
