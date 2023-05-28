import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flatmate/Screens/SignUp.dart';
import 'package:flatmate/Screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flatmate/widgets/textFieldInput.dart';
import 'package:flatmate/utils/colors.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);


  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  TextEditingController _emailEditingController = TextEditingController();

  TextEditingController _passwordEditingController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailEditingController.text,
          password: _passwordEditingController.text,
      );
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomeScreen(),),);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text("${snapshot.error}")),
          );
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(child: Container(), flex: 2),
                    Text('𝑅𝑜𝑜𝓂𝒾𝑒𝓈', style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                    const SizedBox(
                      height: 64,
                    ),
                    TextFieldInput(
                      textEditingController: _emailEditingController,
                      textInputType: TextInputType.emailAddress,
                      hintText: 'Enter Your Email',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFieldInput(
                      textEditingController: _passwordEditingController,
                      textInputType: TextInputType.emailAddress,
                      isPass: true,
                      hintText: 'Enter Your Password',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      onTap: () async {
                        await signInWithEmailAndPassword();
                      },

                      child: Container(
                        child: const Text('Log In'),
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          color: blueColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Flexible(child: Container(), flex: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text("Don't have an account?"),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: Container(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
        else{
          return Center(child: Text('No Connection'));
        }
      }
    );
  }
}

