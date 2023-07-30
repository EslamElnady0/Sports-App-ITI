import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class CustomListContainer extends StatelessWidget {
  final String? trailing;
  final String playerName;
  final String leading;
  final Widget? subtitle;

  final VoidCallback onTap;
  const CustomListContainer(
      {super.key,
      this.subtitle,
      required this.onTap,
      this.trailing,
      required this.playerName,
      required this.leading});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(blurRadius: 3)],
          color: kComponentsBackgroundColor),
      child: ListTile(
        onTap: onTap,
        subtitle: subtitle,
        trailing: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Text(
            trailing ?? '',
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        leading: CircleAvatar(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.14,
            width: MediaQuery.of(context).size.width * 0.14,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
              leading,
              fit: BoxFit.cover,
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
