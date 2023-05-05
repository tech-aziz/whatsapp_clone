import 'package:flutter/material.dart';
import 'package:whatsapp/utilities/colors.dart';

PreferredSizeWidget customAppBar(String title, BuildContext context) {
  return AppBar(
    leading: InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back,
        color: Colors.white,
        size: 25,
      ),
    ),
    title: const Text('Settings'),
    backgroundColor: Color(0xff075E54),
  );
}
