import 'package:flutter/material.dart';

import 'custom_card.dart';

Widget buildCustomCard(
    {required String title,
    required String subTitle,
    required IconData leadingIcon,
    required IconData trailingIcon}) {
  return Card(
    elevation: 15,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    child: CustomCard(
      leadingIconButton: IconButton(onPressed: () {}, icon: Icon(leadingIcon)),
      title: Text(title),
      subtitle: Text(subTitle),
      trailingIconButton:
          IconButton(onPressed: () {}, icon: Icon(trailingIcon)),
    ),
  );
}
