import 'package:dummy_project/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  void moveToHome() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset('assets/images/login.png', fit: BoxFit.cover),
              const SizedBox(height: 20),
              Text(
                "Welcome $name",
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Username :",
                          hintText: "Enter your name",
                          labelStyle: TextStyle(fontSize: 18),
                          hintStyle: TextStyle(fontSize: 18),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'username cannot be empty';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        }),
                    const SizedBox(height: 30),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password :",
                        hintText: "Enter your password",
                        labelStyle: TextStyle(fontSize: 18),
                        hintStyle: TextStyle(fontSize: 18),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'password cannot be empty';
                        } else if (value.length < 6) {
                          return 'password should atleast contain 6 words';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: moveToHome,
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: changeButton
                            ? 50
                            : 150, // agar true hai toh width 150 se 50 ho jaae
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(
                              changeButton ? 50 : 8), // radius
                        ),
                        child: changeButton
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
