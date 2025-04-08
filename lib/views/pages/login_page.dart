import 'package:fasionrecommender/data/notifiers.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            if (selectPageNotifier != 0) {
              selectPageNotifier.value = 0;
            }
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
              'Welcome Back!',
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
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail),
                labelText: 'Enter Your Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 24),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Enter Your Password',
              ),
            ),
            SizedBox(height: 12),
            ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (BuildContext context, dynamic value, Widget? child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Forgot Password text (left aligned)
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: value ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {},
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
                          'Sign In',
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
                        "Don't Have An Account?",
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
                            selectPageNotifier.value = 2;
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              'Sign Up',
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
