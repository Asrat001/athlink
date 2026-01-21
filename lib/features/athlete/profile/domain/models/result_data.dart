import 'dart:io';

class   ResultData {
  final String id;
  final String date;
  final String position;
  final String competition;
  final String division;
  final String flagUrl;
  final String location;
  final List<File> media;
  final List<String> mediaUrls;
  final String competitionSummary;
  final String? resultLink;

  ResultData({
    required this.id,
    required this.date,
    required this.position,
    required this.competition,
    required this.division,
    required this.flagUrl,
    this.location = "Turkey",
    this.media = const [],
    this.mediaUrls = const [],
    this.competitionSummary = "",
    this.resultLink,
  });

  ResultData copyWith({
    List<File>? media,
    List<String>? mediaUrls,
    String? competitionSummary,
    String? resultLink,
  }) {
    return ResultData(
      id: id,
      date: date,
      position: position,
      competition: competition,
      division: division,
      flagUrl: flagUrl,
      location: location,
      mediaUrls: mediaUrls ?? this.mediaUrls,
      media: media ?? this.media,
      competitionSummary: competitionSummary ?? this.competitionSummary,
      resultLink: resultLink ?? this.resultLink,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'position': position,
      'competition': competition,
      'division': division,
      'flagUrl': flagUrl,
      'location': location,
      'media': media,
      'competitionSummary': competitionSummary,
      'resultLink': resultLink,
    };
  }
}
