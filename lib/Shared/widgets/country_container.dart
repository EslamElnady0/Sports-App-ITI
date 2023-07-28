import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../Data/Models/Countries/result.dart';
import '../../Screens/leagues_screen.dart';
import '../../constants/constants.dart';

class CountryContainer extends StatelessWidget {
  final Result result;
  final String countryId;
  final String countryName;

  const CountryContainer(
      {super.key,
      required this.result,
      required this.countryId,
      required this.countryName});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: LeaguesScreen(
                    countryLogo: result.countryLogo!,
                    countryId: countryId,
                    countryName: countryName),
                type: PageTransitionType.rightToLeft));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: componentsBackgroundColor,
            boxShadow: const [BoxShadow(blurRadius: 5)]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: 10),
          child: Column(
            children: [
              Image.network(
                result.countryLogo!,
                fit: BoxFit.fill,
                height: height * 0.07,
                width: width * 0.4,
              ),
              const Spacer(),
              Text(
                result.countryName!,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
