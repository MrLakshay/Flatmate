import 'package:flutter/material.dart';
import 'package:flatmate/custom_button.dart';

class AcceptBottomNavigation extends StatelessWidget {
  final VoidCallback? onApply;

  const AcceptBottomNavigation({this.onApply});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: OpenFlutterButton(
              title: 'Discard',
              onPressed: () {
                Navigator.of(context).pop();
              },
              backgroundColor: Colors.white,
              borderColor: Colors.black,
              textColor: Colors.black,
            ),
          ),
          Expanded(
            child: OpenFlutterButton(
              title: 'Apply',
              onPressed: onApply!,
            ),
          )
        ],
      ),
    );
  }
}