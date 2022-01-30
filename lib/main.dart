import 'package:flutter/material.dart';
import 'package:homework/pages/lesson5_6.dart';
import 'package:homework/pages/lesson5_7.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Lesson5_7(),
      theme:  ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black, displayColor: Colors.black,),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
