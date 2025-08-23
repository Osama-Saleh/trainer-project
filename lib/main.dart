import 'package:flutter/material.dart';
import 'package:trainer_project/future/login_screen/ui/login_screem.dart';
import 'package:trainer_project/future/select_type/select_type_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  SelectTypeScreen(),
    );
  }
}
