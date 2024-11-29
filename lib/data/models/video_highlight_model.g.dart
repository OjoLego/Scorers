// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_highlight_model.dart';

VideoHighlightModel _$HighlightsResponseFromJson(Map<String, dynamic> json) =>
    VideoHighlightModel(
      success: json['success'] as bool,
      data: HighlightsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HighlightsResponseToJson(VideoHighlightModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data.toJson(),
    };

HighlightsData _$HighlightsDataFromJson(Map<String, dynamic> json) =>
    HighlightsData(
      highlights: (json['highlights'] as List<dynamic>)
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HighlightsDataToJson(HighlightsData instance) =>
    <String, dynamic>{
      'highlights': instance.highlights.map((e) => e.toJson()).toList(),
    };

Highlight _$HighlightFromJson(Map<String, dynamic> json) => Highlight(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      mediaType: json['mediaType'] as int,
      doFollow: json['doFollow'] as bool,
      keyHighlight: json['keyHighlight'] as bool,
      id: json['id'] as int,
      createdAtTimestamp: json['createdAtTimestamp'] as int,
      sourceUrl: json['sourceUrl'] as String,
    );

Map<String, dynamic> _$HighlightToJson(Highlight instance) => <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
      'mediaType': instance.mediaType,
      'doFollow': instance.doFollow,
      'keyHighlight': instance.keyHighlight,
      'id': instance.id,
      'createdAtTimestamp': instance.createdAtTimestamp,
      'sourceUrl': instance.sourceUrl,
    };
