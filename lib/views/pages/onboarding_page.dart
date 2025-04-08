import 'package:fasionrecommender/data/notifiers.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentIndex = 0;
  int counter = 0;

  final List<String> titles = [
    'Create your own style now',
    'Style Smarter, Slay Everyday',
    'Customize. Plan.\nOwn Your Look.',
  ];

  final List<String> subtitles = [
    'Mix it. Match it. Slay it.',
    'Upload your wardrobe, get daily outfit inspiration,\nand slay every occasion with confidence.\nMix & Slay helps you style smart — based on weather, events, and your own aesthetic.',
    'Get personalized recommendations for any event — from casual to chic, we’ve got you covered!',
  ];

  final List<TextStyle> titleStyles = [
    TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: Colors.white),
    TextStyle(fontSize: 36, fontWeight: FontWeight.w600, color: Colors.white),
    TextStyle(fontSize: 38, fontWeight: FontWeight.w500, color: Colors.white),
  ];

  final List<TextStyle> subtitleStyles = [
    TextStyle(fontSize: 16, fontStyle: FontStyle.normal, color: Colors.white),
    TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.white),
    TextStyle(fontSize: 16, fontStyle: FontStyle.normal, color: Colors.white),
  ];

  void _nextText(BuildContext context) {
    if (counter < 2) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % titles.length;
        counter++;
      });
    } else {
      selectPageNotifier.value = 1; // Navigate to LoginPage after the 3rd click
    }
  }

  void _goBack(BuildContext context) {
    if (counter > 0) {
      setState(() {
        _currentIndex = (_currentIndex - 1 + titles.length) % titles.length;
        counter--;
      });
    } else {
      Navigator.pop(context); // Go back to the previous page
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Allows content behind the appbar
      appBar: AppBar(
        title: const Text('Welcome'),
        centerTitle: true,
        //backgroundColor: Colors.transparent
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed:
              _currentIndex == 0
                  ? null // disables the button visually and functionally
                  : () => _goBack(context),
        ),
        backgroundColor: Colors.transparent
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/onboard-bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 75.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    titles[_currentIndex],
                    textAlign: TextAlign.center,
                    style: titleStyles[_currentIndex],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitles[_currentIndex],
                    textAlign: TextAlign.center,
                    style: subtitleStyles[_currentIndex],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => _nextText(context),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Continue'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
