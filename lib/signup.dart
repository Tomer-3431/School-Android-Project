import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:school_application/home_screen.dart';
import 'package:school_application/login.dart';

class Signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignupState();
}

class SignupState extends State<Signup> {
  bool tosValue = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn.instance
        .authenticate();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

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
                  TextField(controller: nameController),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email", style: TextStyle(color: Colors.red)),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Password", style: TextStyle(color: Colors.red)),
                  TextField(obscureText: true, controller: passwordController),
                ],
              ),

              SizedBox(height: 15),

              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       "Or Sign up using Google",
              //       style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              //     ),

              //     GoogleSignIn.instance.supportsAuthenticate()
              //         ? ElevatedButton(
              //             onPressed: () async {
              //               try {
              //                 var user = await signInWithGoogle();
              //                 print(user);
              //               } catch (e) {
              //                 print(e.toString());
              //               }
              //             },
              //             child: const Text("SIGN IN"),
              //           )
              //         : Container(),
              //   ],
              // ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    value: tosValue,
                    onChanged: (value) {
                      setState(() {
                        tosValue = value ?? false;
                      });
                    },
                  ),
                  Text("I agree to the TOS and Privacy Policy"),
                ],
              ),

              ElevatedButton(
                onPressed: () async {
                  if (tosValue) {
                    try {
                      final creds = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                      creds.user!.updateDisplayName(nameController.text);
                      DatabaseReference ref = FirebaseDatabase.instance.ref("users/${creds.user!.uid}");
                      await ref.set({
                        "name": nameController.text,
                        "elo": 0,
                        "games": [],
                        'rank': 1,
                      });

                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'email-already-in-use') {
                        print('Account with the same email is already in use');
                      }
                    } catch (e) {
                      print(e);
                    }

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  enableFeedback: tosValue,
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (final BuildContext context) => Login(),
                        ),
                      );
                    },
                    child: Text("Sign In", style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
