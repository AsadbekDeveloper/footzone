import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../providers/fields.dart';
import '../../widgets/bottom_navbar.dart';
import 'field_card.dart';
import 'filter_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var fields = Provider.of<Fields>(context).getFields;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainBlue,
        title: const Text('FootZone'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.airplane_ticket_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notification_important_outlined),
          ),
        ],
      ),
      body: Column(children: [
        const FilterCard(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              clipBehavior: Clip.antiAlias,
              itemCount: fields.length,
              itemBuilder: ((context, index) {
                return FieldCard(
                  index: index,
                );
              }),
            ),
          ),
        )
      ]),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
