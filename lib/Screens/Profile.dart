import 'package:flatmate/Screens/EditProfile.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String _name='Lakshay';
  String _email='lakshaygoel.200@gmail.com';
  String _phone='+91 83830-59964';
  String _gender='Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/user_image.jpg'),
                ),
              ),
              const SizedBox(height: 14.0),
              const Text(
                'ACCOUNT INFORMATION',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25.0),
              Info_Row(text: 'Name', textAns: _name,),
              const SizedBox(height: 25.0),

              Info_Row(text: 'Email', textAns: _email,),
              const SizedBox(height: 25.0),
              Info_Row(text: 'Phone', textAns: _phone,),
              const SizedBox(height: 25.0),
              Info_Row(text: 'Gender', textAns: _gender,),
              const SizedBox(height: 25.0),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Save the user profile data
          // You can perform your own logic here, such as sending the data to a server
          // or updating it in a local database
          Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()),);
        },
        label: const Text('Edit Profile'),
      ),
    );
  }
}

class Info_Row extends StatelessWidget {
  final String text;
  final String textAns;
  const Info_Row({
    Key? key, required this.text, required this.textAns,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          textAns,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    );
  }
}
