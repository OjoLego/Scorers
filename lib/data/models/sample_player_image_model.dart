import 'package:json_annotation/json_annotation.dart';

part 'sample_player_image_model.g.dart';

@JsonSerializable()
class SamplePlayerImageModel {
  final bool success;
  final String data;

  SamplePlayerImageModel({
    required this.success,
    required this.data,
  });

  factory SamplePlayerImageModel.fromJson(Map<String, dynamic> json) =>
      _$SamplePlayerImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$SamplePlayerImageModelToJson(this);
}
