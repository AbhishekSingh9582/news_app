import 'package:flutter/material.dart';

class Categories with ChangeNotifier {
  final List<Tab> _listTab = [
    getTab('Latest News', Icons.view_headline_outlined),
    getTab('Technology', Icons.mobile_friendly_outlined),
    getTab('Business', Icons.business),
    getTab('Entertainment', Icons.category),
    getTab('Sports', Icons.sports_cricket),
    getTab('Health', Icons.medication_sharp),
    getTab('Science', Icons.science),
  ];

  get listTab => _listTab;
}

Tab getTab(String label, IconData categoryIcon) {
  return Tab(
    text: label,
    icon: Icon(categoryIcon),
  );
}
