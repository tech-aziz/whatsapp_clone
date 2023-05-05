import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Text title;
  final Text subtitle;
  final IconButton leadingIconButton;
  final IconButton trailingIconButton;

  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leadingIconButton,
    required this.trailingIconButton,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 15,
      child: ListTile(
        leading: leadingIconButton,
        title: title,
        subtitle: subtitle,
        trailing: trailingIconButton,
      ),
    );
  }
}
