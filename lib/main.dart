import 'package:flutter/material.dart';
import 'package:wastify/screens/login.dart';
import 'package:wastify/ui/my_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.ligthTheme,
      home: const LoginPage(),
    );
  }
}
