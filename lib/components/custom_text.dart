import 'package:flutter/material.dart';

Text customText({
  required String text,
  double? size,
  FontWeight? weight,
}) {
  return Text(
    text,
    style: TextStyle(fontSize: size ?? 16, fontWeight: weight ?? FontWeight.normal),
  );
}
