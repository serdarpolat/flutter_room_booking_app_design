import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:room_booking/list_item.dart';

class DataList extends StatefulWidget {
  final String title;

  const DataList({Key key, @required this.title}) : super(key: key);
  @override
  _DataListState createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  double listPosition = 1.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 600)).then((_) {
      listPosition = 0.0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 24.0, top: 54),
          child: Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 52,
              color: Colors.black,
              letterSpacing: -2,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 136.0),
          child: ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: 12,
            itemBuilder: (context, index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 350 * index),
                curve: Interval(
                  0.05 * index,
                  1.0,
                  curve: Curves.ease,
                ),
                transform: Matrix4.translationValues(100 * listPosition, 0, 0),
                child: ListItem(),
              );
            },
          ),
        ),
      ],
    );
  }
}
