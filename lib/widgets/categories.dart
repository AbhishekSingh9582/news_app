import 'package:flutter/material.dart';

class Categories with ChangeNotifier {
  final List<Tab> _listTab = [
    getTab('Latest News'),
    getTab('Technology'),
    getTab('Buisiness'),
    getTab('Entertainment'),
    getTab('Sports'),
    getTab('Health'),
    getTab('Science'),
  ];

  get listTab => _listTab;
}

Tab getTab(String label) {
  return Tab(
    text: label,
  );
}
