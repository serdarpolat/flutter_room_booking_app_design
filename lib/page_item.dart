import 'package:flutter/material.dart';
import 'package:room_booking/list.dart';

class PageItem extends StatelessWidget {
  final double w;
  final int value;
  final int index;
  final String title;

  const PageItem({Key key, this.w, this.value, this.index, this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      top: 0,
      left: w * (index - value),
      bottom: 0,
      right: w * (value - index),
      child: DataList(title: title),
    );
  }
}

List<String> titles = [
  'User',
  'Location',
  'Likes',
  'Leases',
  'Home',
];
