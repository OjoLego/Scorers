import 'package:json_annotation/json_annotation.dart';

part 'incidents_model.g.dart';

@JsonSerializable()
class IncidentsModel {
  final bool success;
  final IncidentData data;

  IncidentsModel({required this.success, required this.data});

  factory IncidentsModel.fromJson(Map<String, dynamic> json) =>
      _$IncidentsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IncidentsResponseToJson(this);
}

@JsonSerializable()
class IncidentData {
  final List<Incident> incidents;
  final TeamColors home;
  final TeamColors away;

  IncidentData(
      {required this.incidents, required this.home, required this.away});

  factory IncidentData.fromJson(Map<String, dynamic> json) =>
      _$IncidentDataFromJson(json);

  Map<String, dynamic> toJson() => _$IncidentDataToJson(this);
}

@JsonSerializable()
class Incident {
  final String? text;
  final int? homeScore;
  final int? awayScore;
  final bool? isLive;
  final int? time;
  final int? addedTime;
  final int? timeSeconds;
  final int? reversedPeriodTime;
  final int? reversedPeriodTimeSeconds;
  final String? incidentType;
  final Player? player;
  final String? description;
  final String? reason;
  final bool? isHome;
  final int? sequence;
  final int? id;
  final String? incidentClass;
  final Player? playerIn;
  final Player? playerOut;

  Incident({
    this.text,
    this.homeScore,
    this.awayScore,
    this.isLive,
    this.time,
    this.addedTime,
    this.timeSeconds,
    this.reversedPeriodTime,
    this.reversedPeriodTimeSeconds,
    this.incidentType,
    this.player,
    this.description,
    this.reason,
    this.isHome,
    this.sequence,
    this.id,
    this.incidentClass,
    this.playerIn,
    this.playerOut,
  });

  factory Incident.fromJson(Map<String, dynamic> json) =>
      _$IncidentFromJson(json);

  Map<String, dynamic> toJson() => _$IncidentToJson(this);
}

@JsonSerializable()
class Player {
  final String name;
  final String slug;
  final String shortName;
  final String position;
  final String? jerseyNumber;
  final int? height;
  final int? userCount;
  final int id;
  final String marketValueCurrency;
  final int dateOfBirthTimestamp;
  final ProposedMarketValue? proposedMarketValueRaw;
  final FieldTranslations? fieldTranslations;

  Player({
    required this.name,
    required this.slug,
    required this.shortName,
    required this.position,
    this.jerseyNumber,
    this.height,
    this.userCount,
    required this.id,
    required this.marketValueCurrency,
    required this.dateOfBirthTimestamp,
    this.proposedMarketValueRaw,
    this.fieldTranslations,
  });

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}

@JsonSerializable()
class ProposedMarketValue {
  final int value;
  final String currency;

  ProposedMarketValue({required this.value, required this.currency});

  factory ProposedMarketValue.fromJson(Map<String, dynamic> json) =>
      _$ProposedMarketValueFromJson(json);

  Map<String, dynamic> toJson() => _$ProposedMarketValueToJson(this);
}

@JsonSerializable()
class FieldTranslations {
  final Map<String, String>? nameTranslation;
  final Map<String, String>? shortNameTranslation;

  FieldTranslations({this.nameTranslation, this.shortNameTranslation});

  factory FieldTranslations.fromJson(Map<String, dynamic> json) =>
      _$FieldTranslationsFromJson(json);

  Map<String, dynamic> toJson() => _$FieldTranslationsToJson(this);
}

@JsonSerializable()
class TeamColors {
  final PlayerColor goalkeeperColor;
  final PlayerColor playerColor;

  TeamColors({required this.goalkeeperColor, required this.playerColor});

  factory TeamColors.fromJson(Map<String, dynamic> json) =>
      _$TeamColorsFromJson(json);

  Map<String, dynamic> toJson() => _$TeamColorsToJson(this);
}

@JsonSerializable()
class PlayerColor {
  final String primary;
  final String number;
  final String outline;
  final String fancyNumber;

  PlayerColor({
    required this.primary,
    required this.number,
    required this.outline,
    required this.fancyNumber,
  });

  factory PlayerColor.fromJson(Map<String, dynamic> json) =>
      _$PlayerColorFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerColorToJson(this);
}
