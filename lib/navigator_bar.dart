import 'package:flutter/material.dart';
import 'package:room_booking/list.dart';
import 'package:room_booking/nav_items.dart';

class NavigatorBar extends StatefulWidget {
  @override
  _NavigatorBarState createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  List<NavItem> navItems = List<NavItem>();

  static Widget crr = DataList(title: 'Leases');

  int value = 3;

  @override
  void initState() {
    super.initState();

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

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    setState(() {
                      navItems.forEach((el) => el.isSelected = false);
                      item.isSelected = !item.isSelected;
                    });
                  },
                  child: NavItemWidget(navItem: item),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
