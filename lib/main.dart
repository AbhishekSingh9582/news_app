import 'package:flutter/material.dart';
import './provider/article_provider.dart';
import 'package:provider/provider.dart';
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
          create: (ctx) => ArticleProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NewsHunt',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          dividerColor: Colors.black,
          primaryColor: Colors.black,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              actionsIconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 26.5,
                  fontWeight: FontWeight.bold)),
          primaryTextTheme: const TextTheme(
              headline1: TextStyle(fontSize: 18, color: Colors.black),
              bodyText1: TextStyle(fontSize: 18, color: Colors.black)),
          //  textTheme: const TextTheme(
          //      headline1: TextStyle(fontSize: 18, color: Colors.black)),
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
