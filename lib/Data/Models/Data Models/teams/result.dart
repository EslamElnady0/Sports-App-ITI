import 'coach.dart';
import 'player.dart';

class TeamResult {
  int? teamKey;
  String? teamName;
  String? teamLogo;
  List<Player>? players;
  List<Coach>? coaches;

  TeamResult({
    this.teamKey,
    this.teamName,
    this.teamLogo,
    this.players,
    this.coaches,
  });

  factory TeamResult.fromJson(Map<String, dynamic> json) => TeamResult(
        teamKey: json['team_key'] as int?,
        teamName: json['team_name'] as String? ?? "Unknown Team",
        teamLogo: json['team_logo'] as String? ??
            "https://www.seekpng.com/png/full/28-289657_espn-soccer-team-logo-default.png",
        players: (json['players'] as List<dynamic>?)
            ?.map((e) => Player.fromJson(e as Map<String, dynamic>))
            .toList(),
        coaches: (json['coaches'] as List<dynamic>?)
            ?.map((e) => Coach.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'team_key': teamKey,
        'team_name': teamName,
        'team_logo': teamLogo,
        'players': players?.map((e) => e.toJson()).toList(),
        'coaches': coaches?.map((e) => e.toJson()).toList(),
      };
}
