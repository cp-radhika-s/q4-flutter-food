import 'package:flutter/material.dart';
import 'package:food_learning_app/ui/Dashboard.dart';
import 'package:food_learning_app/ui/home/Home.dart';

void main() {
  runApp(FoodApp());
}

class FoodApp extends StatefulWidget {
  @override
  _FoodAppState createState() => _FoodAppState();
}

class _FoodAppState extends State<FoodApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kitchen",
      home: Dashboard(),
    );
  }
}
