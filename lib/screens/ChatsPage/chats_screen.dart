import 'package:flutter/material.dart';
import 'package:whatsapp/models/user_model.dart';
import 'package:whatsapp/services/api_service.dart';
import 'package:whatsapp/utilities/colors.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getUserData(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      final data = snapshot.data!.users![index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: primaryColor,
                          backgroundImage: NetworkImage(data.image!),
                        ),
                        title: Row(
                          children: [
                            Text('${data.firstName} ${data.lastName}'),
                            Spacer(),
                            Text(
                              '5:23 PM',
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        subtitle: Text('${data.ip}'),
                      );
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
