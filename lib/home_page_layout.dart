import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:room_booking/bottom_buttons.dart';
import 'package:room_booking/data.dart';
import 'package:room_booking/header.dart';
import 'package:room_booking/menu_layout.dart';
import 'package:room_booking/methods.dart';
import 'package:room_booking/nav_items.dart';
import 'package:room_booking/page_item.dart';

class HomePageLayout extends StatefulWidget {
  @override
  _HomePageLayoutState createState() => _HomePageLayoutState();
}

class _HomePageLayoutState extends State<HomePageLayout>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double get maxWidth => MediaQuery.of(context).size.width;
  double get avatarSize => lerp(avatarStartSize, avatarEndSize);

  List<NavItem> navItems = List<NavItem>();

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    navItems.add(
        NavItem(false, 'assets/svgs/user.svg', 'assets/svgs/user_alt.svg', 0));
    navItems.add(NavItem(
        false, 'assets/svgs/location.svg', 'assets/svgs/location_alt.svg', 1));
    navItems.add(
        NavItem(false, 'assets/svgs/like.svg', 'assets/svgs/like_alt.svg', 2));
    navItems.add(
        NavItem(true, 'assets/svgs/file.svg', 'assets/svgs/file_alt.svg', 3));
    navItems.add(
        NavItem(false, 'assets/svgs/home.svg', 'assets/svgs/home_alt.svg', 4));
  }

  int value = 3;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double lerp(double min, double max) =>
      lerpDouble(min, max, _controller.value);

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Stack(
                  children: List.generate(5, (i) {
                    return PageItem(
                      w: w,
                      value: value,
                      index: i,
                      title: titles[i],
                    );
                  }),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 90,
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 60,
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: navItems.map((item) {
                              return GestureDetector(
                                onTap: () {
                                  navItems
                                      .forEach((el) => el.isSelected = false);
                                  item.isSelected = !item.isSelected;

                                  setState(() => value = item.index);
                                },
                                child: NavItemWidget(navItem: item),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                MenuBg(
                  width: lerp(minWidth, maxWidth),
                  onTap: _toggle,
                ),
                MenuDrawer(
                  width: lerp(minWidth, maxWidth * 0.6),
                ),
                GestureDetector(
                  onTap: _toggle,
                  child: Stack(
                    children: <Widget>[
                      for (User user in users)
                        buildUser(
                          user,
                          lerp(54, 96),
                          lerp(
                              54,
                              74 +
                                  ((60.0 + 36) *
                                      (users.length - users.indexOf(user)))),
                          lerp(24 + (22.0 * users.indexOf(user)),
                              maxWidth * 0.6 - lerp(44 / 2, 60 * 0.6)),
                          isOpen,
                          lerp(44, 60),
                          lerp(3, 10),
                          Offset(0.0, lerp(7.0, 10.0)),
                        ),
                    ],
                  ),
                ),
                Stack(
                  children: <Widget>[
                    for (User user in users)
                      buildContent(
                        user,
                        lerp(54, 108),
                        lerp(
                            54,
                            180 +
                                (95.0 *
                                    (users.length - users.indexOf(user) - 1))),
                        lerp(maxWidth, maxWidth * 0.51),
                        isOpen,
                      ),
                  ],
                ),
                Header(
                  top: lerp(54, 230),
                  left: lerp(maxWidth, maxWidth * 0.45),
                  isOpen: isOpen,
                  title: 'My Group',
                ),
                Header(
                  top: lerp(54, 560),
                  left: lerp(maxWidth, maxWidth * 0.45),
                  isOpen: isOpen,
                  title: 'My Payment Method',
                ),
                Stack(
                  children: <Widget>[
                    for (Payment payment in payments)
                      buildPMethod(
                        payment,
                        isOpen,
                        lerp(maxWidth, maxWidth * 0.35),
                        lerp(2, 4),
                        Offset(0.0, lerp(3, 5.0)),
                      ),
                  ],
                ),
                BottomButtons(
                  isOpen: isOpen,
                  left: lerp(maxWidth, maxWidth * 0.4 + 20),
                  right: lerp(-maxWidth * 0.4 + 20, 20),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _toggle() {
    final check = _controller.status == AnimationStatus.completed;
    _controller.fling(velocity: check ? -1 : 1);
    setState(() {
      isOpen = !isOpen;
    });
  }
}
