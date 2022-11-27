import 'package:flutter/material.dart';

import 'field_bottom.dart';
import 'field_top.dart';

class FieldPage extends StatelessWidget {
  static const id = 'field';
  final double distance;
  final int index;
  const FieldPage({super.key, required this.index, required this.distance});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FieldTop(),
          FieldBottom(
            index: index,
            distance: distance,
          ),
        ],
      ),
    );
  }
}
