import 'package:flutter/material.dart';
import 'package:whatsapp/screens/Auth/LoginScreen/login_screen.dart';

import '../../../components/navigates.dart';
import '../../../components/size_box.dart';
import '../../../utilities/colors.dart';
import '../../../utilities/config.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appBg,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Welcome to $appName',
                style: TextStyle(
                  color: whiteColor.withOpacity(.9),
                  fontSize: 28,
                ),
              ),
              CircleAvatar(
                radius: size * .3,
                backgroundImage: AssetImage(welcomeImage),
              ),
              Column(
                children: [
                  Text(
                    welcomeText,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: whiteColor.withOpacity(.4)),
                  ),
                  sizeBox(15, 0),
                  InkWell(
                    onTap: (){
                      navigate(context, const LoginScreen());
                    },
                    child: Container(
                      width: size * .8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: primaryColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Center(
                          child: Text('AGREE AND CONTINUE',
                              style: TextStyle(
                                  color: whiteColor
                              )),
                        ),
                      ),
                    ),
                  ),
                  sizeBox(50, 0),
                  Column(
                    children: [
                      Text(
                        'from',
                        style: TextStyle(color: whiteColor.withOpacity(0.5)),
                      ),
                      sizeBox(5, 0),
                      Text('FACEBOOK',
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                          )),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
