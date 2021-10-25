import 'package:flutter/material.dart';
import 'package:test_app_batch21/screens/task_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TEST',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskPage(),
    );
  }
}
