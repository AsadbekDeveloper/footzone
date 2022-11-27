import 'package:flutter/material.dart';
import 'package:footzone/screens/map/map_screen.dart';

import '../../constants/colors.dart';
// import '../map/map_screen.dart';

class FilterCard extends StatelessWidget {
  const FilterCard({super.key});

  @override
  Widget build(BuildContext context) {
    void sortBy() {}

    void filterBy() {}

    void getToMap() {
      Navigator.pushNamed(context, MapPage.id);
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: mainWhite,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: mainGrey.withOpacity(0.1),
            offset: Offset(5, 5),
            spreadRadius: 3,
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilterItem(
              title: 'Sort by',
              icon: const Icon(Icons.sort),
              func: sortBy,
            ),
            const VerticalDivider(color: Colors.black),
            FilterItem(
              title: 'Filter',
              icon: const Icon(Icons.filter_alt),
              func: filterBy,
            ),
            const VerticalDivider(color: Colors.black),
            FilterItem(
              title: 'Map',
              icon: const Icon(Icons.map),
              func: getToMap,
            ),
          ],
        ),
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  final String title;
  final Icon icon;
  void Function()? func;
  FilterItem(
      {super.key, required this.title, required this.icon, required this.func});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Row(
        children: [
          icon,
          Text(title),
        ],
      ),
    );
  }
}
