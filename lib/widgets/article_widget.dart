import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../provider/article.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;
  ArticleWidget(this.article, {Key? key}) : super(key: key);

  final ButtonStyle style =
      OutlinedButton.styleFrom(side: const BorderSide(color: Colors.blue));
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          thickness: 0.2,
        ),
        const SizedBox(
          height: 3.5,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 15, right: 18),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text('${article.sourceName}   '),
              const Icon(
                Icons.check_circle,
                size: 18,
                color: Colors.blue,
              ),
              const Spacer(),
              OutlinedButton(
                  onPressed: () {
                    Share.share(
                        '${article.title}\n\nSource : ${article.sourceName}  via  NewsHunt\n\nFor Detail \n${article.url}');
                  },
                  style: style,
                  child: const Text(
                    'Share',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ))
            ])),
        Text(article.publishedAt),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Container(
            margin: const EdgeInsets.only(
                top: 3.5, left: 15, right: 15, bottom: 8.5),
            height: 220,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(article.urlToImage.toString()),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Text(article.title,
              style:
                  const TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 6),
          child: Text(
            article.description,
            // style: const TextStyle(color: Colors.black54),
          ),
        ),
        const SizedBox(
          height: 9,
        ),
      ],
    );
  }
}
