import 'package:flutter/material.dart';
import 'package:school_application/sidebar.dart';
import 'package:school_application/user.dart';

class GameScreen extends StatefulWidget {

  GameScreen({super.key, User? user}) {
    this.user = user ?? User.getFromCurrent();
  }

  late User user;

  @override
  State<StatefulWidget> createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    drawer: Sidebar(user: widget.user),
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            SizedBox(height: 15),
            Center(
              child: Text(
                "${widget.user.name}'s Room",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Center(child: Text("מפת המשחק")),
            ),
            SizedBox(height: 20),
            Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Center(child: Text("אריכי השחקן")),
            ),

            SizedBox(
              height: 100,
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(backgroundColor: Colors.red,),
                        CircleAvatar(),
                        CircleAvatar(),
                        CircleAvatar(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    ),
  );
}
