import 'package:json_annotation/json_annotation.dart';

part 'best_player_model.g.dart';

@JsonSerializable()
class BestPlayerModel {
  final bool success;
  final BestPlayerData data;

  BestPlayerModel({required this.success, required this.data});

  factory BestPlayerModel.fromJson(Map<String, dynamic> json) =>
      _$BestPlayerModelFromJson(json);

  Map<String, dynamic> toJson() => _$BestPlayerModelToJson(this);
}

@JsonSerializable()
class BestPlayerData {
  final BestTeamPlayer bestHomeTeamPlayer;
  final BestTeamPlayer bestAwayTeamPlayer;

  BestPlayerData(
      {required this.bestHomeTeamPlayer, required this.bestAwayTeamPlayer});

  factory BestPlayerData.fromJson(Map<String, dynamic> json) =>
      _$BestPlayerDataFromJson(json);

  Map<String, dynamic> toJson() => _$BestPlayerDataToJson(this);
}

@JsonSerializable()
class BestTeamPlayer {
  final String value;
  final String label;
  final Player player;

  BestTeamPlayer(
      {required this.value, required this.label, required this.player});

  factory BestTeamPlayer.fromJson(Map<String, dynamic> json) =>
      _$BestTeamPlayerFromJson(json);

  Map<String, dynamic> toJson() => _$BestTeamPlayerToJson(this);
}

@JsonSerializable()
class Player {
  final String name;
  final String shortName;

  Player({required this.name, required this.shortName});

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
