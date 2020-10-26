
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel{
  final String imageUrl;
  final double score;
  final String name;
  final num id;
  final bool wantToSee;

  MovieModel(this.imageUrl, this.score, this.name, this.id, this.wantToSee);

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}