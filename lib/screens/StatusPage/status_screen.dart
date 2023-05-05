import 'package:flutter/material.dart';
import 'package:whatsapp/utilities/colors.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
          child: Center(
            child: Text('Status'),
          ),
      )
      
    );
  }
}
