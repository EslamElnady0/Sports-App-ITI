import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  const CustomButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
        decoration: BoxDecoration(
            boxShadow: const [BoxShadow(blurRadius: 3)],
            color: kBlue,
            borderRadius: BorderRadius.circular(15.0)),
        child: const Row(mainAxisSize: MainAxisSize.min, children: [
          Text(
            "Skip",
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          SizedBox(
            width: 15.0,
          ),
          Icon(
            Icons.arrow_forward_sharp,
            color: Colors.white,
          )
        ]),
      ),
    );
  }
}
