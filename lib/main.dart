import 'package:flutter/material.dart';
import 'package:learn_flutter/screens/login_screen.dart';

void main() {
  runApp(LoginScreen());
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 20),

            // Logo
            Center(
              child: Image.asset(
                'assets/images/Group 2739.png',
                height: 40,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
