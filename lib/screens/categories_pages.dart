import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../widgets/article_widget.dart';
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
        .getArticle(category: widget.category)
        .catchError((error) {
      return showDialog(
          barrierDismissible: false,
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Aww Snap!'),
                content: const Text(
                    'Something went wrong \n\nTry Again Later\nOr check Your Internet connection '),
                actions: [
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                        obtainArticleFuture();
                      },
                      child: const Text('Refresh', textAlign: TextAlign.center),
                    ),
                  )
                ],
              ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _articleFuture,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: obtainArticleFuture,
                child: Consumer<ArticleProvider>(builder: (ctx, article, ch) {
                  final list = article.getList;
                  // if (article.getList.isEmpty) {
                  //   return Center(
                  //     child: AlertDialog(
                  //       content: const Text(
                  //           "Oops..Looks like there's no\n    Internet connection"),
                  //       actions: [
                  //         Center(
                  //           child: TextButton(
                  //             onPressed:  obtainArticleFuture,
                  //             child: const Text('Refresh',
                  //                 textAlign: TextAlign.center),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   );
                  // } else {
                  //   print('list is not empty');

                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, ind) => InkWell(
                      splashColor: Colors.grey,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => DetailArticle(list[ind].url))),
                      child: ArticleWidget(list[ind]),
                    ),
                  );
                  // }
                }),
              );
      },
    );
  }
}
