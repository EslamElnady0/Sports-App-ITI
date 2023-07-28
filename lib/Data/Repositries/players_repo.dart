import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sports_app/Data/Models/players/players.dart';
import 'package:sports_app/constants/constants.dart';

class PlayersRepo {
  Future<Players?> getTeamPlayers(String teamId) async {
    try {
      http.Response response = await http.get(Uri.parse(
          "$baseUrl/football/?met=Players&teamId=$teamId&APIkey=$apiKey"));

      Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 200) {
        Players players = Players.fromJson(data);

        return players;
      } else {
        print("failed");
        return null;
      }
    } catch (e) {
      print("error : $e");
      return null;
    }
  }
}
