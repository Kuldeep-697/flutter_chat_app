import 'package:flutter/material.dart';
import 'package:social_app/config/app_icons.dart';
import 'package:social_app/config/app_routes.dart';
import 'package:social_app/config/app_strings.dart';
import 'package:social_app/styles/app_colors.dart';
import '../components/app_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                AppStrings.helloWelcome,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFD8D8D8)),
              ),
              const SizedBox(height: 16),
              const Text(
                AppStrings.loginToContinue,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFD8D8D8)),
              ),
              const Spacer(),
              const AppTextField(                
                labelTitle: AppStrings.username,
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 52,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: AppStrings.password,
                    filled: true,
                    fillColor: AppColors.white,
                    border: InputBorder.none,
                    labelStyle: const TextStyle(color: Color(0xFF1F305E)),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
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
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    AppStrings.forgotPassword,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFC2C2C2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.mainPage);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFFBD512)),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                        const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                    child: const Text(
                      AppStrings.login,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    )),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text(
                  AppStrings.orSignInWith,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFD8D8D8),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFFFFFFF)),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                        const EdgeInsets.symmetric(vertical: 12),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppIcons.google,
                            width: 20, height: 20),
                        const SizedBox(width: 8),
                        const Text(
                          AppStrings.loginWithGoogle,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFFFFFFFF),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                      const EdgeInsets.symmetric(vertical: 12),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppIcons.facebook,
                          width: 20, height: 20),
                      const SizedBox(width: 8),
                      const Text(
                        AppStrings.loginWithFacebook,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppStrings.dontHaveAccount,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFA7A7A7),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.signup);
                      },
                      child: const Text(
                        AppStrings.signup,
                        style: TextStyle(
                          color: Color(0xFFFBD512),
                          decoration: TextDecoration.underline,
                        ),
                      ))
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
