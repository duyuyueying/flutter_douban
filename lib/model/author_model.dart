
import 'package:json_annotation/json_annotation.dart';

part 'author_model.g.dart';

@JsonSerializable()
class AuthorModel{
  final String avatar;
  final String name;
  final num id;
  final String type;

  AuthorModel({this.avatar, this.name, this.id, this.type});

  factory AuthorModel.fromJson(Map<String, dynamic> json) => _$AuthorModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorModelToJson(this);
}