import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:school_application/analytics.dart';
import 'package:school_application/friends.dart';
import 'package:school_application/game_screen.dart';
import 'package:school_application/home_screen.dart';
import 'package:school_application/login.dart';
import 'package:school_application/recent_games.dart';
import 'package:school_application/settings.dart';
import 'package:school_application/user.dart';

class Sidebar extends StatefulWidget {
  Sidebar({super.key, User? user}) {
    this.user = user ?? User.getFromCurrent();
  }

  late User user;

  @override
  State<StatefulWidget> createState() => SidebarState();
}

class SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) => Drawer(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 50,
        children: [
          SizedBox(height: 30),
          Text('Welcome ${widget.user.name}!', style: TextStyle(fontSize: 26)),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (final BuildContext context) => HomeScreen(user: widget.user,),
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
                  builder: (final BuildContext context) => GameScreen(user: widget.user,),
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
                  builder: (final BuildContext context) => Friends(user: widget.user,),
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
                  builder: (final BuildContext context) => Analytics(user: widget.user,),
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
                  builder: (final BuildContext context) => RecentGames(user: widget.user,),
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

          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (final BuildContext context) => Login(),
                ),
              );
            },
            child: Row(
              spacing: 5,
              children: [
                Icon(Icons.logout),
                Text("SignOut"),
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
                        builder: (final BuildContext context) => Settings(user: widget.user,),
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
