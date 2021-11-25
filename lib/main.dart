import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './widgets/categories.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NewsHunt',
        theme: ThemeData(
          primaryColor: Colors.black,
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(color: Colors.black, fontSize: 20)),
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
