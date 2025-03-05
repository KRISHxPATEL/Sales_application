import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shitalsurgicalco/home_screeb.dart';
import 'package:shitalsurgicalco/login_screen.dart';

class SharedprefScreen extends StatefulWidget {
  const SharedprefScreen({super.key});

  @override
  State<SharedprefScreen> createState() => _SharedprefScreenState();
}

class _SharedprefScreenState extends State<SharedprefScreen> {
  String? hosname;
  @override
  void initState() {
    super.initState();
    // Add a delay and navigate to the next screen
    Future.delayed(const Duration(seconds: 5), () async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      hosname = sharedPreferences.getString('hosname');
      if (hosname == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyStatefulWidgetl()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SecondRoute(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white, // Set the background color
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/log.png' , height: 300,width: 300,),
              // Splash logo or icon
              const SizedBox(height: 30),
              const Text(
                'Welcome To ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Shital ',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Surgical Co',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
