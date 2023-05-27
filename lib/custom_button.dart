import 'package:flutter/material.dart';

class OpenFlutterButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Function() onPressed;
  final String title;
  IconData? icon;
  final double iconSize;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  OpenFlutterButton({
    this.width,
    this.height,
    required this.title,
    required this.onPressed,
    this.icon,
    this.backgroundColor = const Color.fromARGB(255, 212, 123, 118),
    this.textColor = Colors.black,
    this.borderColor = Colors.red,
    this.iconSize = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry edgeInsets = EdgeInsets.all(0);
    if (width == null || height == null) {
      edgeInsets = EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
    }
    return Padding(
      padding: edgeInsets,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          padding: edgeInsets,
          decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: backgroundColor.withOpacity(0.3),
                    blurRadius: 4.0,
                    offset: Offset(0.0, 5.0)),
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              this.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(ThemeData theme) {
    if (icon != null) {
      return Padding(
        padding: const EdgeInsets.only(
          right: 8.0,
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: theme.textTheme.button?.color,
        ),
      );
    }

    return SizedBox();
  }
}
