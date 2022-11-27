import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CircularIcon extends StatelessWidget {
  final IconData icon;
  const CircularIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: mainGrey.withOpacity(0.7),
      ),
      alignment: Alignment.center,
      child: Icon(
        icon,
        color: mainWhite,
      ),
    );
  }
}
