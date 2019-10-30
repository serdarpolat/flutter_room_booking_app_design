import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:room_booking/methods.dart';

const double itemStartPosition = 0.0;
const double itemEndPosition = 100.0;
const double itemStartElevation = 0.0;
const double itemEndElevation = 10;
const double trashStartAngle = 0.0;
const double trashEndAngle = -0.5;

class ListItem extends StatefulWidget {
  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> with TickerProviderStateMixin {
  AnimationController controller;

  bool isOpen = true;
  double lerp(double min, double max) => lerpDouble(min, max, controller.value);

  double get itemPosition => lerp(itemStartPosition, itemEndPosition);
  double get itemElevation => lerp(itemStartElevation, itemEndElevation);
  double get trashAngle => lerp(trashStartAngle, trashEndAngle);

  double get maxWidth => MediaQuery.of(context).size.width;
  double get shadowOpacity => lerp(0, 0.5);

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: maxWidth,
      height: 136,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Stack(
            children: <Widget>[
              Positioned(
                right: 24,
                top: 48,
                child: Column(
                  children: <Widget>[
                    Transform.rotate(
                      angle: trashAngle,
                      origin: Offset(0.0, 5.0),
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 24,
                        child: Image.asset(
                          'assets/icons/trash_top.png',
                          fit: BoxFit.cover,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Container(
                      width: 24,
                      child: Image.asset(
                        'assets/icons/trash_bottom.png',
                        fit: BoxFit.cover,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 600),
                curve: Curves.easeOutBack,
                top: 0,
                right: itemPosition,
                child: GestureDetector(
                  // onTap: _toggle,
                  onHorizontalDragUpdate: _onHorizontalDragUpdate,
                  onHorizontalDragEnd: _onHorizontalDragEnd,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            offset: Offset(5, 5),
                            color: Colors.black.withOpacity(shadowOpacity),
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/01.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          Container(
                            width: maxWidth - (148.0),
                            height: 100,
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '102 South Street #302,\n14850 NY',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 6, horizontal: 12),
                                        child: Text(
                                          '\$3,120',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: colorBlue,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                      ),
                                      Text(
                                        '3 Beds',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        '3 Messages',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    controller.value -= details.primaryDelta / (maxWidth - 48);
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    if (controller.isAnimating ||
        controller.status == AnimationStatus.completed) return;
    final double flingVelocity =
        details.velocity.pixelsPerSecond.dx / (maxWidth - 48);
    if (flingVelocity < 0.0) {
      controller.fling(velocity: math.max(2.0, -flingVelocity));
    } else if (flingVelocity > 0.0) {
      controller.fling(velocity: math.min(-2.0, -flingVelocity));
    } else {
      controller.fling(velocity: controller.value < 0.5 ? -2.0 : 2.0);
    }
  }
}
