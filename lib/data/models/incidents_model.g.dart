// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incidents_model.dart';

IncidentsModel _$IncidentsResponseFromJson(Map<String, dynamic> json) =>
    IncidentsModel(
      success: json['success'] as bool,
      data: IncidentData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IncidentsResponseToJson(IncidentsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data.toJson(),
    };

IncidentData _$IncidentDataFromJson(Map<String, dynamic> json) => IncidentData(
      incidents: (json['incidents'] as List<dynamic>)
          .map((e) => Incident.fromJson(e as Map<String, dynamic>))
          .toList(),
      home: TeamColors.fromJson(json['home'] as Map<String, dynamic>),
      away: TeamColors.fromJson(json['away'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IncidentDataToJson(IncidentData instance) =>
    <String, dynamic>{
      'incidents': instance.incidents.map((e) => e.toJson()).toList(),
      'home': instance.home.toJson(),
      'away': instance.away.toJson(),
    };

Incident _$IncidentFromJson(Map<String, dynamic> json) => Incident(
      text: json['text'] as String?,
      homeScore: json['homeScore'] as int?,
      awayScore: json['awayScore'] as int?,
      isLive: json['isLive'] as bool?,
      time: json['time'] as int?,
      addedTime: json['addedTime'] as int?,
      timeSeconds: json['timeSeconds'] as int?,
      reversedPeriodTime: json['reversedPeriodTime'] as int?,
      reversedPeriodTimeSeconds: json['reversedPeriodTimeSeconds'] as int?,
      incidentType: json['incidentType'] as String?,
      player: json['player'] == null
          ? null
          : Player.fromJson(json['player'] as Map<String, dynamic>),
      description: json['description'] as String?,
      reason: json['reason'] as String?,
      isHome: json['isHome'] as bool?,
      sequence: json['sequence'] as int?,
      id: json['id'] as int?,
      incidentClass: json['incidentClass'] as String?,
      playerIn: json['playerIn'] == null
          ? null
          : Player.fromJson(json['playerIn'] as Map<String, dynamic>),
      playerOut: json['playerOut'] == null
          ? null
          : Player.fromJson(json['playerOut'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IncidentToJson(Incident instance) => <String, dynamic>{
      'text': instance.text,
      'homeScore': instance.homeScore,
      'awayScore': instance.awayScore,
      'isLive': instance.isLive,
      'time': instance.time,
      'addedTime': instance.addedTime,
      'timeSeconds': instance.timeSeconds,
      'reversedPeriodTime': instance.reversedPeriodTime,
      'reversedPeriodTimeSeconds': instance.reversedPeriodTimeSeconds,
      'incidentType': instance.incidentType,
      'player': instance.player?.toJson(),
      'description': instance.description,
      'reason': instance.reason,
      'isHome': instance.isHome,
      'sequence': instance.sequence,
      'id': instance.id,
      'incidentClass': instance.incidentClass,
      'playerIn': instance.playerIn?.toJson(),
      'playerOut': instance.playerOut?.toJson(),
    };

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      name: json['name'] as String,
      slug: json['slug'] as String,
      shortName: json['shortName'] as String,
      position: json['position'] as String,
      jerseyNumber: json['jerseyNumber'] as String?,
      height: json['height'] as int?,
      userCount: json['userCount'] as int?,
      id: json['id'] as int,
      marketValueCurrency: json['marketValueCurrency'] as String,
      dateOfBirthTimestamp: json['dateOfBirthTimestamp'] as int,
      proposedMarketValueRaw: json['proposedMarketValueRaw'] == null
          ? null
          : ProposedMarketValue.fromJson(
              json['proposedMarketValueRaw'] as Map<String, dynamic>),
      fieldTranslations: json['fieldTranslations'] == null
          ? null
          : FieldTranslations.fromJson(
              json['fieldTranslations'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'shortName': instance.shortName,
      'position': instance.position,
      'jerseyNumber': instance.jerseyNumber,
      'height': instance.height,
      'userCount': instance.userCount,
      'id': instance.id,
      'marketValueCurrency': instance.marketValueCurrency,
      'dateOfBirthTimestamp': instance.dateOfBirthTimestamp,
      'proposedMarketValueRaw': instance.proposedMarketValueRaw?.toJson(),
      'fieldTranslations': instance.fieldTranslations?.toJson(),
    };

ProposedMarketValue _$ProposedMarketValueFromJson(Map<String, dynamic> json) =>
    ProposedMarketValue(
      value: json['value'] as int,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$ProposedMarketValueToJson(
        ProposedMarketValue instance) =>
    <String, dynamic>{
      'value': instance.value,
      'currency': instance.currency,
    };

FieldTranslations _$FieldTranslationsFromJson(Map<String, dynamic> json) =>
    FieldTranslations(
      nameTranslation: (json['nameTranslation'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      shortNameTranslation:
          (json['shortNameTranslation'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$FieldTranslationsToJson(FieldTranslations instance) =>
    <String, dynamic>{
      'nameTranslation': instance.nameTranslation,
      'shortNameTranslation': instance.shortNameTranslation,
    };

TeamColors _$TeamColorsFromJson(Map<String, dynamic> json) => TeamColors(
      goalkeeperColor:
          PlayerColor.fromJson(json['goalkeeperColor'] as Map<String, dynamic>),
      playerColor:
          PlayerColor.fromJson(json['playerColor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeamColorsToJson(TeamColors instance) =>
    <String, dynamic>{
      'goalkeeperColor': instance.goalkeeperColor.toJson(),
      'playerColor': instance.playerColor.toJson(),
    };

PlayerColor _$PlayerColorFromJson(Map<String, dynamic> json) => PlayerColor(
      primary: json['primary'] as String,
      number: json['number'] as String,
      outline: json['outline'] as String,
      fancyNumber: json['fancyNumber'] as String,
    );

Map<String, dynamic> _$PlayerColorToJson(PlayerColor instance) =>
    <String, dynamic>{
      'primary': instance.primary,
      'number': instance.number,
      'outline': instance.outline,
      'fancyNumber': instance.fancyNumber,
    };
