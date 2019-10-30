import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final double top;
  final double left;
  final bool isOpen;

  const Header({Key key, this.title, this.top, this.left, this.isOpen})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: AnimatedOpacity(
        opacity: isOpen ? 1 : 0,
        duration: Duration(milliseconds: 10),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
