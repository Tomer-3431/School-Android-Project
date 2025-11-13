import 'package:flutter/material.dart';
import 'package:school_application/analytics.dart';
import 'package:school_application/friends.dart';
import 'package:school_application/game_screen.dart';
import 'package:school_application/home_screen.dart';
import 'package:school_application/recent_games.dart';
import 'package:school_application/settings.dart';

class Sidebar extends Drawer {
  static Drawer get(BuildContext context) => Drawer(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 50,
        children: [
          SizedBox(height: 120),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (final BuildContext context) => HomeScreen(),
                ),
              );
            },
            child: Row(
              spacing: 5,
              children: [
                Icon(Icons.home),
                Text("Home"),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Icon(Icons.arrow_forward_ios)],
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (final BuildContext context) => GameScreen(),
                ),
              );
            },
            child: Row(
              spacing: 5,
              children: [
                Icon(Icons.videogame_asset),
                Text("Play a Game"),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Icon(Icons.arrow_forward_ios)],
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (final BuildContext context) => Friends(),
                ),
              );
            },
            child: Row(
              spacing: 5,
              children: [
                Icon(Icons.account_box_rounded),
                Text("Friends"),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Icon(Icons.arrow_forward_ios)],
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (final BuildContext context) => Analytics(),
                ),
              );
            },
            child: Row(
              spacing: 5,
              children: [
                Icon(Icons.analytics_rounded),
                Text("Analytics"),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Icon(Icons.arrow_forward_ios)],
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (final BuildContext context) => RecentGames(),
                ),
              );
            },
            child: Row(
              spacing: 5,
              children: [
                Icon(Icons.history),
                Text("Latest Games"),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Icon(Icons.arrow_forward_ios)],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (final BuildContext context) => Settings(),
                      ),
                    );
                  },
                  
                  child: Row(
                    spacing: 5,
                    children: [
                      Icon(Icons.settings),
                      Text("Settings"),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Icon(Icons.arrow_forward_ios)],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 1),
        ],
      ),
    ),
  );
}
