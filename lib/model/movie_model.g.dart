// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) {
  return MovieModel(
    json['imageUrl'] as String,
    (json['score'] as num)?.toDouble(),
    json['name'] as String,
    json['id'] as num,
    json['wantToSee'] as bool,
  );
}

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'score': instance.score,
      'name': instance.name,
      'id': instance.id,
      'wantToSee': instance.wantToSee,
    };
