import 'package:flutter/material.dart';

import '../Data/Models/OnboardModel/onboard_model.dart';

const kBackgroundColor = Color(0xff1e2024);
const kComponentsBackgroundColor = Color(0xff21282d);
const kBlue = Color(0xff15b5e3);
const apiKey =
    "21194b2a2d9c7f4c46c6b3eeeccf366c2bf3a6bf3e5f9b6e68993db1291fc543";
const baseUrl = "https://apiv2.allsportsapi.com";

List<OnboardModel> screens = <OnboardModel>[
  OnboardModel(
    lottieBuilder: 'assets/images/111.json',
    text: "Welcome to Our Sports Application",
    desc:
        '"Always work hard, never give up, and fight until the end because it’s never really over until the whistle blows."',
    bg: kBackgroundColor,
    button: kComponentsBackgroundColor,
  ),
  OnboardModel(
    lottieBuilder: 'assets/images/333.json',
    text:
        "In our app , u can find stats about Players From all arround the world",
    desc:
        '"The ability to conquer one’s self is no doubt the most precious of all things that sports bestows"',
    bg: kBackgroundColor,
    button: kBlue,
  ),
  OnboardModel(
    lottieBuilder: 'assets/images/222.json',
    text: "Hope u enjoy our app :)",
    desc: '"It never gets easier, you just get better."',
    bg: kBackgroundColor,
    button: kBlue,
  ),
];

List<Map<String, String>> sportCategories = [
  {'text': "Football", 'image': "assets/images/football-svgrepo-com.png"},
  {'text': "Basketball", 'image': "assets/images/basket.png"},
  {'text': "Tennis", 'image': "assets/images/tennis-ball-svgrepo-com.png"},
  {'text': "Cricket", 'image': "assets/images/cricket-svgrepo-com.png"}
];
