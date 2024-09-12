import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.launchURL});

  String phoneNumber = '';
  final Function() launchURL;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 36.0, right: 36.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/bijli_login.png'),
              const SizedBox(height: 36),
              const Text(
                'OTP Verification',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E1E1E)),
              ),
              const SizedBox(height: 18),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'We will send you a ',
                      style: TextStyle(
                          color: Color(0xFF909090),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: 'One Time Password ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(
                      text: 'on this registered mobile number',
                      style: TextStyle(
                          color: Color(0xFF909090),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Enter Phone Number',
                ),
                onChanged: (value) {
                  phoneNumber = value;
                },
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: launchURL,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0C8CE9),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: const Center(
                      child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

