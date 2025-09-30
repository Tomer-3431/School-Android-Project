import 'package:flutter/material.dart';
import 'package:school_application/sidebar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    drawer: Sidebar.get(context),
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
                "{Player Name}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("{Player ELO}", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(
            height: 15,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 20,
            children: [
              Icon(Icons.emoji_events, color: Colors.orange, size: 80,),
              Text("You Won: 50 games \nthis month")
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 20,
            children: [
              Icon(Icons.military_tech, color: Colors.grey.shade400, size: 80,),
              Text("You rank #50 in the world")
            ],
          ),

          SizedBox(
            height: 20,
          ),

          Divider(),
          
          SizedBox(
            height: 20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(onPressed: () {}, child: Text("Play Bot")),
              ElevatedButton(onPressed: () {}, child: Text("Played Preffered\nSettings"),)
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(onPressed: () {}, child: Text("Play Local")),
              ElevatedButton(onPressed: () {}, child: Text("Search Online\nFriends"),)
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(onPressed: () {}, child: Text("Analyze Latest\nGame")),
              ElevatedButton(onPressed: () {}, child: Text("Analyze New\nGame"),)
            ],
          ),
        ],
      ),
    ),
  );
}
