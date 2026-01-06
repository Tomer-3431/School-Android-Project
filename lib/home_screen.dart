import 'package:dot_cast/dot_cast.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_application/sidebar.dart';
import 'package:school_application/user.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, User? user}) {
    this.user = user ?? User.getFromCurrent();
  }

  late User user;

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    drawer: Sidebar(user: widget.user,),
    body: Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 10,
            children: [
              CircleAvatar(),
              Text(
                widget.user.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(widget.user.elo.toString(), style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 20,
            children: [
              Icon(Icons.emoji_events, color: Colors.orange, size: 80),
              Text("You Won: ${widget.user.gameList.length} games \nthis month"),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 20,
            children: [
              Icon(Icons.military_tech, color: Colors.grey.shade400, size: 80),
              Text("You rank #${widget.user.rank} in the world"),
            ],
          ),

          SizedBox(height: 20),

          Divider(),

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(onPressed: () {}, child: Text("Play Bot")),
              ElevatedButton(
                onPressed: () {},
                child: Text("Played Preffered\nSettings"),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(onPressed: () {}, child: Text("Play Local")),
              ElevatedButton(
                onPressed: () {},
                child: Text("Search Online\nFriends"),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("Analyze Latest\nGame"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Analyze New\nGame"),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
