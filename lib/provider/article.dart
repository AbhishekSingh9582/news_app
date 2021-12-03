import 'package:flutter/cupertino.dart';

class Article with ChangeNotifier {
  final String sourceName;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;
  final String publishedAt;

  Article({
    required this.sourceName,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
    required this.publishedAt,
  });
}
