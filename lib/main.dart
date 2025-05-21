import 'package:flutter/material.dart';
import 'package:moviesapp/components/Home.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      home: Home(),
    );
  }
}