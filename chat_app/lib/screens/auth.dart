import 'dart:io';
import 'package:chat_app/widget/user_image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _form = GlobalKey<FormState>();
  var _isLogin = true;
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _enteredUsername = '';
  File? _selectedImage;
  var _isAuthenticating = false;

  void _submit() async {
    final isValid = _form.currentState!.validate();

    if (!isValid || !_isLogin && _selectedImage == null) {
      return;
    }
    else {
      _form.currentState!.save();
    }    

    try {
      setState(() {
        _isAuthenticating = true;
      });

      // Login existing user 
      if (_isLogin) {
        await _firebase.signInWithEmailAndPassword(
          email: _enteredEmail, 
          password: _enteredPassword
        );
      }
      // Create user if dont exist 
      else {
        final userCredential = await _firebase.createUserWithEmailAndPassword(
          email: _enteredEmail, 
          password: _enteredPassword
        );  

        // Store user image to Firebase Storage
        final storageRef = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child('${userCredential.user!.uid}.jpg');

        // Upload image to Firebase Storage
        await storageRef.putFile(_selectedImage!);

        // Get the download URL of the uploaded image
        final imageUrl = await storageRef.getDownloadURL();

        // Store user information including username, email, and image URL to Firestore database
        FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
            'username': _enteredUsername,
            'email': _enteredEmail,
            'image_url': imageUrl
          });
      }

    } 
    on FirebaseAuthException catch (error) {
      String errorMessage = 'Authentication failed.';

      if (error.code == 'email-already-in-use') {
        errorMessage = 'The email address is already in use.';
      } 
      else if (error.code == 'invalid-email') {
        errorMessage = 'Invalid email address.';
      } 
      else if (error.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      }
      else if (error.code == 'wrong-password') {
        errorMessage = 'Incorrect password.';
      }

      ScaffoldMessenger.of(context).clearSnackBars();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        )
      );

      // if error occurs it continously shows circular progress bar 
      //so to stop it we set _isAuthenticating to false
      setState(() {
        _isAuthenticating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 130,
                margin: const EdgeInsets.only(
                  top: 30, 
                  bottom: 20, 
                  left: 20, 
                  right: 20
                ),
                child: Image.asset('assets/images/chat.png'),
              ),
              Card(
                margin: const EdgeInsets.only(left : 24, right : 24),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Form(
                    key: _form,
                    child: Column(
                      children: [
                        if (!_isLogin)
                          UserImagePicker(
                            onPickImage: (pickedImage) {
                              _selectedImage = pickedImage;
                            },
                          ),

                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Email Address'
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            if (value == null ||  value.trim().isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredEmail = value!;
                          },
                        ),

                        if (!_isLogin)
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'username'
                            ),
                            enableSuggestions: false,
                            validator: (value) {
                              if (value == null ||  value.isEmpty || value.trim().length < 4) {
                                return 'Please enter at least 4 characters.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredUsername = value!;
                            },
                          ),

                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.trim().length < 6) {
                              return 'Password must be atleast 6 digit long ';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredPassword = value!;
                          },
                        ),

                        const SizedBox(height: 12),

                        if (_isAuthenticating)
                          const CircularProgressIndicator(),

                        if (!_isAuthenticating)
                          ElevatedButton(
                            onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.primary
                            ),
                            child: Text(_isLogin ? 'Login' : 'Signup')
                          ),

                        if (!_isAuthenticating)
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Text(
                              _isLogin
                                ? 'Create an account'
                                : 'I already have an account'
                            )
                          )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
