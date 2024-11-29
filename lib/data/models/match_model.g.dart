// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchModel _$MatchModelFromJson(Map<String, dynamic> json) {
  return MatchModel(
    success: json['success'] as bool,
    data: MatchData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MatchModelToJson(MatchModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data.toJson(),
    };

MatchData _$MatchDataFromJson(Map<String, dynamic> json) {
  return MatchData(
    event: MatchEvent.fromJson(json['event'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MatchDataToJson(MatchData instance) => <String, dynamic>{
      'event': instance.event.toJson(),
    };

MatchEvent _$MatchEventFromJson(Map<String, dynamic> json) {
  return MatchEvent(
    tournament: Tournament.fromJson(json['tournament'] as Map<String, dynamic>),
    season: Season.fromJson(json['season'] as Map<String, dynamic>),
    roundInfo: RoundInfo.fromJson(json['roundInfo'] as Map<String, dynamic>),
    customId: json['customId'] as String,
    status: MatchStatus.fromJson(json['status'] as Map<String, dynamic>),
    venue: Venue.fromJson(json['venue'] as Map<String, dynamic>),
    referee: Referee.fromJson(json['referee'] as Map<String, dynamic>),
    homeTeam: Team.fromJson(json['homeTeam'] as Map<String, dynamic>),
    awayTeam: Team.fromJson(json['awayTeam'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MatchEventToJson(MatchEvent instance) =>
    <String, dynamic>{
      'tournament': instance.tournament.toJson(),
      'season': instance.season.toJson(),
      'roundInfo': instance.roundInfo.toJson(),
      'customId': instance.customId,
      'status': instance.status.toJson(),
      'venue': instance.venue.toJson(),
      'referee': instance.referee.toJson(),
      'homeTeam': instance.homeTeam.toJson(),
      'awayTeam': instance.awayTeam.toJson(),
    };

Tournament _$TournamentFromJson(Map<String, dynamic> json) {
  return Tournament(
    name: json['name'] as String,
    slug: json['slug'] as String,
    category: Category.fromJson(json['category'] as Map<String, dynamic>),
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$TournamentToJson(Tournament instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'category': instance.category.toJson(),
      'id': instance.id,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    name: json['name'] as String,
    slug: json['slug'] as String,
    sport: Sport.fromJson(json['sport'] as Map<String, dynamic>),
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'sport': instance.sport.toJson(),
      'id': instance.id,
    };

Sport _$SportFromJson(Map<String, dynamic> json) {
  return Sport(
    name: json['name'] as String,
    slug: json['slug'] as String,
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$SportToJson(Sport instance) => <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'id': instance.id,
    };

Season _$SeasonFromJson(Map<String, dynamic> json) {
  return Season(
    name: json['name'] as String,
    year: json['year'] as String,
    editor: json['editor'] as bool,
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$SeasonToJson(Season instance) => <String, dynamic>{
      'name': instance.name,
      'year': instance.year,
      'editor': instance.editor,
      'id': instance.id,
    };

RoundInfo _$RoundInfoFromJson(Map<String, dynamic> json) {
  return RoundInfo(
    round: json['round'] as int,
    name: json['name'] as String,
    slug: json['slug'] as String,
    cupRoundType: json['cupRoundType'] as int,
  );
}

Map<String, dynamic> _$RoundInfoToJson(RoundInfo instance) => <String, dynamic>{
      'round': instance.round,
      'name': instance.name,
      'slug': instance.slug,
      'cupRoundType': instance.cupRoundType,
    };

MatchStatus _$MatchStatusFromJson(Map<String, dynamic> json) {
  return MatchStatus(
    code: json['code'] as int,
    description: json['description'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$MatchStatusToJson(MatchStatus instance) =>
    <String, dynamic>{
      'code': instance.code,
      'description': instance.description,
      'type': instance.type,
    };

Venue _$VenueFromJson(Map<String, dynamic> json) {
  return Venue(
    name: json['name'] as String,
    city: City.fromJson(json['city'] as Map<String, dynamic>),
    venueCoordinates: VenueCoordinates.fromJson(
        json['venueCoordinates'] as Map<String, dynamic>),
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$VenueToJson(Venue instance) => <String, dynamic>{
      'name': instance.name,
      'city': instance.city.toJson(),
      'venueCoordinates': instance.venueCoordinates.toJson(),
      'id': instance.id,
    };

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'name': instance.name,
    };

VenueCoordinates _$VenueCoordinatesFromJson(Map<String, dynamic> json) {
  return VenueCoordinates(
    latitude: (json['latitude'] as num).toDouble(),
    longitude: (json['longitude'] as num).toDouble(),
  );
}

Map<String, dynamic> _$VenueCoordinatesToJson(VenueCoordinates instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

Referee _$RefereeFromJson(Map<String, dynamic> json) {
  return Referee(
    name: json['name'] as String,
    id: json['id'] as int,
    country: Country.fromJson(json['country'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RefereeToJson(Referee instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'country': instance.country.toJson(),
    };

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    name: json['name'] as String,
    alpha2: json['alpha2'] as String,
    alpha3: json['alpha3'] as String,
    slug: json['slug'] as String,
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'alpha2': instance.alpha2,
      'alpha3': instance.alpha3,
      'slug': instance.slug,
    };

Team _$TeamFromJson(Map<String, dynamic> json) {
  return Team(
    name: json['name'] as String,
    slug: json['slug'] as String,
    shortName: json['shortName'] as String,
    fullName: json['fullName'] as String,
    teamColors: TeamColors.fromJson(json['teamColors'] as Map<String, dynamic>),
    id: json['id'] as int,
    logo: json['logo'] as String,
  );
}

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'shortName': instance.shortName,
      'fullName': instance.fullName,
      'teamColors': instance.teamColors.toJson(),
      'id': instance.id,
    };

TeamColors _$TeamColorsFromJson(Map<String, dynamic> json) {
  return TeamColors(
    primary: json['primary'] as String,
    secondary: json['secondary'] as String,
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$TeamColorsToJson(TeamColors instance) =>
    <String, dynamic>{
      'primary': instance.primary,
      'secondary': instance.secondary,
      'text': instance.text,
    };
