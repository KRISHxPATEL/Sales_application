import 'package:flutter/material.dart';
import 'package:shitalsurgicalco/confirmation.dart';
import 'package:shitalsurgicalco/data/productlist.dart';
import 'package:shitalsurgicalco/sheetsproducttext.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';

class Wraping extends StatelessWidget {
  const Wraping({super.key});

  static const String _title = 'Product List';

  // ignore: library_private_types_in_public_api
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text(_title , style: TextStyle(fontWeight: FontWeight.w600,),)),
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String hosname = 'a', hosadd = '', name = '', phone = '', email = '' , itemlist = '';

  void pushListToFirebase(List<String> items) async {
    final prefs = await SharedPreferences.getInstance();

    hosname = prefs.getString('hosname').toString();
    hosadd = prefs.getString('hosadd').toString();
    name = prefs.getString('name').toString();
    phone = prefs.getString('phone').toString();
    email = prefs.getString('email').toString();

    print(hosname);
    // Get a reference to the Firebase Realtime Database
    final DatabaseReference database =
        FirebaseDatabase.instance.ref('Quatations').child(hosname);

    for(int i = 0;i<items.length;i++){

      itemlist = '$itemlist ${items[i]},';

    }
    // Convert your list to a Map (or List) structure
    Map<String, String> itemsMap = {
      'hosname': hosname,
      'hosadd': hosadd,
      'name': name,
      'phone': phone,
      'email': email,
      'items':itemlist,
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
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    'Select Items From List Below',
                    style: TextStyle(fontSize: 24,),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    'Chemical Indicator Steam',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 1350,
                  margin: const EdgeInsets.all(10),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: IndicatorSteam.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Sheetsproducttext(
                              indexs: index, list: IndicatorSteam));
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    'Chemical Indicator EO',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 500,
                  margin: const EdgeInsets.all(10),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: IndicatorEO.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title:
                              Sheetsproducttext(indexs: index, list: IndicatorEO));
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    'Biological Indicator',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: BiologicalIndicator.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Sheetsproducttext(
                              indexs: index, list: BiologicalIndicator));
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    'Documentation Label Gun Roll',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: GunRoll.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Sheetsproducttext(indexs: index, list: GunRoll));
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    'Packing Rolls',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 750,
                  margin: const EdgeInsets.all(10),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: PackingRoll.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title:
                              Sheetsproducttext(indexs: index, list: PackingRoll));
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    'SMMS Wrapping Sheets',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 530,
                  margin: const EdgeInsets.all(10),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: sheets.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Sheetsproducttext(indexs: index, list: sheets));
                    },
                  ),
                ),
                 Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    'Tray Liner',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 100,
                  margin: const EdgeInsets.all(10),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: Traliner.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Sheetsproducttext(indexs: index, list: Traliner));
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    'Neodisher Group of Products',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 590,
                  margin: const EdgeInsets.all(10),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: Neodisherproducts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Sheetsproducttext(indexs: index, list: Neodisherproducts));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 15),
                  child: ElevatedButton(
                    onPressed: () {
                      if (selecteditem.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please Select One Item !'),
                          ),
                        );
                      } else {
                        pushListToFirebase(selecteditem);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmationScreen(formData: hosname,),
                          ),
                        );
                      }
                      selecteditem = [];
                    },
                    child: const Text(
                      'Request Quotation',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
