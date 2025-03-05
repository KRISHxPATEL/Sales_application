import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shitalsurgicalco/home_screeb.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shitalsurgicalco/signup_Screen.dart';

class MyStatefulWidgetl extends StatefulWidget {
  const MyStatefulWidgetl({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidgetl> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidgetl> {
  TextEditingController hosnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController hosaddController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void showToast() {
    Fluttertoast.showToast(
        msg: 'Forgot Password',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
  }

  String? _validateInput(String? value) {

    if (value!.isEmpty) {
      return 'This field cannot be empty';
    }
    return null; // Return null if the input is valid
  }


  void _submitForm() {

    if (_formKey.currentState?.validate() ?? false) {
      // If the form is valid, display success message

      logshowToast();
      print('object.........................................');
    } else {
      print('.........................................');

    }
  }

  void logshowToast() async {
    String hosname = hosnameController.text;
    String hosadd = hosaddController.text;
    String name = nameController.text;
    String phone = phoneController.text;
    String email = '$phone@customdomain.com';

    final prefs = await SharedPreferences.getInstance();

    prefs
        .setString('hosname', hosname)
        .toString(); // Save the string with a specific key
    prefs.setString('hosadd', hosadd).toString();
    prefs.setString('name', name).toString();
    prefs.setString('phone', phone).toString();
    prefs.setString('email', email).toString();

    _login();
  }

  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void _login() async {
    bool _isLoading = false;

    setState(() {
      _isLoading = true;
    });
    String phone = phoneController.text;
    String email = '$phone@customdomain.com';
    String password = passwordController.text.trim();

    User? user = await signInWithEmailPassword(email, password);

    setState(() {
      _isLoading = false;
    });

    if (user != null) {
      // Successful login, navigate to the next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const SecondRoute()), // Example home page
      );
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Failed to sign in. Please check your credentials.')),
      );
    }

    Fluttertoast.showToast(
        msg: 'LOG IN',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
  }


  void signupshowToast() {
    Fluttertoast.showToast(
        msg: 'signUp',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const SignupScreen()), // Example home page
    );
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
                    margin: const EdgeInsets.all(8),
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
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
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
                            decoration: const InputDecoration(
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
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(

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
                            decoration: const InputDecoration(
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
                            decoration: const InputDecoration(
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
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: showToast,
                    //forgot password screen,
                    child: const Text(
                      'Forgot Password',
                    ),
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: const Text('Sign-IN'),
                        onPressed: () {
                          _submitForm();
                        },
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Does not have account?'),
                      TextButton(
                        child: const Text(
                          'Sign UP',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          signupshowToast();
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
