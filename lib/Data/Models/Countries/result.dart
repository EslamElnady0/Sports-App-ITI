class Result {
  int? countryKey;
  String? countryName;
  String? countryIso2;
  String? countryLogo;

  Result({
    this.countryKey,
    this.countryName,
    this.countryIso2,
    this.countryLogo,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        countryKey: json['country_key'] as int?,
        countryName: json['country_name'] as String? ?? "",
        countryIso2: json['country_iso2'] as String?,
        countryLogo: json['country_logo'] as String? ??
            "https://as2.ftcdn.net/v2/jpg/04/70/29/87/1000_F_470298738_1eHqTZ0B5AvB3emaESPpvQ93227y7P0l.jpg",
      );

  Map<String, dynamic> toJson() => {
        'country_key': countryKey,
        'country_name': countryName,
        'country_iso2': countryIso2,
        'country_logo': countryLogo,
      };
}
