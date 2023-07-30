import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../constants/constants.dart';

class GridContainer extends StatelessWidget {
  final Widget nextScreen;
  final double imageWidth, imageHeight;
  final String name;
  final String logo;

  const GridContainer({
    required this.name,
    required this.logo,
    required this.nextScreen,
    required this.imageHeight,
    required this.imageWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(context,
            PageTransition(child: nextScreen, type: PageTransitionType.fade));
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
                logo,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    "https://www.seekpng.com/png/full/28-289657_espn-soccer-team-logo-default.png",
                    height: imageHeight,
                    width: imageWidth,
                  );
                },
                height: imageHeight,
                width: imageWidth,
              ),
              const Spacer(),
              Center(
                child: FittedBox(
                  child: Text(
                    name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
