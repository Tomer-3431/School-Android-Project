import 'package:flutter/material.dart';
import 'package:school_application/home_screen.dart';
import 'package:school_application/signup.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: Column(
        children: [
          SizedBox(height: 200),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Text(
                "Sign In",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              Text(
                "Hi there! Nice to see you again.",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),

              SizedBox(height: 15),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text("Email", style: TextStyle(color: Colors.red)),
                  TextField(keyboardType: TextInputType.emailAddress),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Password", style: TextStyle(color: Colors.red)),
                  TextField(obscureText: true),
                ],
              ),

              SizedBox(height: 15),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (final BuildContext context) => HomeScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(1000, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8),
                  ),
                  backgroundColor: Colors.deepOrange,
                ),

                child: Text("Sign In", style: TextStyle(color: Colors.white)),
              ),

              Text("Forgot Password?", style: TextStyle(color: Colors.grey)),

              SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (final BuildContext context) => Signup(),
                    ),
                  );
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ),

              SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (final BuildContext context) => Signup(),
                    ),
                  );
                },
                child: Text("Enter as a guest"),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
