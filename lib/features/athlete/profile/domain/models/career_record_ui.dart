class CareerRecord {
  final String logoUrl;
  final String position;
  final String team;
  String? location;
  final String duration;
  final String achievements;
  final String description;

  CareerRecord({
    required this.logoUrl,
    required this.position,
    required this.team,
    this.location,
    required this.duration,
    required this.achievements,
    required this.description,
  });
}
