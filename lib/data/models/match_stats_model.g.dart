// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchStatsModel _$MatchStatsModelFromJson(Map<String, dynamic> json) =>
    MatchStatsModel(
      success: json['success'] as bool,
      data: MatchData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MatchStatsModelToJson(MatchStatsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data.toJson(),
    };

MatchData _$MatchDataFromJson(Map<String, dynamic> json) => MatchData(
      statistics: (json['statistics'] as List<dynamic>)
          .map((e) => Statistics.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MatchDataToJson(MatchData instance) => <String, dynamic>{
      'statistics': instance.statistics.map((e) => e.toJson()).toList(),
    };

Statistics _$StatisticsFromJson(Map<String, dynamic> json) => Statistics(
      period: json['period'] as String,
      groups: (json['groups'] as List<dynamic>)
          .map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StatisticsToJson(Statistics instance) =>
    <String, dynamic>{
      'period': instance.period,
      'groups': instance.groups.map((e) => e.toJson()).toList(),
    };

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      groupName: json['groupName'] as String,
      statisticsItems: (json['statisticsItems'] as List<dynamic>)
          .map((e) => StatisticsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'groupName': instance.groupName,
      'statisticsItems':
          instance.statisticsItems.map((e) => e.toJson()).toList(),
    };

StatisticsItem _$StatisticsItemFromJson(Map<String, dynamic> json) =>
    StatisticsItem(
      name: json['name'] as String,
      home: json['home'] as String,
      away: json['away'] as String,
      compareCode: json['compareCode'] as int,
      statisticsType: json['statisticsType'] as String,
      valueType: json['valueType'] as String,
      homeValue: json['homeValue'],
      awayValue: json['awayValue'],
      renderType: json['renderType'] as int,
      key: json['key'] as String,
      homeTotal: json['homeTotal'],
      awayTotal: json['awayTotal'],
    );

Map<String, dynamic> _$StatisticsItemToJson(StatisticsItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'home': instance.home,
      'away': instance.away,
      'compareCode': instance.compareCode,
      'statisticsType': instance.statisticsType,
      'valueType': instance.valueType,
      'homeValue': instance.homeValue,
      'awayValue': instance.awayValue,
      'renderType': instance.renderType,
      'key': instance.key,
      'homeTotal': instance.homeTotal,
      'awayTotal': instance.awayTotal,
    };
