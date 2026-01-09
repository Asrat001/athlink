import 'dart:io';

class ResultData {
  final String date;
  final String position;
  final String competition;
  final String division;
  final String flagUrl;
  final String location;
  final List<File> media;
  final String summary;
  final String? resultsLink;

  ResultData({
    required this.date,
    required this.position,
    required this.competition,
    required this.division,
    required this.flagUrl,
    this.location = "Turkey",
    this.media = const [],
    this.summary = "",
    this.resultsLink,
  });

  ResultData copyWith({
    List<File>? media,
    String? summary,
    String? resultsLink,
  }) {
    return ResultData(
      date: date,
      position: position,
      competition: competition,
      division: division,
      flagUrl: flagUrl,
      location: location,
      media: media ?? this.media,
      summary: summary ?? this.summary,
      resultsLink: resultsLink ?? this.resultsLink,
    );
  }
}