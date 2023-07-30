class Result {
  int? playerKey;
  String? playerName;
  dynamic playerNumber;
  dynamic playerCountry;
  String? playerType;
  dynamic playerAge;
  dynamic playerMatchPlayed;
  dynamic playerGoals;
  dynamic playerYellowCards;
  dynamic playerRedCards;
  dynamic playerMinutes;
  String? playerInjured;
  dynamic playerSubstituteOut;
  dynamic playerSubstitutesOnBench;
  dynamic playerAssists;
  String? playerIsCaptain;
  dynamic playerShotsTotal;
  dynamic playerGoalsConceded;
  dynamic playerFoulsCommited;
  dynamic playerTackles;
  dynamic playerBlocks;
  dynamic playerCrossesTotal;
  dynamic playerInterceptions;
  dynamic playerClearances;
  dynamic playerDispossesed;
  dynamic playerSaves;
  dynamic playerInsideBoxSaves;
  dynamic playerDuelsTotal;
  dynamic playerDuelsWon;
  dynamic playerDribbleAttempts;
  dynamic playerDribbleSucc;
  dynamic playerPenComm;
  dynamic playerPenWon;
  dynamic playerPenScored;
  dynamic playerPenMissed;
  dynamic playerPasses;
  dynamic playerPassesAccuracy;
  dynamic playerKeyPasses;
  dynamic playerWoordworks;
  dynamic playerRating;
  String? teamName;
  int? teamKey;
  dynamic playerImage;

  Result({
    this.playerKey,
    this.playerName,
    this.playerNumber,
    this.playerCountry,
    this.playerType,
    this.playerAge,
    this.playerMatchPlayed,
    this.playerGoals,
    this.playerYellowCards,
    this.playerRedCards,
    this.playerMinutes,
    this.playerInjured,
    this.playerSubstituteOut,
    this.playerSubstitutesOnBench,
    this.playerAssists,
    this.playerIsCaptain,
    this.playerShotsTotal,
    this.playerGoalsConceded,
    this.playerFoulsCommited,
    this.playerTackles,
    this.playerBlocks,
    this.playerCrossesTotal,
    this.playerInterceptions,
    this.playerClearances,
    this.playerDispossesed,
    this.playerSaves,
    this.playerInsideBoxSaves,
    this.playerDuelsTotal,
    this.playerDuelsWon,
    this.playerDribbleAttempts,
    this.playerDribbleSucc,
    this.playerPenComm,
    this.playerPenWon,
    this.playerPenScored,
    this.playerPenMissed,
    this.playerPasses,
    this.playerPassesAccuracy,
    this.playerKeyPasses,
    this.playerWoordworks,
    this.playerRating,
    this.teamName,
    this.teamKey,
    this.playerImage,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        playerKey: json['player_key'] as int?,
        playerName: json['player_name'] as String? ?? "Unknown",
        playerNumber: json['player_number'] as dynamic,
        playerCountry: json['player_country'] as dynamic,
        playerType: json['player_type'] as String? ?? "Unknown",
        playerAge: json['player_age'] as dynamic,
        playerMatchPlayed: json['player_match_played'] as dynamic,
        playerGoals: json['player_goals'] as dynamic,
        playerYellowCards: json['player_yellow_cards'] as dynamic,
        playerRedCards: json['player_red_cards'] as dynamic,
        playerMinutes: json['player_minutes'] as dynamic,
        playerInjured: json['player_injured'] as String?,
        playerSubstituteOut: json['player_substitute_out'] as dynamic,
        playerSubstitutesOnBench:
            json['player_substitutes_on_bench'] as dynamic,
        playerAssists: json['player_assists'] as dynamic,
        playerIsCaptain: json['player_is_captain'] as String?,
        playerShotsTotal: json['player_shots_total'] as dynamic,
        playerGoalsConceded: json['player_goals_conceded'] as dynamic,
        playerFoulsCommited: json['player_fouls_commited'] as dynamic,
        playerTackles: json['player_tackles'] as dynamic,
        playerBlocks: json['player_blocks'] as dynamic,
        playerCrossesTotal: json['player_crosses_total'] as dynamic,
        playerInterceptions: json['player_interceptions'] as dynamic,
        playerClearances: json['player_clearances'] as dynamic,
        playerDispossesed: json['player_dispossesed'] as dynamic,
        playerSaves: json['player_saves'] as dynamic,
        playerInsideBoxSaves: json['player_inside_box_saves'] as dynamic,
        playerDuelsTotal: json['player_duels_total'] as dynamic,
        playerDuelsWon: json['player_duels_won'] as dynamic,
        playerDribbleAttempts: json['player_dribble_attempts'] as dynamic,
        playerDribbleSucc: json['player_dribble_succ'] as dynamic,
        playerPenComm: json['player_pen_comm'] as dynamic,
        playerPenWon: json['player_pen_won'] as dynamic,
        playerPenScored: json['player_pen_scored'] as dynamic,
        playerPenMissed: json['player_pen_missed'] as dynamic,
        playerPasses: json['player_passes'] as dynamic,
        playerPassesAccuracy: json['player_passes_accuracy'] as dynamic,
        playerKeyPasses: json['player_key_passes'] as dynamic,
        playerWoordworks: json['player_woordworks'] as dynamic,
        playerRating: json['player_rating'] as dynamic,
        teamName: json['team_name'] as String?,
        teamKey: json['team_key'] as int?,
        playerImage: json['player_image'] as dynamic ??
            "https://i0.wp.com/www.repol.copl.ulaval.ca/wp-content/uploads/2019/01/default-user-icon.jpg?ssl=1",
      );

  Map<String, dynamic> toJson() => {
        'player_key': playerKey,
        'player_name': playerName,
        'player_number': playerNumber,
        'player_country': playerCountry,
        'player_type': playerType,
        'player_age': playerAge,
        'player_match_played': playerMatchPlayed,
        'player_goals': playerGoals,
        'player_yellow_cards': playerYellowCards,
        'player_red_cards': playerRedCards,
        'player_minutes': playerMinutes,
        'player_injured': playerInjured,
        'player_substitute_out': playerSubstituteOut,
        'player_substitutes_on_bench': playerSubstitutesOnBench,
        'player_assists': playerAssists,
        'player_is_captain': playerIsCaptain,
        'player_shots_total': playerShotsTotal,
        'player_goals_conceded': playerGoalsConceded,
        'player_fouls_commited': playerFoulsCommited,
        'player_tackles': playerTackles,
        'player_blocks': playerBlocks,
        'player_crosses_total': playerCrossesTotal,
        'player_interceptions': playerInterceptions,
        'player_clearances': playerClearances,
        'player_dispossesed': playerDispossesed,
        'player_saves': playerSaves,
        'player_inside_box_saves': playerInsideBoxSaves,
        'player_duels_total': playerDuelsTotal,
        'player_duels_won': playerDuelsWon,
        'player_dribble_attempts': playerDribbleAttempts,
        'player_dribble_succ': playerDribbleSucc,
        'player_pen_comm': playerPenComm,
        'player_pen_won': playerPenWon,
        'player_pen_scored': playerPenScored,
        'player_pen_missed': playerPenMissed,
        'player_passes': playerPasses,
        'player_passes_accuracy': playerPassesAccuracy,
        'player_key_passes': playerKeyPasses,
        'player_woordworks': playerWoordworks,
        'player_rating': playerRating,
        'team_name': teamName,
        'team_key': teamKey,
        'player_image': playerImage,
      };
}
