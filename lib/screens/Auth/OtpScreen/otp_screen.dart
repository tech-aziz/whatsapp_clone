import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/components/navigates.dart';
import 'package:whatsapp/screens/HomePage/home_screen.dart';
import 'package:whatsapp/screens/SplashScreen/splash_screen.dart';

class OtpScreen extends StatelessWidget {
  final String number;
  final String verificationID;
  final int token;

  const OtpScreen(
      {Key? key,
      required this.number,
      required this.verificationID,
      required this.token})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final otpController = TextEditingController();
    final auth = FirebaseAuth.instance;
    return Scaffold(
      body: Center(
        child: TextField(
          controller: otpController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final loginData = PhoneAuthProvider.credential(
              verificationId: verificationID, smsCode: otpController.text);
          auth.signInWithCredential(loginData).then((value) {
            // navigate(context, HomeScreen());
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const SplashScreen()),
                (route) => false);
          });
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
