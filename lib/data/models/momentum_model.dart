import 'package:json_annotation/json_annotation.dart';

part 'momentum_model.g.dart';

@JsonSerializable()
class MomentumModel {
  final bool success;
  final MomentumData data;

  MomentumModel({
    required this.success,
    required this.data,
  });

  factory MomentumModel.fromJson(Map<String, dynamic> json) =>
      _$MomentumModelFromJson(json);
  Map<String, dynamic> toJson() => _$MomentumModelToJson(this);
}

@JsonSerializable()
class MomentumData {
  final List<GraphPoint> graphPoints;
  final int periodTime;
  final int periodCount;

  MomentumData({
    required this.graphPoints,
    required this.periodTime,
    required this.periodCount,
  });

  factory MomentumData.fromJson(Map<String, dynamic> json) =>
      _$MomentumDataFromJson(json);
  Map<String, dynamic> toJson() => _$MomentumDataToJson(this);
}

@JsonSerializable()
class GraphPoint {
  final double minute;
  final int value;

  GraphPoint({
    required this.minute,
    required this.value,
  });

  factory GraphPoint.fromJson(Map<String, dynamic> json) =>
      _$GraphPointFromJson(json);
  Map<String, dynamic> toJson() => _$GraphPointToJson(this);
}
