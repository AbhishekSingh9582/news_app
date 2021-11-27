import 'package:flutter/cupertino.dart';

class Article with ChangeNotifier {
  final String sourceName;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;
  final String publishedAt;

  Article(
      {required this.sourceName,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.content,
      required this.publishedAt});
}


// "source": {
// "id": null,
// "name": "India.com"
// },
// "author": "IANS",
// "title": "Avenge the dinosaurs with asteroid defence mission: SpaceX chief Elon Musk tells NASA - Zee News",
// "description": "Tech billionaire Elon Musk on Thursday said that NASA`s asteroid defence mission will avenge the wipeout of dinosaurs from the face of Earth. NASA on Wednesday launched its Double Asteroid Redirection Test (DART) spacecraft, intended to deliberately crash int…",
// "url": "https://zeenews.india.com/world/avenge-the-dinosaurs-with-asteroid-defence-mission-spacex-chief-elon-musk-tells-nasa-2413570.html",
// "urlToImage": "https://english.cdn.zeenews.com/sites/default/files/2021/11/25/990615-untitled-design-2021-11-25t191344.141.jpg",
// "publishedAt": "2021-11-25T13:44:05Z",
// "content": "New Delhi: Tech billionaire Elon Musk on Thursday said that NASA`s asteroid defence mission will avenge the wipeout of dinosaurs from the face of Earth. NASA on Wednesday launched its Double Asteroid… [+2149 chars]"