import 'package:json_annotation/json_annotation.dart';

part 'video_highlight_model.g.dart';

@JsonSerializable()
class VideoHighlightModel {
  final bool success;
  final HighlightsData data;

  VideoHighlightModel({required this.success, required this.data});

  factory VideoHighlightModel.fromJson(Map<String, dynamic> json) =>
      _$HighlightsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HighlightsResponseToJson(this);
}

@JsonSerializable()
class HighlightsData {
  final List<Highlight> highlights;

  HighlightsData({required this.highlights});

  factory HighlightsData.fromJson(Map<String, dynamic> json) =>
      _$HighlightsDataFromJson(json);

  Map<String, dynamic> toJson() => _$HighlightsDataToJson(this);
}

@JsonSerializable()
class Highlight {
  final String title;
  final String subtitle;
  final String url;
  final String thumbnailUrl;
  final int mediaType;
  final bool doFollow;
  final bool keyHighlight;
  final int id;
  final int createdAtTimestamp;
  final String sourceUrl;

  Highlight({
    required this.title,
    required this.subtitle,
    required this.url,
    required this.thumbnailUrl,
    required this.mediaType,
    required this.doFollow,
    required this.keyHighlight,
    required this.id,
    required this.createdAtTimestamp,
    required this.sourceUrl,
  });

  factory Highlight.fromJson(Map<String, dynamic> json) =>
      _$HighlightFromJson(json);

  Map<String, dynamic> toJson() => _$HighlightToJson(this);
}
