import 'package:flutter/material.dart';
// import '../map/map_screen.dart';

class FilterCard extends StatelessWidget {
  const FilterCard({super.key});

  @override
  Widget build(BuildContext context) {
    void sortBy() {}

    void filterBy() {}

    void getToMap() {
      // Navigator.pushNamed(context, MapScreen.id);
    }

    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20, top: 20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
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
