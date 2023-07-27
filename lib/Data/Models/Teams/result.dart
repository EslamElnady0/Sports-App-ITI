import 'coach.dart';
import 'player.dart';

class Result {
	int? teamKey;
	String? teamName;
	String? teamLogo;
	List<Player>? players;
	List<Coach>? coaches;

	Result({
		this.teamKey, 
		this.teamName, 
		this.teamLogo, 
		this.players, 
		this.coaches, 
	});

	factory Result.fromJson(Map<String, dynamic> json) => Result(
				teamKey: json['team_key'] as int?,
				teamName: json['team_name'] as String?,
				teamLogo: json['team_logo'] as String?,
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
