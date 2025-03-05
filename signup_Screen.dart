import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shitalsurgicalco/home_screeb.dart';
import 'package:shitalsurgicalco/login_screen.dart';
import 'package:shitalsurgicalco/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController hosnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController hosaddController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? _validateInput(String? value) {

    if (value!.isEmpty) {
      return 'This field cannot be empty';
    }
    return null; // Return null if the input is valid
  }


  void _submitForm() {

    if (_formKey.currentState?.validate() ?? false) {
      // If the form is valid, display success message

      signUpWithEmailPassword();
      print('object.........................................');
    } else {
      print('.........................................');

    }
  }


  Future<void> signUpWithEmailPassword() async {
    String phone = phoneController.text;

    String email ='$phone@customdomain.com';

    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: passwordController.text.trim(),
      );
      signUp();
    } on FirebaseAuthException catch (e) {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to sign UP. Please check your credentials.'),
          ),
        );
      });
    }
  }

  void signUp() async {
    String hosname = hosnameController.text;
    String hosadd = hosaddController.text;
    String name = nameController.text;
    String phone = phoneController.text;
    String email ='$phone@customdomain.com';
    final prefs = await SharedPreferences.getInstance();

    prefs
        .setString('hosname', hosname)
        .toString();
    prefs.setString('hosadd', hosadd).toString();
    prefs.setString('name', name).toString();
    prefs.setString('phone', phone).toString();
    prefs.setString('email', email).toString();


    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const SecondRoute()), // Example home page
    );
    final DatabaseReference database =
        FirebaseDatabase.instance.ref('New Accounts').child(hosname);

    // Convert your list to a Map (or List) structure
    Map<String, String> itemsMap = {
      'hosname': hosname,
      'hosadd': hosadd,
      'name': name,
      'phone': phone,
      'email': email,
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
        body: Container(
          alignment: Alignment.center,
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    margin: EdgeInsets.all(8),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Shital ',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        Text(
                          'Surgical Co',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Sign UP',
                        style: TextStyle(fontSize: 20),
                      )),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            obscureText: false,
                            controller: nameController,
                            validator: _validateInput,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Your Name',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            obscureText: false,
                            controller: phoneController,
                            validator: _validateInput,
                            keyboardType: TextInputType.number,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Your whatsapp Number',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            obscureText: false,
                            controller: hosnameController,
                            validator: _validateInput,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              border:  OutlineInputBorder(),
                              labelText: 'Hospital Name',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            obscureText: false,
                            controller: hosaddController,
                            validator: _validateInput,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Hospital Address',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 23,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            validator: _validateInput,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: const Text('Sign-UP'),
                        onPressed: () {
                          _submitForm();
                        },
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Already Have An Account?'),
                      TextButton(
                        child: const Text(
                          'Sign IN',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyStatefulWidgetl(),
                            ), // Example home page
                          );
                        },
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
