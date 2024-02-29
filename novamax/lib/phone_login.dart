import 'package:flutter/material.dart';
import 'package:novamax/phone_otp.dart';
import 'package:flutter/services.dart';

Widget loginBackgroundImage(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: Image.asset(
      'assets/images/login-bg-image.jpeg',
      fit: BoxFit.fill,
    ),
  );
}

Widget logoImage(String imagePath) {
  return Image.asset(
    imagePath,
    width: 160,
    height: 47,
  );
}

Widget welcomeText(String text) {
  return Text(
    text,
    style: const TextStyle(
      color: Color(0xFF1E1E1E),
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: 'Poppins',
    ),
  );
}

Widget descripition(String text) {
  return Text(
    text,
    style: const TextStyle(
      color: Color(0xFF514F4F),
      fontSize: 10,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
    ),
  );
}

Widget phoneInputLabel(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 12,
      color: Color(0xFF848484),
      fontWeight: FontWeight.w500,
    ),
  );
}

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({super.key});

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final TextEditingController _phoneNumberController = TextEditingController();
  bool _showNumError = false;
  bool isChecked = false;

  void _validatePhoneNumber() {
    setState(() {
      _showNumError = _phoneNumberController.text.length != 10;
    });
  }

  @override
  void initState() {
    super.initState();
    _phoneNumberController.addListener(_validatePhoneNumber);
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  Widget loginInputField(String text) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFF848484),
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          const Text(
            '+91',
            style: TextStyle(
                fontSize: 14,
                color: Color(0xFFBCBCBC),
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins'),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.digitsOnly,
              ],
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
          ),
        ],
      ),
    );
  }

  Widget termsAndConditions() {
    return Row(
      children: [
        Transform.scale(
          scale: 0.8,
          child: Checkbox(
            value: isChecked,
            activeColor: Colors.black,
            onChanged: (bool? value) {
              setState(() {
                isChecked = !isChecked;
              });
            },
          ),
        ),
        const Text(
          'I have read and accept the',
          style: TextStyle(
            fontSize: 10,
            color: Color(0xFF848484),
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(width: 5),
        const Text(
          'Terms & Conditions*',
          style: TextStyle(
            fontSize: 10,
            color: Color(0xFF1E1E1E),
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }

  Widget getOtpButton() {
    return ElevatedButton(
      onPressed: () {
        String phoneNumber = _phoneNumberController.text;

        if (phoneNumber.length != 10 && !isChecked) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text('Please enter number and accept terms and conditions.'),
            ),
          );
          return;
        } else if (phoneNumber.length != 10) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please enter a 10-digit number.'),
            ),
          );
          return;
        } else if (!isChecked) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please accept terms and conditions.'),
            ),
          );
          return;
        }

        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => PhoneOTP(userNumber: phoneNumber)),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2284F8),
        padding: const EdgeInsets.fromLTRB(22, 17, 22, 17),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      child: const Text(
        'Get OTP',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          fontFamily: 'Poppins',
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
                  const SizedBox(height: 18),
                  welcomeText('Welcome!'),
                  const SizedBox(width: 8),
                  descripition(
                      'Indias No. 1 Air Coolers Manufacturer & Distributor '),
                  const SizedBox(height: 21.37),
                  phoneInputLabel('Enter Number'),
                  const SizedBox(height: 8),
                  loginInputField('Enter your phone number'),
                  const SizedBox(height: 5),
                  if (_showNumError)
                    const Text(
                      ' Please enter a 10-digit number *',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 10,
                      ),
                    ),
                  const SizedBox(height: 15),
                  termsAndConditions(),
                  const SizedBox(height: 24),
                  getOtpButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
