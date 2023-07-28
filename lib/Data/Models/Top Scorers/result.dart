class Result {
  int? playerPlace;
  String? playerName;
  int? playerKey;
  String? teamName;
  int? teamKey;
  int? goals;
  dynamic assists;
  int? penaltyGoals;

  Result({
    this.playerPlace,
    this.playerName,
    this.playerKey,
    this.teamName,
    this.teamKey,
    this.goals,
    this.assists,
    this.penaltyGoals,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        playerPlace: json['player_place'] as int? ?? 0,
        playerName: json['player_name'] as String? ?? "",
        playerKey: json['player_key'] as int? ?? 0,
        teamName: json['team_name'] as String? ?? "",
        teamKey: json['team_key'] as int? ?? 0,
        goals: json['goals'] as int? ?? 0,
        assists: json['assists'] as dynamic ?? "",
        penaltyGoals: json['penalty_goals'] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'player_place': playerPlace,
        'player_name': playerName,
        'player_key': playerKey,
        'team_name': teamName,
        'team_key': teamKey,
        'goals': goals,
        'assists': assists,
        'penalty_goals': penaltyGoals,
      };
}
