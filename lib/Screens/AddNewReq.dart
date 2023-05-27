import 'package:flatmate/Screens/NewReq.dart';
import 'package:flutter/material.dart';

class AddNew extends StatelessWidget {
  const AddNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
            Add_Req(txt: "You have a place",NewRe: NewReq(),),
            Add_Req(txt: "You need a place",NewRe: NewReq(),),
          ],
        ),
      ),
    );
  }
}

class Add_Req extends StatelessWidget {
  final String txt;
  final Widget NewRe;
  const Add_Req({
    Key? key, required this.txt, required this.NewRe,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewRe),);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white24,
        ),
        height: MediaQuery.of(context).size.height/3,
        child: Center(
          child: Text(
            txt,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
