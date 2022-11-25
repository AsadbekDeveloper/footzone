import 'package:flutter/material.dart';
// import 'package:football_booking_app/constants.dart';
// import '../../providers/fields.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';

class FieldCard extends StatelessWidget {
  final int index;
  const FieldCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // var field = Provider.of<Fields>(context, listen: false).indexField(index);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          height: 80,
                          width: 100,
                          child: Image.network(
                            'https://i.pravatar.cc/150',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(field.name),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Hi'
                              // field.info,
                              ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: const [
                              Icon(Icons.star),
                              Text('4,5'),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Text('Uzoq'),
                    ],
                  )
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('5% chegirmaga ega bo\'ling'),
                  // Text('${field.capacity} ta o\'rin qoldi'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
