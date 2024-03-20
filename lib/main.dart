import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp_1/pages/home_page.dart';

void main() async {
  //initialize the hive;
  await Hive.initFlutter();

  //open the box;
  var box = await Hive.openBox('myBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
