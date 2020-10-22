// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendModel _$RecommendModelFromJson(Map<String, dynamic> json) {
  return RecommendModel(
    author: AuthorModel.fromJson(json['author'] as Map<String, dynamic>),
    topic: TopicModel.fromJson(json['topic'] as Map<String, dynamic>),
    images: (json['images'] as List).map((e) => e as String).toList(),
    content: json['content'] as String,
    title: json['title'] as String,
    likeNum: json['likeNum'] as String,
    commentNum: json['commentNum'] as String,
    transmitNum: json['transmitNum'] as String,
    isLiked: json['isLiked'] as bool,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$RecommendModelToJson(RecommendModel instance) =>
    <String, dynamic>{
      'author': instance.author,
      'topic': instance.topic,
      'images': instance.images,
      'content': instance.content,
      'title': instance.title,
      'likeNum': instance.likeNum,
      'commentNum': instance.commentNum,
      'transmitNum': instance.transmitNum,
      'isLiked': instance.isLiked,
      'type': instance.type,
    };
