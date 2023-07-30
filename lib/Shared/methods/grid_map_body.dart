import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

AnimationConfiguration gridMapBody(
    int index, BuildContext context, Widget child) {
  return AnimationConfiguration.staggeredGrid(
    columnCount: 3,
    duration: const Duration(milliseconds: 1500),
    position: index,
    child: FadeInAnimation(
      curve: Curves.easeIn,
      child: SlideAnimation(
          duration: const Duration(milliseconds: 900),
          horizontalOffset: MediaQuery.of(context).size.width,
          verticalOffset: MediaQuery.of(context).size.height,
          child: child),
    ),
  );
}
