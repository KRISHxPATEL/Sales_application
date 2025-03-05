import 'package:flutter/material.dart';
import 'package:shitalsurgicalco/home_screeb.dart';

class ConfirmationScreen extends StatelessWidget {
  final String formData; // You can pass form data or any required info here

  // Constructor
  const ConfirmationScreen({Key? key, required this.formData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Confirmation message
            const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 80,
            ),
            const SizedBox(height: 40),
            const Text(
              'Your Request for Quotation Is Submited Successfully !',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'We Will Contact You In ',
              style: const TextStyle(fontSize: 18 ,),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10,),
            const Text(
              '2 OR 3 Business Days',
              style: const TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            // Buttons to navigate
            ElevatedButton(
              onPressed: () {
                // Optionally navigate to a different screen
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecondRoute(),
                      ),
                    );// Go back to the previous screen
              },
              child: const Text(
                'Go To Home',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
