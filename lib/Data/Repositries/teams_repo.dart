import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sports_app/Data/Models/teams/teams.dart';
import 'package:sports_app/constants/constants.dart';

class TeamsRepo {
  Future<Teams?> getAllTeams(String leagueId) async {
    try {
      http.Response response = await http.get(Uri.parse(
          "$baseUrl/football/?met=Teams&APIkey=$apiKey&leagueId=$leagueId"));

      Map<String, dynamic> data = json.decode(response.body);

      if (response.statusCode == 200) {
        Teams teams = Teams.fromJson(data);
        return teams;
      } else {
        print("request failed");

        return null;
      }
    } catch (error) {
      print("error : $error");
      return null;
    }
  }
}
