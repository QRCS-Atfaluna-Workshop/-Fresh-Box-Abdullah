import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets/custom_button.dart';
import 'package:learn_flutter/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;

  final Color backgroundColor = const Color(0xFFF5F5F8);
  final Color primaryColor = const Color(0xFFEB6A58);
  final Color textDarkColor = const Color(0xFF111A2C);
  final Color textLightColor = const Color(0xFF494949);
  final Color facebookBlue = const Color(0xFF4267B2);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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

                // Welocme Text
                Text(
                  "Let's Sign You In",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: textDarkColor,
                  ),
                ),
                const SizedBox(height: 8),

                Text(
                  "Welcome back, you've been missed!",
                  style: TextStyle(fontSize: 14, color: textLightColor),
                ),
                const SizedBox(height: 30),

                // Field for userName
                CustomTextField(
                  label: "Username or E-mail",
                  hintText: "Enter your username or E-mail",
                ),
                const SizedBox(height: 20),

                // field for password
                CustomTextField(
                  label: "Password",
                  hintText: "Enter your password",
                  isPassword: true,
                  obscureText: _isObscure,
                  onSuffixTap: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
                const SizedBox(height: 10),

                // forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: textDarkColor, fontSize: 13),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Login Button
                CustomButton(
                  text: "LogIn",
                  backgroundColor: primaryColor,
                  textColor: Colors.white,
                  onPressed: () {},
                ),
                const SizedBox(height: 20),

                // Dont have an account ?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: textLightColor, fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Continue with google and facebook
                CustomButton(
                  text: "Continue With Google",
                  backgroundColor: Colors.white,
                  textColor: textLightColor,
                  iconWidget: Image.asset(
                    'assets/images/google_logo.png',
                    height: 24,
                  ), // صورة جوجل
                  hasShadow: true,
                  onPressed: () {},
                ),
                const SizedBox(height: 16),

                CustomButton(
                  text: "Continue With Facebook",
                  backgroundColor: facebookBlue,
                  textColor: Colors.white,
                  iconWidget: const Icon(Icons.facebook, color: Colors.white),
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
