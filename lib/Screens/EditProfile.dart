import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late String _name;
  late String _email;
  late String _phone;
  String? _gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios_new,color: Colors.grey,),
        ),
        title: const Text(
          '𝑅𝑜𝑜𝓂𝒾𝑒𝓈',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
      const         Center(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/user_image.jpg'),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Name:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Email:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Phone:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your phone number',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _phone = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Gender:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              DropdownButtonFormField<String>(
                value: _gender,
                items: [
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Save the user profile data
          // You can perform your own logic here, such as sending the data to a server
          // or updating it in a local database
          print('Name: $_name');
          print('Email: $_email');
          print('Phone: $_phone');
          print('Gender: $_gender');
        },
        label: Text('Save Profile'),
      ),
    );
  }
}
