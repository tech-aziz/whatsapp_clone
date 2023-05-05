
import 'package:flutter/material.dart';

Future<Object?> navigate(context, child) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => child));
}
