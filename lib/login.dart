import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:school_application/home_screen.dart';
import 'package:school_application/signup.dart';
import 'package:school_application/user.dart';

class Login extends StatefulWidget {
  
  const Login({super.key});
  
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
  }

  Future<UserCredential> signInWithGoogle() async {
    GoogleSignIn.instance.initialize(
      clientId: 'remmikub-school-project',
      serverClientId: 'remmikub-school-project'
    );

    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn.instance.authenticate();

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
  Widget build(BuildContext context) => StreamBuilder(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Text("Loading...");
      }
      if (snapshot.hasData) {
        final user = snapshot.data!;
        return HomeScreen(user: User.getFromUid(uid: user.uid),);

      }
      
      return Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Column(
            children: [
              SizedBox(height: 150),
      
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
                      TextField(controller: emailController, keyboardType: TextInputType.emailAddress),
                    ],
                  ),
      
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Password", style: TextStyle(color: Colors.red)),
                      TextField(controller: passwordController, obscureText: true),
                    ],
                  ),
                  
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   spacing: 2,
                  //   children: [
                  //     Text(
                  //       "Or Sign up using Google",
                  //       style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  //     ),

                  //     GoogleSignIn.instance.supportsAuthenticate() 
                  //     ? ElevatedButton(
                  //         onPressed: () async {
                  //           try {
                  //             var user = await signInWithGoogle();
                  //             print(user);
                  //           } on GoogleSignInException catch (e) {
                  //             print(e.code);
                  //           } catch (e) {
                  //             print(e.toString());
                  //           }
                  //         },
                  //         child: const Text("SIGN IN"),
                  //       )
                  //     : Container(),
                  //   ],
                  // ),
      
                  SizedBox(height: 15),
      
                  ElevatedButton(
                    onPressed: () async {

                      if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                        try {
                          final user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (final BuildContext context) => HomeScreen(user: User.getFromCurrent()),
                            ),
                          );
                        } on FirebaseAuthException catch(e) {
                          print('error: ${e.code}');
                        } catch (e) {
                          print(e);
                        }
                      }
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
                          builder: (final BuildContext context) => HomeScreen(user: User.getFromUid(uid: '0')),
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
  );
}
