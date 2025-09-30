import 'package:flutter/material.dart';
import 'package:school_application/home_screen.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: Column(
        children: [
          SizedBox(height: 100),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 15),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name", style: TextStyle(color: Colors.red)),
                  TextField(),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  Text("I agree to the TOS and Privacy Policy"),
                ],
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(1000, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8),
                  ),
                  backgroundColor: Colors.deepOrange,
                ),

                child: Text("Continue ", style: TextStyle(color: Colors.white)),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have an Account?  ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text("Sign In", style: TextStyle(color: Colors.red)),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
