import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scorers/bloc/best_player/best_player_bloc.dart';
import 'package:scorers/bloc/best_player/best_player_event.dart';
import 'package:scorers/bloc/best_player/best_player_state.dart';
import 'package:scorers/bloc/incidents/incidents_bloc.dart';
import 'package:scorers/bloc/incidents/incidents_event.dart';
import 'package:scorers/bloc/incidents/incidents_state.dart';
import 'package:scorers/bloc/match/match_bloc.dart';
import 'package:scorers/bloc/match/match_event.dart';
import 'package:scorers/bloc/match/match_state.dart';
import 'package:scorers/bloc/match_stats/match_stats_bloc.dart';
import 'package:scorers/bloc/match_stats/match_stats_event.dart';
import 'package:scorers/bloc/match_stats/match_stats_state.dart';
import 'package:scorers/bloc/momentum/momentum_bloc.dart';
import 'package:scorers/bloc/momentum/momentum_event.dart';
import 'package:scorers/bloc/momentum/momentum_state.dart';
import 'package:scorers/bloc/sample_player_image/sample_player_image_bloc.dart';
import 'package:scorers/bloc/sample_player_image/sample_player_image_event.dart';
import 'package:scorers/bloc/sample_player_image/sample_player_image_state.dart';
import 'package:scorers/bloc/video_highlight/video_highlight_bloc.dart';
import 'package:scorers/bloc/video_highlight/video_highlight_event.dart';
import 'package:scorers/bloc/video_highlight/video_highlight_state.dart';
import 'package:scorers/data/models/incidents_model.dart';
import 'package:scorers/data/repository/best_player_repository.dart';
import 'package:scorers/data/repository/incidents_repository.dart';
import 'package:scorers/data/repository/match_repository.dart';
import 'package:scorers/data/repository/match_stats_repository.dart';
import 'package:scorers/data/repository/momentum_repository.dart';
import 'package:scorers/data/repository/sample_player_image_repository.dart';
import 'package:scorers/data/repository/video_highlight_repository.dart';
import 'package:scorers/ui/widgets/custom_painter.dart';
import 'package:url_launcher/url_launcher.dart';

class MatchDetailsScreen extends StatefulWidget {
  @override
  _MatchDetailsScreenState createState() => _MatchDetailsScreenState();
}

class _MatchDetailsScreenState extends State<MatchDetailsScreen> {
  late BestPlayerBloc _bestPlayerBloc;
  late IncidentsBloc _incidentsBloc;
  late VideoHighlightBloc _videoHighlightBloc;
  late MatchBloc _matchBloc;
  late MatchStatsBloc _matchStatsBloc;
  late MomentumBloc _momentumBloc;
  late SamplePlayerImageBloc _samplePlayerImageBloc;

  @override
  void initState() {
    super.initState();
    _bestPlayerBloc = BestPlayerBloc(BestPlayerRepository())
      ..add(FetchBestPlayer());
    _incidentsBloc = IncidentsBloc(IncidentsRepository())
      ..add(FetchIncidents());
    _videoHighlightBloc = VideoHighlightBloc(VideoHighlightRepository())
      ..add(FetchVideoHighlight());
    _matchBloc = MatchBloc(MatchRepository())..add(FetchMatch());
    _matchStatsBloc = MatchStatsBloc(MatchStatsRepository())
      ..add(FetchMatchStats());
    _momentumBloc = MomentumBloc(MomentumRepository())..add(FetchMomentum());
    _samplePlayerImageBloc =
        SamplePlayerImageBloc(SamplePlayerImageRepository())
          ..add(FetchSamplePlayerImage());
  }

  @override
  void dispose() {
    _bestPlayerBloc.close();
    _incidentsBloc.close();
    _videoHighlightBloc.close();
    _matchBloc.close();
    _matchStatsBloc.close();
    _momentumBloc.close();
    _samplePlayerImageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/header_image.png',
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black.withOpacity(0.4),
              ),
            ],
          ),
          leading: IconButton(
            icon: Image.asset(
              'assets/back_arrow_3.png',
              color: Colors.white,
              width: 24.0,
              height: 24.0,
            ),
            onPressed: () {},
          ),
          title: Text(
            'Match Details',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            Image.asset(
              'assets/notification_3.png',
              color: Colors.white,
              width: 24.0,
              height: 24.0,
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(200),
            child: Column(
              children: [
                _buildMatchHeader(),
                const TabBar(
                  indicatorColor: Color.fromARGB(255, 67, 175, 164),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  unselectedLabelStyle:
                      TextStyle(fontWeight: FontWeight.normal),
                  tabs: [
                    Tab(
                      text: 'Overview',
                    ),
                    Tab(text: 'Line-up'),
                    Tab(text: 'Statistics'),
                    Tab(text: 'Matches'),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildOverviewSection(),
            _buildLineUpSection(),
            _buildStatisticsSection(),
            _buildMatchesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewSection() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHighlightSection(),
          _buildPlayerOfTheMatchSection(),
          _buildPenaltyShootoutSection(),
          _buildMatchMomentumSection(),
          _buildMatchIncidentsSection(),
        ],
      ),
    );
  }

  Widget _buildMatchHeader() {
    return BlocBuilder<IncidentsBloc, IncidentsState>(
      bloc: _incidentsBloc,
      builder: (context, incidentsState) {
        if (incidentsState is IncidentsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (incidentsState is IncidentsLoaded) {
          final incidents = incidentsState.incidentsModel.data.incidents;
          final ftIncident = incidents.firstWhere(
            (incident) => incident.text == "FT",
          );
          final penIncident = incidents.firstWhere(
            (incident) => incident.text == "PEN",
          );
          final homeGoals = incidents
              .where((incident) =>
                  incident.isHome == true && incident.incidentType == 'goal')
              .toList();
          final awayGoals = incidents
              .where((incident) =>
                  incident.isHome == false && incident.incidentType == 'goal')
              .toList();

          final ftHomeScore = ftIncident.homeScore ?? 0;
          final ftAwayScore = ftIncident.awayScore ?? 0;
          final penHomeScore = penIncident.homeScore ?? 0;
          final penAwayScore = penIncident.awayScore ?? 0;

          return BlocBuilder<MatchBloc, MatchState>(
            bloc: _matchBloc,
            builder: (context, matchState) {
              if (matchState is MatchLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (matchState is MatchLoaded) {
                final homeTeamName =
                    matchState.matchModel.data.event.homeTeam.name;
                final awayTeamName =
                    matchState.matchModel.data.event.awayTeam.name;
                final homeTeamLogo =
                    matchState.matchModel.data.event.homeTeam.logo;
                final awayTeamLogo =
                    matchState.matchModel.data.event.awayTeam.logo;

                return Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildTeamColumn(homeTeamName, homeTeamLogo),
                          Column(
                            children: [
                              Text(
                                '$ftHomeScore - $ftAwayScore',
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '($penHomeScore - $penAwayScore)',
                                style: const TextStyle(color: Colors.white),
                              ),
                              const Text(
                                'Penalty',
                                style: TextStyle(color: Colors.white),
                              ),
                              const Icon(Icons.sports_soccer,
                                  size: 16, color: Colors.grey),
                            ],
                          ),
                          _buildTeamColumn(awayTeamName, awayTeamLogo),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  List.generate(homeGoals.length, (index) {
                                final playerName =
                                    homeGoals[index].player?.shortName ??
                                        "Unknown Player";
                                final time = homeGoals[index].time != null
                                    ? "${homeGoals[index].time}'"
                                    : "0'";
                                return Text(
                                  '$playerName $time',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                );
                              }),
                            ),
                          ),
                          const VerticalDivider(
                              color: Colors.white, thickness: 1),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children:
                                  List.generate(awayGoals.length, (index) {
                                final playerName =
                                    awayGoals[index].player?.shortName ??
                                        "Unknown Player";
                                final time = awayGoals[index].time != null
                                    ? "${awayGoals[index].time}'"
                                    : "0'";
                                return Text(
                                  '$playerName $time',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                );
                              }),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              } else if (matchState is MatchError) {
                return Center(child: Text(matchState.message));
              }
              return const Center(child: Text('No match data available.'));
            },
          );
        } else if (incidentsState is IncidentsError) {
          return Center(child: Text(incidentsState.message));
        }
        return const Center(child: Text('No incidents data available.'));
      },
    );
  }

  Widget _buildMatchIncidentsSection() {
    return BlocBuilder<MatchBloc, MatchState>(
      bloc: _matchBloc,
      builder: (context, matchState) {
        if (matchState is MatchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (matchState is MatchLoaded) {
          final homeTeamLogo =
              matchState.matchModel.data.event.homeTeam.logo ?? '';
          final awayTeamLogo =
              matchState.matchModel.data.event.awayTeam.logo ?? '';

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.teal.shade400,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildLogoFromBase64(homeTeamLogo),
                        const Text(
                          'Match Current Stat',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        _buildLogoFromBase64(awayTeamLogo),
                      ],
                    ),
                  ),
                  Column(
                    children: incidents.map((incident) {
                      return _buildCardItem(
                        homePlayerImage: incident['team'] as String == 'home'
                            ? 'assets/mtn.png'
                            : '',
                        homePlayerName: incident['team'] as String == 'home'
                            ? incident['playerName'] as String
                            : '',
                        homeIcon: incident['team'] == 'home'
                            ? Icons.sports_soccer
                            : null,
                        time: incident['minute'] as int,
                        awayIcon: incident['team'] == 'away'
                            ? Icons.sports_soccer
                            : null,
                        awayPlayerName: incident['team'] as String == 'away'
                            ? incident['playerName'] as String
                            : '',
                        awayPlayerImage:
                            incident['team'] == 'away' ? 'assets/mtn.png' : '',
                        homeIncidentType: incident['team'] as String == 'home'
                            ? incident['incidentType'] as String
                            : '',
                        awayIncidentType: incident['team'] as String == 'away'
                            ? incident['incidentType'] as String
                            : '',
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        } else if (matchState is MatchError) {
          return Center(child: Text(matchState.message));
        }
        return const Center(child: Text('No match data available.'));
      },
    );
  }

  Widget? _getIncidentWidget(String incidentType) {
    switch (incidentType) {
      case 'Goal':
        return Image.asset(
          'assets/penalty_scored.png',
          height: 25.0,
          width: 25.0,
        );
      case 'Red Card':
        return Image.asset(
          'assets/yellow_card.png',
          height: 25.0,
          width: 25.0,
        );
      case 'Yellow Card':
        return Image.asset(
          'assets/red_card.png',
          height: 25.0,
          width: 25.0,
        );
      case 'Penalty':
        return Icon(
          Icons.sports,
          size: 16.0,
          color: Colors.red,
        );
      default:
        return null;
    }
  }

  Widget _buildCardItem({
    required String homePlayerImage,
    required String homePlayerName,
    required IconData? homeIcon,
    required int time,
    required IconData? awayIcon,
    required String awayPlayerName,
    required String awayPlayerImage,
    required String homeIncidentType,
    required String awayIncidentType,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (homePlayerImage.isNotEmpty)
                      Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 20.0,
                      ),
                    const SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          homePlayerName,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        if (homeIncidentType.isNotEmpty)
                          Text(
                            '($homeIncidentType)',
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                if (_getIncidentWidget(homeIncidentType) != null)
                  _getIncidentWidget(homeIncidentType)!,
              ],
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          Stack(
            children: [
              SizedBox(
                width: 20.0,
                height: 50.0,
                child: CustomPaint(
                  painter: DashedLinePainter(),
                ),
              ),
              Positioned(
                top: 14,
                left: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '$time\'',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_getIncidentWidget(awayIncidentType) != null)
                  _getIncidentWidget(awayIncidentType)!,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          awayPlayerName,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        if (awayIncidentType.isNotEmpty)
                          Text(
                            '($awayIncidentType)',
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(width: 8.0),
                    if (awayPlayerImage.isNotEmpty)
                      Icon(
                        Icons.person_3_rounded,
                        color: Colors.grey,
                        size: 20.0,
                      )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMatchMomentumSection() {
    return BlocBuilder<MatchStatsBloc, MatchStatsState>(
      bloc: _matchStatsBloc,
      builder: (context, matchStatsState) {
        if (matchStatsState is MatchStatsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (matchStatsState is MatchStatsLoaded) {
          final matchStats = matchStatsState.matchStats.data.statistics;

          int homePossession = 0;
          int awayPossession = 0;

          for (var stats in matchStats) {
            if (stats.period == "ALL") {
              for (var group in stats.groups) {
                for (var item in group.statisticsItems) {
                  if (item.name == "Ball possession") {
                    homePossession = (item.homeValue as num).toInt();
                    awayPossession = (item.awayValue as num).toInt();
                    break;
                  }
                }
              }
            }
          }

          return BlocBuilder<MatchBloc, MatchState>(
            bloc: _matchBloc,
            builder: (context, matchState) {
              if (matchState is MatchLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (matchState is MatchLoaded) {
                final homeTeamLogo =
                    matchState.matchModel.data.event.homeTeam.logo ?? '';
                final awayTeamLogo =
                    matchState.matchModel.data.event.awayTeam.logo ?? '';

                return BlocBuilder<MomentumBloc, MomentumState>(
                  bloc: _momentumBloc,
                  builder: (context, momentumState) {
                    if (momentumState is MomentumLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (momentumState is MomentumLoaded) {
                      final momentumData =
                          momentumState.momentumModel.data.graphPoints;

                      final List<int> homeMomentumData =
                          momentumData.map((point) => point.value).toList();

                      final List<int> awayMomentumData =
                          momentumData.map((point) => point.value).toList();

                      return _buildMomentumUI(
                        homeTeamLogo: homeTeamLogo,
                        awayTeamLogo: awayTeamLogo,
                        homePossession: homePossession,
                        awayPossession: awayPossession,
                        homeMomentumData: homeMomentumData,
                        awayMomentumData: awayMomentumData,
                      );
                    } else if (momentumState is MomentumError) {
                      return Center(child: Text(momentumState.message));
                    }
                    return const Center(child: Text('No momentum data.'));
                  },
                );
              } else if (matchState is MatchError) {
                return Center(child: Text(matchState.message));
              }
              return const Center(child: Text('No match data available.'));
            },
          );
        } else if (matchStatsState is MatchStatsError) {
          return Center(child: Text(matchStatsState.message));
        }
        return const Center(child: Text('No match stats available.'));
      },
    );
  }

  Widget _buildLogoFromBase64(String? base64Logo) {
    if (base64Logo == null || base64Logo.isEmpty) {
      return Icon(
        Icons.shield,
        size: 40.0,
        color: Colors.grey.shade300,
      );
    }
    return ClipOval(
      child: Image.memory(
        base64Decode(base64Logo),
        height: 40.0,
        width: 40.0,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildPenaltyShootoutSection() {
    return BlocBuilder<IncidentsBloc, IncidentsState>(
      bloc: _incidentsBloc,
      builder: (context, incidentsState) {
        if (incidentsState is IncidentsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (incidentsState is IncidentsLoaded) {
          final incidents = incidentsState.incidentsModel.data.incidents;

          final homePenalties = _getPenaltyResults(incidents, true);
          final awayPenalties = _getPenaltyResults(incidents, false);

          final penIncident = incidents.firstWhere(
            (incident) => incident.text == "PEN",
          );

          final penHomeScore = penIncident.homeScore ?? 0;
          final penAwayScore = penIncident.awayScore ?? 0;

          return BlocBuilder<MatchBloc, MatchState>(
            bloc: _matchBloc,
            builder: (context, matchState) {
              if (matchState is MatchLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (matchState is MatchLoaded) {
                final homeTeamLogo =
                    matchState.matchModel.data.event.homeTeam.logo;
                final awayTeamLogo =
                    matchState.matchModel.data.event.awayTeam.logo;

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.teal.shade400,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          child: const Text(
                            'Penalty Shootout',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 16.0,
                          ),
                          child: Column(
                            children: [
                              _buildTeamRow(
                                base64Logo: homeTeamLogo,
                                score: penHomeScore,
                                color: Colors.yellow.shade50,
                                penalties: homePenalties,
                              ),
                              _buildTeamRow(
                                base64Logo: awayTeamLogo,
                                score: penAwayScore,
                                color: Colors.red.shade50,
                                penalties: awayPenalties,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (matchState is MatchError) {
                return Center(child: Text(matchState.message));
              }
              return const Center(child: Text('No match data available.'));
            },
          );
        } else if (incidentsState is IncidentsError) {
          return Center(child: Text(incidentsState.message));
        }
        return const Center(child: Text('No incidents data available.'));
      },
    );
  }

  Widget _buildTeamRow({
    required int score,
    required Color color,
    required List<bool> penalties,
    required String? base64Logo,
  }) {
    final isLogoAvailable = base64Logo != null && base64Logo.isNotEmpty;

    return Container(
      color: color,
      child: Row(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '($score)',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 8.0),
                ClipOval(
                  child: isLogoAvailable
                      ? Image.memory(
                          base64Decode(base64Logo!),
                          height: 24.0,
                          width: 24.0,
                          fit: BoxFit.contain,
                        )
                      : Icon(
                          Icons.sports_soccer,
                          size: 24.0,
                          color: Colors.grey.shade300,
                        ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: penalties.map((scored) {
                return Image.asset(
                  scored
                      ? 'assets/penalty_scored.png'
                      : 'assets/penalty_missed.png',
                  height: 25.0,
                  width: 25.0,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightSection() {
    return BlocBuilder<VideoHighlightBloc, VideoHighlightState>(
      bloc: _videoHighlightBloc,
      builder: (context, state) {
        if (state is VideoHighlightLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is VideoHighlightLoaded) {
          final highlight = state.videoHighlightModel.data.highlights.first;
          final thumbnailUrl = highlight.thumbnailUrl;
          final videoUrl = highlight.url;

          return GestureDetector(
            onTap: () {
              if (videoUrl.isNotEmpty) {
                launchUrl(Uri.parse(videoUrl));
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey.shade200,
                      image: thumbnailUrl.isNotEmpty
                          ? DecorationImage(
                              image: NetworkImage(thumbnailUrl),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 16,
                    child: Text(
                      'Watch Highlight',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Icon(
                      Icons.play_circle_fill,
                      size: 64,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is VideoHighlightError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        return const Center(
          child: Text('No highlight available.'),
        );
      },
    );
  }

  Widget _buildTeamColumn(String teamName, String? base64Logo) {
    final isLogoAvailable = base64Logo != null && base64Logo.isNotEmpty;

    return Column(
      children: [
        ClipOval(
          child: isLogoAvailable
              ? Image.memory(
                  base64Decode(base64Logo),
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                )
              : Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.grey.shade300,
                ),
        ),
        const SizedBox(height: 8),
        Text(
          teamName,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildPlayerOfTheMatchSection() {
    return BlocBuilder<BestPlayerBloc, BestPlayerState>(
      bloc: _bestPlayerBloc,
      builder: (context, bestPlayerState) {
        if (bestPlayerState is BestPlayerLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (bestPlayerState is BestPlayerLoaded) {
          final homePlayer =
              bestPlayerState.bestPlayerModel.data.bestHomeTeamPlayer;
          final awayPlayer =
              bestPlayerState.bestPlayerModel.data.bestAwayTeamPlayer;

          final isHomePlayerWinner =
              double.parse(homePlayer.value) > double.parse(awayPlayer.value);

          final playerOfTheMatch =
              isHomePlayerWinner ? homePlayer.player : awayPlayer.player;

          final playerRating =
              isHomePlayerWinner ? homePlayer.value : awayPlayer.value;

          return BlocBuilder<SamplePlayerImageBloc, SamplePlayerImageState>(
            bloc: _samplePlayerImageBloc,
            builder: (context, samplePlayerImageState) {
              if (samplePlayerImageState is SamplePlayerImageLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (samplePlayerImageState is SamplePlayerImageLoaded) {
                final base64Logo =
                    samplePlayerImageState.samplePlayerImageModel.data;
                final isLogoAvailable = base64Logo.isNotEmpty;

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.teal.shade400,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          child: const Text(
                            'Player Of The Match',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              ClipOval(
                                child: isLogoAvailable
                                    ? Image.memory(
                                        base64Decode(base64Logo),
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,
                                      )
                                    : Icon(
                                        Icons.person,
                                        size: 50,
                                        color: Colors.grey.shade300,
                                      ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    playerOfTheMatch.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(Icons.sports_soccer,
                                          size: 16, color: Colors.grey),
                                      const SizedBox(width: 4),
                                      Text(
                                        playerOfTheMatch.shortName,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.teal.shade400,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Text(
                                  playerRating,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (samplePlayerImageState is SamplePlayerImageError) {
                return Center(
                  child: Text(
                    samplePlayerImageState.message,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }
              return const Center(
                child: Text('No player image available.'),
              );
            },
          );
        } else if (bestPlayerState is BestPlayerError) {
          return Center(
            child: Text(
              bestPlayerState.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        return const Center(
          child: Text('No player data available.'),
        );
      },
    );
  }

  Widget _buildMomentumUI({
    required String homeTeamLogo,
    required String awayTeamLogo,
    required int homePossession,
    required int awayPossession,
    required List<int> homeMomentumData,
    required List<int> awayMomentumData,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal.shade400,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              padding: const EdgeInsets.all(12.0),
              child: const Text(
                'Live Match Momentum',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$homePossession%',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Ball Possession',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    '$awayPossession%',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Flexible(
                    flex: homePossession,
                    child: Container(
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 215, 197, 33),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          bottomLeft: Radius.circular(4.0),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: awayPossession,
                    child: Container(
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: Colors.red.shade400,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(4.0),
                          bottomRight: Radius.circular(4.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      _buildLogoFromBase64(homeTeamLogo),
                      const SizedBox(height: 8.0),
                      _buildLogoFromBase64(awayTeamLogo),
                    ],
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.yellow.shade50,
                            Colors.red.shade50,
                          ],
                          stops: [0.5, 0.5],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: CustomPaint(
                        painter: MatchMomentumGraphPainter(
                          homeMomentumData: homeMomentumData,
                          awayMomentumData: awayMomentumData,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _buildLineUpSection() {
    return Center(
      child: Text(
        'Line-up Section',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildStatisticsSection() {
    return Center(
      child: Text(
        'Statistics Section',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildMatchesSection() {
    return Center(
      child: Text(
        'Matches Section',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  List<bool> _getPenaltyResults(List<Incident> incidents, bool isHome) {
    final teamPenalties = incidents
        .where((incident) =>
            incident.incidentType == 'penaltyShootout' &&
            incident.isHome == isHome)
        .toList();

    teamPenalties.sort((a, b) => (a.sequence ?? 0).compareTo(b.sequence ?? 0));

    return teamPenalties
        .map((incident) => incident.incidentClass == 'scored')
        .toList();
  }

  final incidents = [
    {
      'minute': 5,
      'playerName': 'John Doe',
      'incidentType': 'Goal',
      'team': 'home',
      'score': '1 - 0',
    },
    {
      'minute': 23,
      'playerName': 'Jane Smith',
      'incidentType': 'Yellow Card',
      'team': 'away',
      'score': null,
    },
    {
      'minute': 45,
      'playerName': 'Michael Brown',
      'incidentType': 'Goal',
      'team': 'home',
      'score': '2 - 0',
    },
    {
      'minute': 65,
      'playerName': 'Chris Johnson',
      'incidentType': 'Red Card',
      'team': 'away',
      'score': null,
    },
    {
      'minute': 90,
      'playerName': 'David Lee',
      'incidentType': 'Penalty',
      'team': 'away',
      'score': '2 - 1',
    },
  ];
}
