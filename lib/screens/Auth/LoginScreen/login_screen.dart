import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:whatsapp/components/size_box.dart';
import 'package:whatsapp/screens/Auth/OtpScreen/otp_screen.dart';
import 'package:whatsapp/utilities/colors.dart';

import '../../../components/navigates.dart';
import '../../../utilities/config.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final size = MediaQuery.of(context).size.width;
    final textController = TextEditingController();
    return Scaffold(
      backgroundColor: appBg,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: appBg,
        centerTitle: true,
        title: Text(
          verifyNbr,
          style: const TextStyle(fontSize: 17),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_sharp))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the \nindustry\'s standard dummy text ever since the 1500s.',
                textAlign: TextAlign.center,
                style: TextStyle(color: whiteColor.withOpacity(.6)),
              ),
              sizeBox(10, 0),
              IntlPhoneField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  filled: true,
                  fillColor: whiteColor,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.transparent)),
                ),
                initialCountryCode: 'BD',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
              InkWell(
                onTap: () {
                  auth.verifyPhoneNumber(
                      phoneNumber: '+880${textController.text}',
                      verificationCompleted: (info) {
                        print('Verification Complete $info');
                      },
                      verificationFailed: (value) {
                        print(value);
                      },
                      codeSent: (String varificationID, int? token) {
                        print(varificationID);
                        print(token);
                        navigate(
                            context,
                            OtpScreen(
                              number: textController.text,
                              verificationID: varificationID,
                              token: token!,
                            ));
                      },
                      codeAutoRetrievalTimeout: (value) {
                        print(value);
                      });
                  // navigate(context, OtpScreen(number: textController.text));
                },
                child: Container(
                  width: size * .2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Center(
                      child: Text(
                        'NEXT',
                        style: TextStyle(color: whiteColor),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                textAlign: TextAlign.center,
                style: TextStyle(color: whiteColor.withOpacity(.6)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
