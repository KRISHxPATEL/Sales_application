import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shitalsurgicalco/login_screen.dart';
import 'package:shitalsurgicalco/sharedpref_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Shital Surgical Co';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: Scaffold(
        body: SharedprefScreen(),
      ),
    );
  }
}
