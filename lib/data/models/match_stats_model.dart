import 'package:json_annotation/json_annotation.dart';

part 'match_stats_model.g.dart';

@JsonSerializable()
class MatchStatsModel {
  final bool success;
  final MatchData data;

  MatchStatsModel({required this.success, required this.data});

  factory MatchStatsModel.fromJson(Map<String, dynamic> json) =>
      _$MatchStatsModelFromJson(json);
  Map<String, dynamic> toJson() => _$MatchStatsModelToJson(this);
}

@JsonSerializable()
class MatchData {
  final List<Statistics> statistics;

  MatchData({required this.statistics});

  factory MatchData.fromJson(Map<String, dynamic> json) =>
      _$MatchDataFromJson(json);
  Map<String, dynamic> toJson() => _$MatchDataToJson(this);
}

@JsonSerializable()
class Statistics {
  final String period;
  final List<Group> groups;

  Statistics({required this.period, required this.groups});

  factory Statistics.fromJson(Map<String, dynamic> json) =>
      _$StatisticsFromJson(json);
  Map<String, dynamic> toJson() => _$StatisticsToJson(this);
}

@JsonSerializable()
class Group {
  final String groupName;
  final List<StatisticsItem> statisticsItems;

  Group({required this.groupName, required this.statisticsItems});

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
  Map<String, dynamic> toJson() => _$GroupToJson(this);
}

@JsonSerializable()
class StatisticsItem {
  final String name;
  final String home;
  final String away;
  final int compareCode;
  final String statisticsType;
  final String valueType;
  final dynamic homeValue;
  final dynamic awayValue;
  final int renderType;
  final String key;
  final dynamic homeTotal;
  final dynamic awayTotal;

  StatisticsItem({
    required this.name,
    required this.home,
    required this.away,
    required this.compareCode,
    required this.statisticsType,
    required this.valueType,
    required this.homeValue,
    required this.awayValue,
    required this.renderType,
    required this.key,
    this.homeTotal,
    this.awayTotal,
  });

  factory StatisticsItem.fromJson(Map<String, dynamic> json) =>
      _$StatisticsItemFromJson(json);
  Map<String, dynamic> toJson() => _$StatisticsItemToJson(this);
}
