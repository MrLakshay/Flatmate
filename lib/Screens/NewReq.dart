import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/colors.dart';
import '../utils/imagepicker.dart';
import '../widgets/textFieldInput.dart';

class NewReq extends StatefulWidget {
  const NewReq({Key? key}) : super(key: key);

  @override
  State<NewReq> createState() => _NewReq();
}

class _NewReq extends State<NewReq> {
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();
  TextEditingController _bioEditingController = TextEditingController();
  TextEditingController _usernameEditingController = TextEditingController();
  Uint8List? _image;
  bool isLoading=false;

  @override
  void dispose() {
    // TODO: implement dispose
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 2),
              Text(
                '𝑅𝑜𝑜𝓂𝒾𝑒𝓈',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                ),
              ),
              const SizedBox(
                height: 24,
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
                        // selectImage();
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
                hintText: 'Enter Your Place',
              ),
              Container(
                margin: EdgeInsets.only(top: 10,bottom: 10),
                height: 60.0,
                child: new ListView(
                  scrollDirection: Axis.horizontal,
                  children: new List.generate(5, (int index) {
                    return Card(
                      color: Colors.white54,
                      child: new Container(
                        width: 80.0,
                        height: 60.0,
                        child: Center(child: Text("${index+1} BHK",style: TextStyle(color: Colors.black),)),
                      ),
                    );
                  }),
                ),
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
                hintText: 'Enter Your Phone Number',
              ),
              const SizedBox(
                height: 24,
              ),

              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  child: isLoading==true? const CircularProgressIndicator(
                    color:primaryColor,

                  ):
                  const Text('Post'),
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
                    child: Text("Do not have a place?"),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: (){
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),),);
                    },
                    child: Container(
                      child: Text(
                        "Post Requirement",
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