import 'package:fasionrecommender/data/notifiers.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  String passwordError = ''; // Variable to hold the error message
  String emailError = ''; // Variable to hold the email error message
  bool passwordMismatch = false; // Flag to check password mismatch
  bool emailEmpty = false; // Flag to check empty email

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image(
          image: AssetImage(
            'assets/images/app_logo.png', // Default logo
          ),
          height: 55,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            selectPageNotifier.value = 1;
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (context, isDarkmode, child) {
                return Icon(isDarkmode ? Icons.dark_mode : Icons.light_mode);
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello There!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 4),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 140),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail),
                labelText: 'Enter Your Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: emailEmpty ? Colors.red : Colors.grey, // Highlight email field if empty
                  ),
                ),
              ),
            ),
            if (emailError.isNotEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    emailError,
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ),
              ),
            SizedBox(height: 24),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: passwordMismatch ? Colors.red : Colors.grey, // Set border color when passwords don't match
                  ),
                ),
                labelText: 'Enter Your Password',
              ),
            ),
            SizedBox(height: 24),
            TextField(
              controller: confirmpasswordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: passwordMismatch ? Colors.red : Colors.grey, // Set border color when passwords don't match
                  ),
                ),
                labelText: 'Confirm Password',
              ),
            ),
            SizedBox(height: 0),
            if (passwordError.isNotEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    passwordError,
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ),
              ),
            ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (BuildContext context, dynamic value, Widget? child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 18),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            emailEmpty = emailController.text.isEmpty; // Check if email is empty
                            passwordMismatch = passwordController.text != confirmpasswordController.text; // Check if passwords match
                          });

                          if (emailEmpty) {
                            setState(() {
                              emailError = "Please Input Your Email"; // Show email error
                            });
                          } else {
                            setState(() {
                              emailError = ''; // Clear email error if email is not empty
                            });
                          }

                          if (passwordMismatch) {
                            setState(() {
                              passwordError = "Passwords didn't match"; // Set the error message for password mismatch
                            });
                          } else {
                            setState(() {
                              passwordError = ''; // Clear password error if passwords match
                            });
                          }

                          if (!emailEmpty && !passwordMismatch) {
                            String email = emailController.text;
                            String password = passwordController.text;
                            // You can proceed with the signup logic here
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 120,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor:
                              value
                                  ? Colors.black
                                  : Colors.white, // Button background color
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: value ? Colors.white : Colors.black,
                          ), // Button text color
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    // "Don't Have An Account" text (not clickable)
                    Center(
                      child: Text(
                        "Already Have An Account?",
                        style: TextStyle(
                          color: value ? Colors.black : Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    // Sign Up (centered and clickable)
                    Center(
                      child: Material(
                        color: Colors.transparent, // No background color
                        child: InkWell(
                          onTap: () {
                            selectPageNotifier.value = 1;
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: value ? Colors.black : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
