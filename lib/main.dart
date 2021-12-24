import 'package:flutter/material.dart';
import 'package:watch_tv/ui/splash_screen/flash_screen.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Watch TV',
      debugShowCheckedModeBanner: false,
      home: const FlashScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "RaleWay",
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 42.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 36.0, fontStyle: FontStyle.normal),
          bodyText2: TextStyle(fontSize: 33.0),
        ),
      ),
    );
  }
}
