import 'package:flutter/material.dart';
import 'package:school_application/sidebar.dart';

class Friends extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    drawer: Sidebar.get(context),
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            SizedBox(height: 25),
            Container(
              color: Colors.grey,
              child: Center(
                child: Text("Search Friends"),
              ),
            ),
            Text("Online", style: TextStyle(fontSize: 20),),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(),
                Text("Person Name - {ELO} - {Rank}", style: TextStyle(fontSize: 16),)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(),
                Text("Person Name - {ELO} - {Rank}", style: TextStyle(fontSize: 16),)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(),
                Text("Person Name - {ELO} - {Rank}", style: TextStyle(fontSize: 16),)
              ],
            ),
            SizedBox(
              height: 10,
            ),
      
            Divider(),
      
            Text("In Game", style: TextStyle(fontSize: 20),),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(),
                Text("Person Name - {ELO} - {Rank}", style: TextStyle(fontSize: 16),)
              ],
            ),
            SizedBox(
              height: 10,
            ),
      
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(),
                Text("Person Name - {ELO} - {Rank}", style: TextStyle(fontSize: 16),)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(),
                Text("Person Name - {ELO} - {Rank}", style: TextStyle(fontSize: 16),)
              ],
            ),
            SizedBox(
              height: 10,
            ),
      
            Divider(),
      
            Text("Offline", style: TextStyle(fontSize: 20),),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(),
                Text("Person Name - {ELO} - {Rank}", style: TextStyle(fontSize: 16),)
              ],
            ),
            SizedBox(
              height: 10,
            ),
      
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(),
                Text("Person Name - {ELO} - {Rank}", style: TextStyle(fontSize: 16),)
              ],
            ),
            SizedBox(
              height: 10,
            ),
      
          ],
        ),
      ),
    ),
  );
}