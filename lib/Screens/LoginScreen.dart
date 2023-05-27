import 'package:flatmate/Screens/SignUp.dart';
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

  @override
  Widget build(BuildContext context) {
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
              Text('𝑅𝑜𝑜𝓂𝒾𝑒𝓈',style: TextStyle(
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
                onTap: (){

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
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),),);
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
}

