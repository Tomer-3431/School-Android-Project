import 'dart:math';

import 'package:flutter/material.dart';
import 'package:school_application/sidebar.dart';

class RecentGames extends StatelessWidget {
  Random random = Random();

  RecentGames({super.key}) {
    random = Random();
  }

  Widget getStatus() {
    int randInt = random.nextInt(3);

    switch (randInt) {
      case 0:
        return Tooltip(
          message: "Win",
          child: Icon(Icons.emoji_events, color: Colors.green),
        );
      case 1:
        return Tooltip(
          message: "Lose",
          child: Icon(Icons.thumb_down, color: Colors.red),
        );
      case 2:
        return Tooltip(
          message: "Tie",
          child: Icon(Icons.handshake, color: Colors.grey),
        );
      default:
        return Tooltip(
          message: "Tie",
          child: Icon(Icons.handshake, color: Colors.grey),
        );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    drawer: Sidebar.get(context),
    body: Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(50, 20, 50, 5),
          child: Text(
            "Recent Games",
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        
        Container(
          margin: EdgeInsets.fromLTRB(50, 5, 50, 20),
          color: Colors.grey,
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              label: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Search In Recent Games"), Icon(Icons.search_sharp)],
                ),
              ),
            ),
          ),
        ),
        Divider(),
        Flexible(
          child: ListView.separated(
            itemCount: 20,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),

            itemBuilder: (context, index) => Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Game Number ${index + 1}",
                  style: TextStyle(fontSize: 16),
                ),
                getStatus(),
              ],
            ),
            separatorBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Divider(),
              );
            },
          ),
        ),
      ],
    ),
  );
}