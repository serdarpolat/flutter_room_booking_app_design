import 'package:flutter/material.dart';
import 'package:room_booking/data.dart';

import 'package:room_booking/list.dart';

Widget buildPMethod(Payment payment, bool isOpen, double left,
    double blurRadius, Offset offset) {
  int index = payments.indexOf(payment);

  return AnimatedPositioned(
    duration: isOpen
        ? Duration(milliseconds: 150 + (150 * (users.length - index)))
        : Duration(milliseconds: 0),
    curve: Curves.easeInOutQuad,
    top: 600 + (50.0 * index),
    left: left,
    child: Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 60,
              height: 36,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: blurRadius,
                    offset: offset,
                  ),
                ],
              ),
              child: Image.asset(
                payment.logo,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(width: 10),
            Text(
              payment.title,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(width: 100),
        payment.selected
            ? Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 16,
                ),
              )
            : Container(
                width: 22,
                height: 22,
              ),
      ],
    ),
  );
}

Widget buildContent(
    User user, double top1, double top2, double left, bool isOpen) {
  int index = users.indexOf(user);
  var top;

  if (index == 2)
    top = top1;
  else
    top = top2;

  return Positioned(
    top: top,
    left: left,
    child: AnimatedOpacity(
      opacity: isOpen ? 1 : 0,
      duration: Duration(milliseconds: 300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            user.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 3),
          Text(
            user.email,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildUser(User user, double top1, double top2, double right, bool isOpen,
    double size, double blurRadius, Offset offset) {
  int index = users.indexOf(user);
  var top;

  if (index == 2)
    top = top1;
  else
    top = top2;

  return AnimatedPositioned(
    duration: Duration(milliseconds: 50 + (25 * (users.length - index))),
    curve: Curves.easeInOutSine,
    right: right,
    top: top,
    child: Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: AssetImage(user.image),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          width: isOpen ? 0 : 01,
          color: Colors.white,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: blurRadius,
            offset: offset,
          ),
        ],
      ),
    ),
  );
}

const Color colorBlue = Color(0xff0373EE);
const Color colorDarkBlue = Color(0xff002553);
const Color colorPink = Color(0xffFF2D60);
const Color colorLightBlue = Color(0xff53D2F8);
const Color colorYellow = Color(0xffF8BD4E);

Widget getPage(int index) {
  Widget currentPage;
  switch (index) {
    case 0:
      currentPage = DataList(title: 'User');
      break;
    case 1:
      currentPage = DataList(title: 'Location');
      break;
    case 2:
      currentPage = DataList(title: 'Liked');
      break;
    case 3:
      currentPage = DataList(title: 'Leases');
      break;
    case 4:
      currentPage = DataList(title: 'Home');
      break;
  }

  return currentPage;
}
