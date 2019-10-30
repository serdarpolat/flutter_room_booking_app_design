import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavItem {
  bool isSelected;
  String imgPath;
  String imgPathAlt;
  int index;

  NavItem(this.isSelected, this.imgPath, this.imgPathAlt, this.index);
}

class NavItemWidget extends StatelessWidget {
  final NavItem navItem;

  const NavItemWidget({Key key, this.navItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      curve: Curves.bounceOut,
      width: navItem.isSelected ? 60 : 30,
      height: navItem.isSelected ? 60 : 30,
      child: SvgPicture.asset(
        navItem.isSelected ? navItem.imgPathAlt : navItem.imgPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
