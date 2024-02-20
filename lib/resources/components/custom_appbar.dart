import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      flexibleSpace: Container(
        height: 60,
        color: Color(0xFF4265ED),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                'assets/images/propertify-adminlogo.svg',
                height: 30,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: CircleAvatar(
      //       radius: 20,
      //       backgroundImage: AssetImage(
      //           'assets/images/avatar.jpg'), // Replace with your avatar image
      //     ),
      //   ),
      // ],
    );
  }
}
