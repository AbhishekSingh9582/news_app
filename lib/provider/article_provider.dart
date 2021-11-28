import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'article.dart';

class ArticleProvider with ChangeNotifier {
  List<Article> _artList = [];

  List<Article> get getList {
    return [..._artList];
  }

  Future<void> getArticle({String category = ''}) async {
    //https://newsapi.org/v2/top-headlines?country=in&apiKey=923e5f7b15ef4cc6b70811f9c18ccf91

    final url = Uri.https("newsapi.org", '/v2/top-headlines', {
      "apiKey": "923e5f7b15ef4cc6b70811f9c18ccf91",
      "country": 'in',
      "category": category,
    });
    final response = await http.get(url);
    Map<String, dynamic> result =
        json.decode(response.body) as Map<String, dynamic>;

    print(json.decode(response.body));
    try {
      if (result["status"] == "ok") {
        List<Article> tempList = [];
        print('result article length =${result["articles"].length}');

        result["articles"].forEach((article) {
          print('inside status ok for each loop condition true');
          if (article['source']['name'] != null &&
              article['description'] != null &&
              article['urlToImage'] != null &&
              article['content'] != null &&
              article['url'] != null &&
              article['title'] != null &&
              article['publishedAt'] != null) {
            String temp = article['publishedAt'];

            String dateTime = "    " +
                temp.substring(0, temp.indexOf('T')) +
                "    " +
                temp.substring(temp.indexOf('T') + 1, temp.length - 1);
            tempList.add(
              Article(
                sourceName: article["source"]["name"],
                title: article["title"],
                description: article["description"],
                content: article['content'],
                url: article["url"],
                urlToImage: article["urlToImage"],
                publishedAt: dateTime,
              ),
            );
          }
        });
        print('outsideLoop');
        _artList = tempList;
        if (tempList.isNotEmpty) {
          print('inside tempList and it not empty');
          for (var item in _artList) {
            print('inside item');
            print("${item.title}\n");
          }
          notifyListeners();
        } else {
          print('list is empty ....');
        }
      }
    } catch (error) {
      print(error);
    }
  }
}


  // List.generate(result['articles'].length, (index) {
        //   Map<String, dynamic> article = result['article'][index];
        //   return Article(
        //     sourceName: article['source']['name'],
        //     title: article['title'],
        //     description: article['description'],
        //     content: article['content'],
        //     url: article['url'],
        //     urlToImage: article['imageToUrl'],
        //     publishedAt: article['publishedAt'],
        //   );
        // });