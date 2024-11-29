// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_player_model.dart';

BestPlayerModel _$BestPlayerModelFromJson(Map<String, dynamic> json) {
  return BestPlayerModel(
    success: json['success'] as bool,
    data: BestPlayerData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BestPlayerModelToJson(BestPlayerModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data.toJson(),
    };

BestPlayerData _$BestPlayerDataFromJson(Map<String, dynamic> json) {
  return BestPlayerData(
    bestHomeTeamPlayer: BestTeamPlayer.fromJson(
        json['bestHomeTeamPlayer'] as Map<String, dynamic>),
    bestAwayTeamPlayer: BestTeamPlayer.fromJson(
        json['bestAwayTeamPlayer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BestPlayerDataToJson(BestPlayerData instance) =>
    <String, dynamic>{
      'bestHomeTeamPlayer': instance.bestHomeTeamPlayer.toJson(),
      'bestAwayTeamPlayer': instance.bestAwayTeamPlayer.toJson(),
    };

BestTeamPlayer _$BestTeamPlayerFromJson(Map<String, dynamic> json) {
  return BestTeamPlayer(
    value: json['value'] as String,
    label: json['label'] as String,
    player: Player.fromJson(json['player'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BestTeamPlayerToJson(BestTeamPlayer instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
      'player': instance.player.toJson(),
    };

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return Player(
    name: json['name'] as String,
    shortName: json['shortName'] as String,
  );
}

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'name': instance.name,
      'shortName': instance.shortName,
    };
