// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'momentum_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MomentumModel _$MomentumModelFromJson(Map<String, dynamic> json) =>
    MomentumModel(
      success: json['success'] as bool,
      data: MomentumData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MomentumModelToJson(MomentumModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

MomentumData _$MomentumDataFromJson(Map<String, dynamic> json) => MomentumData(
      graphPoints: (json['graphPoints'] as List<dynamic>)
          .map((e) => GraphPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      periodTime: json['periodTime'] as int,
      periodCount: json['periodCount'] as int,
    );

Map<String, dynamic> _$MomentumDataToJson(MomentumData instance) =>
    <String, dynamic>{
      'graphPoints': instance.graphPoints,
      'periodTime': instance.periodTime,
      'periodCount': instance.periodCount,
    };

GraphPoint _$GraphPointFromJson(Map<String, dynamic> json) => GraphPoint(
      minute: (json['minute'] as num).toDouble(),
      value: json['value'] as int,
    );

Map<String, dynamic> _$GraphPointToJson(GraphPoint instance) =>
    <String, dynamic>{
      'minute': instance.minute,
      'value': instance.value,
    };
