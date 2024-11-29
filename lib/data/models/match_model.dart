import 'package:json_annotation/json_annotation.dart';

part 'match_model.g.dart';

@JsonSerializable()
class MatchModel {
  final bool success;
  final MatchData data;

  MatchModel({required this.success, required this.data});

  factory MatchModel.fromJson(Map<String, dynamic> json) =>
      _$MatchModelFromJson(json);

  Map<String, dynamic> toJson() => _$MatchModelToJson(this);
}

@JsonSerializable()
class MatchData {
  final MatchEvent event;

  MatchData({required this.event});

  factory MatchData.fromJson(Map<String, dynamic> json) =>
      _$MatchDataFromJson(json);

  Map<String, dynamic> toJson() => _$MatchDataToJson(this);
}

@JsonSerializable()
class MatchEvent {
  final Tournament tournament;
  final Season season;
  final RoundInfo roundInfo;
  final String customId;
  final MatchStatus status;
  final Venue venue;
  final Referee referee;
  final Team homeTeam;
  final Team awayTeam;

  MatchEvent({
    required this.tournament,
    required this.season,
    required this.roundInfo,
    required this.customId,
    required this.status,
    required this.venue,
    required this.referee,
    required this.homeTeam,
    required this.awayTeam,
  });

  factory MatchEvent.fromJson(Map<String, dynamic> json) =>
      _$MatchEventFromJson(json);

  Map<String, dynamic> toJson() => _$MatchEventToJson(this);
}

@JsonSerializable()
class Tournament {
  final String name;
  final String slug;
  final Category category;
  final int id;

  Tournament({
    required this.name,
    required this.slug,
    required this.category,
    required this.id,
  });

  factory Tournament.fromJson(Map<String, dynamic> json) =>
      _$TournamentFromJson(json);

  Map<String, dynamic> toJson() => _$TournamentToJson(this);
}

@JsonSerializable()
class Category {
  final String name;
  final String slug;
  final Sport sport;
  final int id;

  Category({
    required this.name,
    required this.slug,
    required this.sport,
    required this.id,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Sport {
  final String name;
  final String slug;
  final int id;

  Sport({
    required this.name,
    required this.slug,
    required this.id,
  });

  factory Sport.fromJson(Map<String, dynamic> json) => _$SportFromJson(json);

  Map<String, dynamic> toJson() => _$SportToJson(this);
}

@JsonSerializable()
class Season {
  final String name;
  final String year;
  final bool editor;
  final int id;

  Season({
    required this.name,
    required this.year,
    required this.editor,
    required this.id,
  });

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonToJson(this);
}

@JsonSerializable()
class RoundInfo {
  final int round;
  final String name;
  final String slug;
  final int cupRoundType;

  RoundInfo({
    required this.round,
    required this.name,
    required this.slug,
    required this.cupRoundType,
  });

  factory RoundInfo.fromJson(Map<String, dynamic> json) =>
      _$RoundInfoFromJson(json);

  Map<String, dynamic> toJson() => _$RoundInfoToJson(this);
}

@JsonSerializable()
class MatchStatus {
  final int code;
  final String description;
  final String type;

  MatchStatus({
    required this.code,
    required this.description,
    required this.type,
  });

  factory MatchStatus.fromJson(Map<String, dynamic> json) =>
      _$MatchStatusFromJson(json);

  Map<String, dynamic> toJson() => _$MatchStatusToJson(this);
}

@JsonSerializable()
class Venue {
  final String name;
  final City city;
  final VenueCoordinates venueCoordinates;
  final int id;

  Venue({
    required this.name,
    required this.city,
    required this.venueCoordinates,
    required this.id,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);

  Map<String, dynamic> toJson() => _$VenueToJson(this);
}

@JsonSerializable()
class City {
  final String name;

  City({required this.name});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class VenueCoordinates {
  final double latitude;
  final double longitude;

  VenueCoordinates({
    required this.latitude,
    required this.longitude,
  });

  factory VenueCoordinates.fromJson(Map<String, dynamic> json) =>
      _$VenueCoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$VenueCoordinatesToJson(this);
}

@JsonSerializable()
class Referee {
  final String name;
  final int id;
  final Country country;

  Referee({
    required this.name,
    required this.id,
    required this.country,
  });

  factory Referee.fromJson(Map<String, dynamic> json) =>
      _$RefereeFromJson(json);

  Map<String, dynamic> toJson() => _$RefereeToJson(this);
}

@JsonSerializable()
class Country {
  final String name;
  final String alpha2;
  final String alpha3;
  final String slug;

  Country({
    required this.name,
    required this.alpha2,
    required this.alpha3,
    required this.slug,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class Team {
  final String name;
  final String slug;
  final String shortName;
  final String fullName;
  final TeamColors teamColors;
  final int id;
  final String? logo;

  Team({
    required this.name,
    required this.slug,
    required this.shortName,
    required this.fullName,
    required this.teamColors,
    required this.id,
    required this.logo,
  });

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  Map<String, dynamic> toJson() => _$TeamToJson(this);
}

@JsonSerializable()
class TeamColors {
  final String primary;
  final String secondary;
  final String text;

  TeamColors({
    required this.primary,
    required this.secondary,
    required this.text,
  });

  factory TeamColors.fromJson(Map<String, dynamic> json) =>
      _$TeamColorsFromJson(json);

  Map<String, dynamic> toJson() => _$TeamColorsToJson(this);
}
