class Result {
  int? leagueKey;
  String? leagueName;
  int? countryKey;
  String? countryName;
  String? leagueLogo;
  String? countryLogo;

  Result({
    this.leagueKey,
    this.leagueName,
    this.countryKey,
    this.countryName,
    this.leagueLogo,
    this.countryLogo,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        leagueKey: json['league_key'] as int?,
        leagueName: json['league_name'] as String?,
        countryKey: json['country_key'] as int?,
        countryName: json['country_name'] as String?,
        leagueLogo: json['league_logo'] as String? ??
            json['country_logo'] as String? ??
            "https://as2.ftcdn.net/v2/jpg/04/70/29/87/1000_F_470298738_1eHqTZ0B5AvB3emaESPpvQ93227y7P0l.jpg",
        countryLogo: json['country_logo'] as String? ??
            "https://as2.ftcdn.net/v2/jpg/04/70/29/87/1000_F_470298738_1eHqTZ0B5AvB3emaESPpvQ93227y7P0l.jpg",
      );

  Map<String, dynamic> toJson() => {
        'league_key': leagueKey,
        'league_name': leagueName,
        'country_key': countryKey,
        'country_name': countryName,
        'league_logo': leagueLogo,
        'country_logo': countryLogo,
      };
}
