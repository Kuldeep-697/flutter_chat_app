import 'package:flutter/material.dart';
import 'package:novamax/data/introduction_data.dart';
import 'package:novamax/phone_login.dart';

Widget introBackgroundImage(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: Image.asset(
      'assets/images/intro-bg-image.jpeg',
      fit: BoxFit.fill,
    ),
  );
}

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  var currentIndex = 0;

  void nextWidget() {
    currentIndex++;
    setState(() {
      if (currentIndex == 4) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const PhoneLogin()),
        );
        currentIndex = 0;
      }
    });
  }

  Widget buildDot(int index) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == currentIndex
            ? const Color(0xFF2284F8)
            : const Color(0xFFD2D2D2),
      ),
    );
  }

  Widget buildButton() {
    if (currentIndex == 3) {
      return ElevatedButton(
        onPressed: nextWidget,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2284F8),
          padding: const EdgeInsets.symmetric(horizontal: 53, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(136.0),
          ),
        ),
        child: const Text(
          'Get Started',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
      );
    } else {
      return TextButton(
        onPressed: nextWidget,
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Skip Introduction',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF2284F8),
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.arrow_forward,
              color: Color(0xFF2284F8),
              size: 20.12,
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final images = IntroductionData.images[currentIndex];
    final titles = IntroductionData.titles[currentIndex];
    final descriptions = IntroductionData.descriptions[currentIndex];

    return Scaffold(
      body: Stack(children: [
        introBackgroundImage(context),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                Image.asset(
                  images,
                  width: 219.579,
                  height: 219.505,
                ),
                Text(
                  titles,
                  style: const TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  descriptions,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF808080),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 45),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) => buildDot(index)),
                ),
                const Spacer(),
                buildButton(),
                const Spacer(),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
