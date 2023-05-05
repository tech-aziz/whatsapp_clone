import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/custom_appbar.dart';
class NewGroup extends StatefulWidget {
  const NewGroup({Key? key}) : super(key: key);

  @override
  State<NewGroup> createState() => _NewGroupState();
}

class _NewGroupState extends State<NewGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: customAppBar(title: title),
    );
  }
}
