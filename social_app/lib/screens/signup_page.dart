import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              const Text(
                'Sign up',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFD8D8D8)),
              ),

               const Spacer(),

              const SizedBox(
                height: 52,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    filled: true,
                    fillColor: AppColors.white,
                    border: InputBorder.none,
                    labelStyle: TextStyle(color: Color(0xFF1F305E)),
                  ),
                  cursorColor: Color(0xFF1F305E),
                ),
              ),

              const SizedBox(height: 18),

              SizedBox(
                height: 52,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: AppColors.white,
                    border: InputBorder.none,
                    labelStyle: const TextStyle(color: Color(0xFF1F305E)),
                    suffixIcon: GestureDetector(
                      onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          }
                        );
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: const Color(0xFF1F305E),
                        size: 22,
                      ),
                    ),
                  ),
                  obscureText: _obscureText,
                  cursorColor: const Color(0xFF1F305E),
                ),
              ),

              const SizedBox(height: 18),

              const SizedBox(
                height: 52,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Firstname',
                    filled: true,
                    fillColor: AppColors.white,
                    border: InputBorder.none,
                    labelStyle: TextStyle(color: Color(0xFF1F305E)),
                  ),
                  cursorColor: Color(0xFF1F305E),
                ),
              ),

              const SizedBox(height: 18),

              const SizedBox(
                height: 52,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Lastname',
                    filled: true,
                    fillColor: AppColors.white,
                    border: InputBorder.none,
                    labelStyle: TextStyle(color: Color(0xFF1F305E)),
                  ),
                  cursorColor: Color(0xFF1F305E),
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFFBD512)),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                        const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    )),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
