import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shitalsurgicalco/home_screeb.dart';

class PromocodeScreen extends StatefulWidget {
  const PromocodeScreen({super.key});

  @override
  State<PromocodeScreen> createState() => _PromocodeScreenState();
}

class _PromocodeScreenState extends State<PromocodeScreen> {

  TextEditingController promocontroller = TextEditingController();

  void submitPromocode() async {
    final prefs = await SharedPreferences.getInstance();

    String hosname = prefs.getString('hosname').toString();
    String hosadd = prefs.getString('hosadd').toString();
    String promocode = promocontroller.text;

    // Get a reference to the Firebase Realtime Database
    final DatabaseReference database =
    FirebaseDatabase.instance.ref('PromoCodes').child(hosname);


    // Convert your list to a Map (or List) structure
    Map<String, String> itemsMap = {
      'hosname': hosname,
      'hosadd': hosadd,
      'promocode': promocode,
      // for (int i = 0; i < items.length; i++) 'item $i': items[i]

    };
    // Push the list to Firebase under 'items' node
    database.set(itemsMap).then((_) {
      print("Data pushed successfully!");
    }).catchError((error) {
      print("Failed to push data: $error");
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Promo Code'),),
        body: Container(
          margin: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Enter Promo Code If You Have Any',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: false,
                    controller: promocontroller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Promo Code Here',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    submitPromocode();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecondRoute(),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('PromoCode Submitted Successfully'),
                      ),
                    );
                  },
                  child: const Text('Submit Promo Code'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
