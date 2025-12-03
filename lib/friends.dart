import 'dart:math';

import 'package:flutter/material.dart';
import 'package:school_application/sidebar.dart';
import 'package:school_application/user.dart';

class Friends extends StatefulWidget {

  Friends({super.key, User? user}) {
    this.user = user ?? User.getFromCurrent();
  }

  late User user;
  Random random = Random();

  @override
  State<StatefulWidget> createState() => FriendsState();
}

class FriendsState extends State<Friends> {

  Widget getStatus() {
    int randInt = widget.random.nextInt(4);
    switch (randInt) {
      case 0:
        return Tooltip(
          message: "Online",
          child: Icon(Icons.fiber_manual_record, color: Colors.green),
        );
      case 1:
        return Tooltip(
          message: "Do Not Distub",
          child: Icon(Icons.do_not_disturb, color: Colors.red),
        );
      case 2:
        return Tooltip(
          message: "Offline",
          child: Icon(Icons.circle, color: Colors.grey),
        );
      case 3:
        return Tooltip(
          message: "Idle",
          child: Icon(Icons.access_alarm_outlined, color: Colors.amber),
        );
      default:
        return Tooltip(
          message: "Offline",
          child: Icon(Icons.circle, color: Colors.grey),
        );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    drawer: Sidebar(user: widget.user,),
    body: Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(50, 20, 50, 5),
          child: Text(
            "Friend List",
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
                  children: [Text("Search Friends"), Icon(Icons.search_sharp)],
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
                CircleAvatar(),
                Text(
                  "Person Name - {ELO} - ${index + 1}",
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

    // body: SingleChildScrollView(
    //   scrollDirection: Axis.vertical,
    //   child: Container(
    //     padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       spacing: 10,
    //       children: [
    //         SizedBox(height: 25),
    //         Container(
    //           color: Colors.grey,
    //           child: Center(child: Text("Search Friends")),
    //         ),
    //         Text("Online", style: TextStyle(fontSize: 20)),
    //         Row(
    //           spacing: 10,
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             CircleAvatar(),
    //             Text(
    //               "Person Name - {ELO} - {Rank}",
    //               style: TextStyle(fontSize: 16),
    //             ),
    //           ],
    //         ),
    //         SizedBox(height: 10),
    //         Row(
    //           spacing: 10,
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             CircleAvatar(),
    //             Text(
    //               "Person Name - {ELO} - {Rank}",
    //               style: TextStyle(fontSize: 16),
    //             ),
    //           ],
    //         ),
    //         SizedBox(height: 10),
    //         Row(
    //           spacing: 10,
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             CircleAvatar(),
    //             Text(
    //               "Person Name - {ELO} - {Rank}",
    //               style: TextStyle(fontSize: 16),
    //             ),
    //           ],
    //         ),
    //         SizedBox(height: 10),

    //         Divider(),

    //         Text("In Game", style: TextStyle(fontSize: 20)),
    //         Row(
    //           spacing: 10,
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             CircleAvatar(),
    //             Text(
    //               "Person Name - {ELO} - {Rank}",
    //               style: TextStyle(fontSize: 16),
    //             ),
    //           ],
    //         ),
    //         SizedBox(height: 10),

    //         Row(
    //           spacing: 10,
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             CircleAvatar(),
    //             Text(
    //               "Person Name - {ELO} - {Rank}",
    //               style: TextStyle(fontSize: 16),
    //             ),
    //           ],
    //         ),
    //         SizedBox(height: 10),
    //         Row(
    //           spacing: 10,
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             CircleAvatar(),
    //             Text(
    //               "Person Name - {ELO} - {Rank}",
    //               style: TextStyle(fontSize: 16),
    //             ),
    //           ],
    //         ),
    //         SizedBox(height: 10),

    //         Divider(),

    //         Text("Offline", style: TextStyle(fontSize: 20)),
    //         Row(
    //           spacing: 10,
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             CircleAvatar(),
    //             Text(
    //               "Person Name - {ELO} - {Rank}",
    //               style: TextStyle(fontSize: 16),
    //             ),
    //           ],
    //         ),
    //         SizedBox(height: 10),

    //         Row(
    //           spacing: 10,
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             CircleAvatar(),
    //             Text(
    //               "Person Name - {ELO} - {Rank}",
    //               style: TextStyle(fontSize: 16),
    //             ),
    //           ],
    //         ),
    //         SizedBox(height: 10),
    //       ],
    //     ),
    //   ),
    // ),
  );
}
