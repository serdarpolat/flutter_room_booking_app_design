import 'package:flutter/material.dart';
import 'package:room_booking/methods.dart';

class MenuDrawer extends StatelessWidget {
  final double width;

  const MenuDrawer({Key key, this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      bottom: 0,
      width: width,
      child: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 34,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.edit),
                color: Colors.grey,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuBg extends StatelessWidget {
  final double width;
  final Function onTap;

  const MenuBg({Key key, this.width, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      bottom: 0,
      width: width,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: colorDarkBlue.withOpacity(0.7),
        ),
      ),
    );
  }
}
