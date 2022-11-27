import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:footzone/constants/colors.dart';

import 'circular_icon.dart';

class FieldTop extends StatelessWidget {
  const FieldTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          child: Image.asset(
            'assets/jpg/football_field.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircularIcon(
                icon: Icons.arrow_back,
              ),
              Row(
                children: [
                  CircularIcon(
                    icon: Icons.share,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircularIcon(icon: Icons.bookmark_outline),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
