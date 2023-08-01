import 'package:flutter/material.dart';

import '../../Data/Models/Data Models/players/result.dart';
import '../../constants/constants.dart';

Future<dynamic> playerDialog(
    BuildContext context, List<Result> playerList, int index) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "OK",
                  style: TextStyle(color: Colors.white),
                ))
          ],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              CircleAvatar(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    playerList[index].playerImage,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(
                          "https://i0.wp.com/www.repol.copl.ulaval.ca/wp-content/uploads/2019/01/default-user-icon.jpg?ssl=1");
                    },
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.04,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.37,
                child: Text(
                  playerList[index].playerName!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              FittedBox(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white)),
                  child: Text(
                    (playerList[index].playerNumber == ''
                            ? "non"
                            : playerList[index].playerNumber) ??
                        "non",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "From : ${playerList[index].playerCountry == '' ? "Unknown" : playerList[index].playerCountry ?? "Unknown"}",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Position : ${playerList[index].playerType == '' ? "Unknown" : playerList[index].playerType ?? "UnKnown"}",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Age : ${playerList[index].playerAge == '' ? "Unknown" : playerList[index].playerAge ?? "UnKnown"}",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Yellow Cards : ${playerList[index].playerYellowCards == '' ? "Unknown" : playerList[index].playerYellowCards ?? "UnKnown"}",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Red Cards : ${playerList[index].playerRedCards == '' ? "Unknown" : playerList[index].playerRedCards ?? "UnKnown"}",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Goals : ${playerList[index].playerGoals == '' ? "Unknown" : playerList[index].playerGoals ?? "UnKnown"}",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Assists : ${playerList[index].playerAssists == '' ? "Unknown" : playerList[index].playerAssists ?? "UnKnown"}",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: kComponentsBackgroundColor,
        );
      });
}
