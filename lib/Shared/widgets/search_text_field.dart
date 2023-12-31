import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class SearchTextField extends StatelessWidget {
  final String query;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Widget? suffixIcon;

  const SearchTextField({
    this.controller,
    this.suffixIcon,
    required this.query,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(blurRadius: 3)]),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: "Search for a $query..",
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: kComponentsBackgroundColor,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
