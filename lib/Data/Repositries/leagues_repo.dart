import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sports_app/Data/Models/Data%20Models/Leagues/leagues.dart';
import 'package:http/http.dart' as http;
import 'package:sports_app/constants/constants.dart';

class LeaguesRepo {
  Future<Leagues?> getAllLeagues(String countryId) async {
    try {
      http.Response response = await http.get(Uri.parse(
          "$baseUrl/football/?met=Leagues&APIkey=$apiKey&countryId=$countryId"));

      Map<String, dynamic> data = json.decode(response.body);

      if (response.statusCode == 200) {
        Leagues leagues = Leagues.fromJson(data);
        return leagues;
      } else {
        print("request failed");
        return null;
      }
    } catch (error) {
      debugPrint("error : $error");
      return null;
    }
  }
}
