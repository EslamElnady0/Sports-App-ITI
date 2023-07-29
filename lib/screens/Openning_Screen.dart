// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sports_app/const.dart';






class FourGridExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Text('Four Grid Example',style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        body: GridView.count(
          padding: EdgeInsets.all(4),
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5, // Number of columns
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 3)],
                borderRadius: BorderRadius.circular(12),
                color:componentsBackgroundColor ,
              ),
              child: GridItem(
                text: 'Football',
                image: AssetImage('lib/assets/football-svgrepo-com.png'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 3)],
                color:componentsBackgroundColor ,
                borderRadius: BorderRadius.circular(12)
              ),
              child: GridItem(
                text: 'Basketball',
                image: AssetImage('lib/assets/basket.png'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 3)],
                color:componentsBackgroundColor ,
                borderRadius: BorderRadius.circular(12)
              ),
              child: GridItem(
                text: 'Tennis',
                image: AssetImage('lib/assets/tennis-ball-svgrepo-com.png'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 3)],
                color:componentsBackgroundColor ,
                borderRadius: BorderRadius.circular(12)
              ),
              child: GridItem(
                text: 'Cricket',
                image: AssetImage('lib/assets/cricket-svgrepo-com.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String text;
  final ImageProvider image;

  const GridItem({required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(text != 'Football'){
          showDialog(context: context,
         builder: ( (context) {
          return Container(
            child: AlertDialog(
              backgroundColor: componentsBackgroundColor,
              title: Text('Coming soon'),
              actions: [
                TextButton(onPressed: (){
                 Navigator.of(context).pop();
                }, child: Text('close',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),))
              ],
              ),
          );
        }));
        }
        else{
          //navigation HERE!!
        }

        // Dismiss the alert box
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image(
              image: image,
              width: 200.0,
              height: 200.0,
            ),
            SizedBox(height: 8.0),
            Text(text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
          ],
        ),
      ),
    );
  }
}

