import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../Screens/data screens/countries_screen.dart';
import '../../constants/constants.dart';

class GridItem extends StatelessWidget {
  final String text;
  final String image;

  const GridItem({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (text != 'Football') {
          showDialog(
              context: context,
              builder: ((context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: kComponentsBackgroundColor,
                  title: const Text(
                    'Coming soon',
                    style: TextStyle(color: Colors.white),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'ok',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ))
                  ],
                );
              }));
        } else {
          Navigator.push(
              context,
              PageTransition(
                  child: const CountriesScreen(),
                  type: PageTransitionType.rightToLeft));
        }
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          boxShadow: const [BoxShadow(blurRadius: 3)],
          borderRadius: BorderRadius.circular(12),
          color: kComponentsBackgroundColor,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width * 0.32,
              ),
              const Spacer(),
              Text(
                text,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
