// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorModel _$AuthorModelFromJson(Map<String, dynamic> json) {
  return AuthorModel(
    avatar: json['avatar'] as String,
    name: json['name'] as String,
    id: json['id'] as num,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$AuthorModelToJson(AuthorModel instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'name': instance.name,
      'id': instance.id,
      'type': instance.type,
    };
