import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class CustomContainer extends StatelessWidget {
  final String trailing;
  final String playerName;
  final String leading;
  final Widget? subtitle;

  final VoidCallback onTap;
  const CustomContainer(
      {super.key,
      this.subtitle,
      required this.onTap,
      required this.trailing,
      required this.playerName,
      required this.leading});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(blurRadius: 3)],
          color: componentsBackgroundColor),
      child: ListTile(
        onTap: onTap,
        subtitle: subtitle,
        trailing: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Text(
            trailing,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        leading: CircleAvatar(
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
              leading,
              errorBuilder: (context, error, stackTrace) {
                return Image.network(
                    "https://i0.wp.com/www.repol.copl.ulaval.ca/wp-content/uploads/2019/01/default-user-icon.jpg?ssl=1");
              },
            ),
          ),
        ),
        title: Text(
          playerName,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
