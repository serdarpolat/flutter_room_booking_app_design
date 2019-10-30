import 'package:flutter/material.dart';
import 'package:room_booking/methods.dart';

class BottomButtons extends StatelessWidget {
  final bool isOpen;
  final double left;
  final double right;

  const BottomButtons({Key key, this.isOpen, this.left, this.right})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration:
          isOpen ? Duration(milliseconds: 300) : Duration(milliseconds: 0),
      bottom: 20,
      left: left,
      right: right,
      child: Container(
        height: 48,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(27),
                    bottomLeft: Radius.circular(27),
                  ),
                  color: colorPink,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.withOpacity(0.3),
                      offset: Offset(0.0, 3.0),
                      blurRadius: 4,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(27),
                    bottomRight: Radius.circular(27),
                  ),
                  color: Colors.black12,
                ),
                child: Center(
                  child: Text(
                    'Renting',
                    style: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
