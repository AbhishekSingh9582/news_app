import 'package:flutter/material.dart';
import 'package:news_hunt/provider/theme_model.dart';
import './provider/article_provider.dart';
import 'package:provider/provider.dart';
import './provider/my_themes.dart';
import 'provider/categories.dart';
import 'screens/opening_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Categories()),
        ChangeNotifierProvider(
          create: (ctx) => ThemeModel(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ArticleProvider(),
        )
      ],
      child: Consumer<ThemeModel>(
        builder: (context, themeNotifier, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'NewsHunt',
          theme:
              themeNotifier.isDark ? MyThemes.darkTheme : MyThemes.lightTheme,
          home: const MyHomePage(),
        ),
      ),
    );
  }
}
