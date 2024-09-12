import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:webrtc_chat/businessLayer/apiHelper.dart';
import 'package:webrtc_chat/businessLayer/global.dart' as global;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webrtc_chat/businessLayer/query_document_provider.dart';
import 'package:webrtc_chat/home_screen.dart';
import 'package:webrtc_chat/model/CurrentUserNovMax.dart';
import 'package:webrtc_chat/model/checkotpNewModel.dart';

import 'package:jwt_decode/jwt_decode.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart'; // Import for JWT manipulation

class LoginWithUsernameScreen extends StatefulWidget {
  const LoginWithUsernameScreen({super.key});

  @override
  State<LoginWithUsernameScreen> createState() => _LoginWithUsernameScreenState();
}

class _LoginWithUsernameScreenState extends State<LoginWithUsernameScreen> {

  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  bool? isUserID;
  bool? isPassword;
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUserIdTextField(),
                _buildPasswordTextField(),
                const SizedBox(height: 45),
                _buildSubmitButton(),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserIdTextField() {
    return Card(
      elevation: 5,
      child: Container(
        height: 42,
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: TextField(
          textCapitalization: TextCapitalization.characters,
          onChanged: (value) {
            setState(() {
              isUserID = value.isNotEmpty;
            });
          },
          controller: controllerPhone,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.person_rounded, color: Colors.grey, size: 20),
            border: InputBorder.none,
            filled: false,
            hintText: 'Enter User ID',
            hintStyle: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Card(
      elevation: 5,
      child: Container(
        height: 42,
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: TextField(
          onChanged: (value) {
            setState(() {
              isPassword = value.isNotEmpty;
            });
          },
          controller: controllerPassword,
          textAlignVertical: TextAlignVertical.center,
          obscureText: !_passwordVisible,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock, color: Colors.grey, size: 20),
            suffixIcon: IconButton(
              iconSize: 20,
              icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off, color: Colors.black),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
            border: InputBorder.none,
            filled: false,
            hintText: 'Enter Password',
            hintStyle: const TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          if (isUserID == true && isPassword == true) {
            userLogin(controllerPhone.text, controllerPassword.text);
          }
        },
        child: Container(
          width: 100,
          height: 44,
          decoration: BoxDecoration(
            color: isUserID == true && isPassword == true ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              'Submit',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: isUserID == true && isPassword == true ? Colors.white : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<QueryResult> userLogin(String username, String password) async {
    print('Login started here . . . . .');

    final variable = {
      "device_id": "deviceData",
      "userName": username,
      "platform": "Android/iOS Technical",
      "token": 'abcd',
      "password": password
    };

    QueryResult result = await DatabaseUtils().client.value.query(
      QueryOptions(
        document: gql(context.queries!.loginAccount()),
        variables: variable,
      ),
    ).onError((error, stackTrace) {
      print(error);
      throw "error";
    });

    if (result.data!['dealer_login']['status'] == 200) {
      CurrentUserNovMax mCurrrentUserModel = CurrentUserNovMax.fromJson(
        result.data!['dealer_login'],
      );

      String token = mCurrrentUserModel.accessToken!;
      Map<String, dynamic> payload = Jwt.parseJwt(token);

      String userId = payload['sub'];
      payload['user_id'] = userId; // Update the payload with user_id

      String updatedToken = encodeTokenWithUpdatedPayload(payload, token);

      print('userId...................................\n $userId');

      // Save the user data globally
      CheckotpNewModel data = CheckotpNewModel(
        checkotpNew: mCurrrentUserModel,
      );
      global.currentUserData = data;
      global.sp.setString('currentUser', json.encode(data.toJson()));

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            id: userId,
            name: mCurrrentUserModel.user!.name ?? '',
            token: updatedToken, // Pass the updated token to HomeScreen
          ),
        ),
      );
    } else {
      global.sp.clear();
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.clear();
      global.baseUrl = global.baseUrlbackup;
      global.mainbaseUrl = global.mainbaseUrlbackup;
    }
    return result;
  }

  // Method to encode token with updated payload
  String encodeTokenWithUpdatedPayload(Map<String, dynamic> payload, String originalToken) {
    final jwt = JWT(payload);
    final token = jwt.sign(SecretKey('your_secret_key')); 
    return token;
  }
}
