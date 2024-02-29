import 'package:flutter/material.dart';
import 'package:novamax/home_page.dart';
import 'package:novamax/phone_login.dart';

Widget otpSentText(String text) {
  return Text(
    text,
    style: const TextStyle(
      color: Color(0xFF514F4F),
      fontSize: 12,
      fontWeight: FontWeight.w700,
      fontFamily: 'Poppins',
      letterSpacing: 0.24,
    ),
  );
}

Widget otpSubmitButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF2284F8),
      padding: const EdgeInsets.fromLTRB(22, 17, 22, 17),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    child: Image.asset('assets/images/next-arrow.png'),
  );
}

class PhoneOTP extends StatefulWidget {
  const PhoneOTP({super.key, required this.userNumber});

  final String userNumber;

  @override
  State<PhoneOTP> createState() => _PhoneOTPState();
}

class _PhoneOTPState extends State<PhoneOTP> {
  Widget otpInputField(String text) {
    return Container(
      height: 60,
      padding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: (30 - 14) / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFF848484),
          width: 0.5,
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: text,
          hintStyle: const TextStyle(
              fontSize: 14,
              color: Color(0xFFBCBCBC),
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          loginBackgroundImage(context),
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 74),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  logoImage('assets/images/novamax-logo.png'),
                  const SizedBox(height: 37),
                  otpSentText('OTP has been sent to mobile no.'),
                  const SizedBox(height: 17),
                  Text(
                    widget.userNumber,
                    style: const TextStyle(
                      color: Color(0xFF514F4F),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 27),
                  otpInputField('Enter your OTP here'),
                  const SizedBox(height: 27),
                  otpSubmitButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
