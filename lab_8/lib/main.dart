import 'package:flutter/material.dart';
import 'package:lab_8/pages/posts_page.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  
  @override
  State<MyApp> createState() => _MyAppState();
}
 
class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostPage(),
    );
  }
}
