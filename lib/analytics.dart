import 'package:flutter/material.dart';
import 'package:school_application/sidebar.dart';

class Analytics extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    drawer: Sidebar.get(context),
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            SizedBox(height: 15,),

            Center(child: Text("Analytics", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),)),
            
          ],
        ),
      ),
    ),
  );
}