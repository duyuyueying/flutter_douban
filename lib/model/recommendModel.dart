import 'package:flutter_douban/model/author_model.dart';
import 'package:flutter_douban/model/topic_model.dart';
import 'package:json_annotation/json_annotation.dart';

part "recommendModel.g.dart";

@JsonSerializable(nullable: false)
class RecommendModel{
  final AuthorModel author;
  final TopicModel topic;
  final List<String> images;
  final String content;
  final String title;
  final String likeNum;
  final String commentNum;
  final String transmitNum;
  final bool isLiked;
  final String type;

  RecommendModel({this.author, this.topic, this.images, this.content, this.title, this.likeNum, this.commentNum, this.transmitNum, this.isLiked, this.type});

  factory RecommendModel.fromJson(Map<String, dynamic> json) => _$RecommendModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendModelToJson(this);
}