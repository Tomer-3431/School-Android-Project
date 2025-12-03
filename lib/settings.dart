import 'package:flutter/material.dart';
import 'package:school_application/sidebar.dart';
import 'package:school_application/user.dart';

class Settings extends StatefulWidget {

  Settings({super.key, User? user}) {
    this.user = user ?? User.getFromCurrent();
  }

  late User user;

  @override
  State<StatefulWidget> createState() => SettingsState();
}
class SettingsState extends State<Settings> {

  bool value = false;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    drawer: Sidebar(user: widget.user,),
    body: Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(50, 20, 50, 20),
          child: Text(
            "Settings",
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Which mode would you like ot be on?"),
            SizedBox(width: 50),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Change Between Dark and Light Mode"),
                          Switch(
                            value: value,
                            onChanged: (value) {
                              this.value = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Text("Click Me"),
            ),
          ],
        ),
      ],
    ),
  );
}
