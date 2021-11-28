import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'detail_article.dart';
import '../provider/article_provider.dart';

class CategoriesPages extends StatefulWidget {
  final String category;
  const CategoriesPages(this.category, {Key? key}) : super(key: key);

  @override
  _CategoriesPagesState createState() => _CategoriesPagesState();
}

class _CategoriesPagesState extends State<CategoriesPages> {
  Future? _articleFuture;
  @override
  void initState() {
    super.initState();
    _articleFuture = obtainArticleFuture();
  }

  Future obtainArticleFuture() {
    return Provider.of<ArticleProvider>(context, listen: false)
        .getArticle(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        OutlinedButton.styleFrom(side: const BorderSide(color: Colors.blue));
    return FutureBuilder(
      future: _articleFuture,
      // future: Provider.of<ArticleProvider>(context)
      //     .getArticle(category: 'technology'),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        // Provider.of<ArticleProvider>(context, listen: false).artList;
        return snapshot.connectionState == ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: obtainArticleFuture,
                child: Consumer<ArticleProvider>(builder: (ctx, article, ch) {
                  final list = article.getList;
                  if (article.getList.isEmpty) {
                    print('list empty');
                  } else {
                    print('list is not empty');
                  }

                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, ind) => InkWell(
                      splashColor: Colors.grey,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) =>
                                  DetailArticle(article.getList[ind].url))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(
                            thickness: 0.1,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 18),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                        '${article.getList[ind].sourceName}   '),
                                    const Icon(
                                      Icons.check_circle,
                                      size: 18,
                                      color: Colors.blue,
                                    ),
                                    const Spacer(),
                                    //Container(child:OutlinedButton.styleFrom()),
                                    OutlinedButton(
                                        onPressed: () {},
                                        style: style,
                                        child: const Text(
                                          'Share',
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ))
                                  ])),
                          Text(list[ind].publishedAt),
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
                                  image: NetworkImage(
                                      list[ind].urlToImage.toString()),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Text(list[ind].title,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 6),
                            child: Text(
                              list[ind].description,
                              style: const TextStyle(color: Colors.black54),
                            ),
                          ),
                          const SizedBox(
                            height: 8.8,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              );
      },
    );
  }
}
