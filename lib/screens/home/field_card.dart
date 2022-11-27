import 'package:flutter/material.dart';
import 'package:footzone/constants/colors.dart';
import 'package:footzone/constants/text_styles.dart';
import 'package:footzone/utilities/calculate_distance.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../../providers/current_location.dart';
import '../../providers/fields.dart';

class FieldCard extends StatelessWidget {
  final int index;
  const FieldCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var field = Provider.of<Fields>(context, listen: false).indexField(index);
    final LocationData currentLocation =
        Provider.of<CurrentLocation>(context).currentLocation;
    final distance = calculateDistance(
      field.location.latitude,
      field.location.longitude,
      currentLocation.latitude,
      currentLocation.longitude,
    );
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: mainGrey.withOpacity(0.1),
            offset: Offset(5, 5),
            spreadRadius: 3,
          ),
        ],
        color: mainWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 80,
                      width: 100,
                      child: Image.asset(
                        'assets/jpg/football_field.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        field.name,
                        style: cardHeaderText,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        field.town,
                        style: cardDescText,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(Icons.timer_outlined),
                          Text(
                            field.price.toString(),
                            style: cardHeaderText,
                          ),
                          Text(
                            '\$ /soatiga',
                            style: cardDescText,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: mainYellow,
                ),
                child: Text('${distance.toStringAsFixed(2)} km'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: const Divider(
              color: mainBlue,
              height: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                field.owner,
                style: cardDescText,
              ),
              Text(
                '${field.capacity} ta o\'rin qoldi',
                style: cardDescGreen,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
