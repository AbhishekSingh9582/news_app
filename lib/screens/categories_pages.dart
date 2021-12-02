import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
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

  Future obtainArticleFuture() async {
    return Provider.of<ArticleProvider>(context, listen: false)
        .getArticle(category: widget.category);
    //     .catchError((error) {
    //   if (error !=
    //       "SocketException: Failed host lookup: 'newsapi.org' (OS Error: No address associated with hostname, errno = 7)") {
    //     return showDialog(
    //         context: context,
    //         builder: (ctx) => const AlertDialog(
    //               title: Text('Server lost'),
    //               content: Text('Something went wrong \n\nTry Again Later\n '),
    //             ));
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        OutlinedButton.styleFrom(side: const BorderSide(color: Colors.blue));
    return FutureBuilder(
      future: _articleFuture,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: obtainArticleFuture,
                child: Consumer<ArticleProvider>(builder: (ctx, article, ch) {
                  final list = article.getList;
                  if (article.getList.isEmpty) {
                    return Center(
                      child: AlertDialog(
                        content: const Text(
                            "Oops..Looks like there's no\n    Internet connection"),
                        actions: [
                          Center(
                            child: TextButton(
                              onPressed: obtainArticleFuture,
                              child: const Text('Refresh',
                                  textAlign: TextAlign.center),
                            ),
                          )
                        ],
                      ),
                    );
                  } else {
                    print('list is not empty');

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
                              thickness: 0.2,
                            ),
                            const SizedBox(
                              height: 3.5,
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 18),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('${list[ind].sourceName}   '),
                                      const Icon(
                                        Icons.check_circle,
                                        size: 18,
                                        color: Colors.blue,
                                      ),
                                      const Spacer(),
                                      OutlinedButton(
                                          onPressed: () {
                                            Share.share(
                                                '${list[ind].title}\n\nSource : ${list[ind].sourceName}  via  NewsHunt\n\nFor Detail \n${list[ind].url}');
                                          },
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
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Text(list[ind].title,
                                  style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 6),
                              child: Text(
                                list[ind].description,
                                // style: const TextStyle(color: Colors.black54),
                              ),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }),
              );
      },
    );
  }
}
