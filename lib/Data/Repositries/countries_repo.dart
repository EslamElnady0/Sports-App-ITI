import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sports_app/Data/Models/Data%20Models/Countries/countries.dart';
import 'package:sports_app/constants/constants.dart';

class CountriesRepo {
  Future<Countries?> getCountries() async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://apiv2.allsportsapi.com/football/?met=Countries&APIkey=$apiKey"));

      Map<String, dynamic> data = json.decode(response.body);

      if (response.statusCode == 200) {
        Countries countries = Countries.fromJson(data);
        return countries;
      } else {
        debugPrint("request failed");
        return null;
      }
    } catch (error) {
      debugPrint("error :${error.toString()}");
      return null;
    }
  }
}
