import 'dart:typed_data';

import 'package:flatmate/Screens/LoginScreen.dart';
import 'package:flatmate/Screens/homeScreen.dart';
import 'package:flatmate/widgets/textFieldInput.dart';
import 'package:flutter/material.dart';
import 'package:flatmate/utils/colors.dart';
import 'package:flatmate/utils/imagepicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();
  TextEditingController _bioEditingController = TextEditingController();
  TextEditingController _usernameEditingController = TextEditingController();
  Uint8List? _image;
  bool isLoading=false;

  @override
  void dispose() {
    super.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    _bioEditingController.dispose();
    _usernameEditingController.dispose();
  }

  void selectImage() async {
    Uint8List im=await pickImage(ImageSource.gallery);
    // print(im);
    setState(() {
      _image = im;
    });
  }
  Future<void> createUserWithEmailAndPassword() async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailEditingController.text,
        password: _passwordEditingController.text,
      );
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      print('$e');
    }
  }
  @override
  Widget build(BuildContext context) {
    String _gender='Male';
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
              const Text('𝑅𝑜𝑜𝓂𝒾𝑒𝓈',style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
              const SizedBox(
                height: 64,
              ),
              Stack(
                children: [
                  _image != null ? CircleAvatar(
                      radius: 64, backgroundImage: MemoryImage(_image!)
                  ):CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/564x/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg'),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {
                        selectImage();
                      },
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                textEditingController: _usernameEditingController,
                textInputType: TextInputType.text,
                hintText: 'Enter Your Name',
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                textEditingController: _bioEditingController,
                textInputType: TextInputType.text,
                hintText: 'Enter Your Bio',
              ),
              const SizedBox(
                height: 24,
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
              DropdownButtonFormField<String>(
                value: _gender,
                items: const [
                  DropdownMenuItem<String>(
                    value: 'Male',
                    child: Text('Male'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Female',
                    child: Text('Female'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap:() async
                  {
                    setState(() {
                      isLoading=true;
                    });
                    await createUserWithEmailAndPassword();
                    setState(() {
                      isLoading=false;
                    });
                  },
                  child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  color: blueColor,
                  ),
                  child: isLoading==true? const CircularProgressIndicator(
                  color:primaryColor,

                  ):
                  const Text('Sign Up'),
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
                    child: Text("Already have an account?"),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Welcome(),),);
                    },
                    child: Container(
                      child: Text(
                        "Login",
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
