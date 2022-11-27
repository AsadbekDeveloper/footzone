import 'package:flutter/material.dart';
import 'package:footzone/constants/colors.dart';
import 'package:footzone/constants/text_styles.dart';
import 'package:footzone/providers/fields.dart';
import 'package:provider/provider.dart';

class FieldBottom extends StatelessWidget {
  final double distance;
  final int index;
  const FieldBottom({
    super.key,
    required this.index,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    final field = Provider.of<Fields>(context, listen: false).indexField(index);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        field.name,
                        style: cardHeaderText,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          color: mainYellow,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Text(
                          '$distance km',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        field.town,
                        style: cardDescText,
                      ),
                      Text(
                        '${field.price} \$ /soatiga',
                        style: cardDescText,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Divider(
              height: 2,
              color: mainGrey,
            ),
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: mainGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${field.location}'),
                  TextButton(
                    onPressed: () {},
                    child: Text('Xaritada ko\'rish'),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Divider(
              height: 2,
              color: mainGrey,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Maydon egasi',
                style: cardHeaderText,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(field.owner),
                  Row(
                    children: [
                      Icon(Icons.phone),
                      Text(
                        field.phoneNumber.toString(),
                      ),
                    ],
                  )
                ],
              ),
              Text(field.info),
            ],
          ),
          Container(
            width: double.infinity,
            height: 80,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: mainYellow,
                  // padding: EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0),
              onPressed: (() {}),
              child: Text(
                'Buyurtma berish',
                style: cardHeaderText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
