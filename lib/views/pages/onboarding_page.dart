import 'package:fasionrecommender/data/notifiers.dart';
import 'package:fasionrecommender/views/pages/login_page.dart';
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

  void _nextText(BuildContext context) {
    if (counter < 2) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % titles.length;
        counter++;
      });
    } else {
      selectPageNotifier.value = 1;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      ); // Navigate to LoginPage
    }
  }

  void _goBack(BuildContext context) {
    if (counter > 0) {
      setState(() {
        _currentIndex = (_currentIndex - 1 + titles.length) % titles.length;
        counter--;
      });
    } else {
      Navigator.pop(context); // Optional
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width >= 600;
    double titleSize = isTablet ? 48 : 36;
    double subtitleSize = isTablet ? 20 : 16;
    double buttonPadding = isTablet ? 32 : 16;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Welcome'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _currentIndex == 0 ? null : () => _goBack(context),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/onboard-bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        titles[_currentIndex],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: titleSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        subtitles[_currentIndex],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: subtitleSize,
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () => _nextText(context),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: buttonPadding * 5,
                            vertical: buttonPadding,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Continue'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
