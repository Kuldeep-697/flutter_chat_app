import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webrtc_chat/businessLayer/global.dart' as global;
import 'package:webrtc_chat/businessLayer/global.dart';
import 'package:webrtc_chat/home_screen.dart';
import 'package:webrtc_chat/login_screen.dart';
import 'package:webrtc_chat/model/checkotpNewModel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _isUserLoggedIn();
  }

  Future<void> _isUserLoggedIn() async {
    var data;
    var duration = const Duration(seconds: 2);
    global.sp = await SharedPreferences.getInstance();
    data = global.sp.getString('currentUser');

    print('Your data is . . . . . \n$data');
    await Future.delayed(Duration.zero);

    data = null;

    Timer(duration, () async {
      if (data != null) {    
        CheckotpNewModel mCurrrentUserModel = CheckotpNewModel.fromJson( 
          jsonDecode(data)
        );

        global.currentUserData = mCurrrentUserModel;

        print('currentUserData . . . . . +/n $currentUserData');

        Navigator.push(
        context!,
        MaterialPageRoute(builder: (context) => HomeScreen(
          id : mCurrrentUserModel.checkotpNew!.user?.id ?? '',
          name :  mCurrrentUserModel.checkotpNew!.user!.name ?? '',
          token : mCurrrentUserModel.checkotpNew!.accessToken!,
        )),
      );
      } 
      else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginWithUsernameScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/login-bg-image.jpeg'),
        //     fit: BoxFit.fill
        //   ),
        // ),
        child: Center(
          child: SizedBox(
            height: 120,
            width: 120,
            child: Image.network(
              'https://oneprocrm-s3-dev.s3.ap-south-1.amazonaws.com/units/QjCqlk7Y1GEORvHEYVviV2lJGVwERIZ81v0rIPCd.jpg',
            ),
          ),
        ),
      ),
    );
  }
}
