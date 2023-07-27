import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sports_app/Data/Models/Top%20Scorers/top_scorers.dart';
import 'package:sports_app/constants/constants.dart';

class TopScorersRepo {
  Future<TopScorers?> getTopScorers(String leagueId) async {
    try {
      http.Response response = await http.get(Uri.parse(
          "$baseUrl/football/?met=Topscorers&APIkey=$apiKey&leagueId=$leagueId"));

      Map<String, dynamic> data = json.decode(response.body);

      if (response.statusCode == 200) {
        TopScorers topScorers = TopScorers.fromJson(data);
        return topScorers;
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
