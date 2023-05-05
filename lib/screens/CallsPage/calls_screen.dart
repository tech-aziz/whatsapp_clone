import 'package:flutter/material.dart';
import 'package:whatsapp/utilities/colors.dart';

import '../../services/api_service.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({Key? key}) : super(key: key);

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
          if (snapshot.hasData) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: primaryColor),
                      child: const Icon(
                        Icons.link,
                        color: Colors.white,
                      ),
                    ),
                    title: const Text(
                      'Create call link',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Share a link for your WhatsApp call'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text('Recent'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ListView.builder(
                    itemCount: 20,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      final data = snapshot!.data?.users![index];
                      return ListTile(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (_) => ChatDetails(
                          //         name: '${data.firstName} ${data.lastName}',
                          //         avatar: data.image!)));
                        },
                        leading: CircleAvatar(
                          backgroundColor: primaryColor,
                          backgroundImage: NetworkImage(data!.image.toString()),
                        ),
                        title: Row(
                          children: [
                            Text('${data.firstName} ${data.lastName}'),
                            const Spacer(),
                            Icon(
                              Icons.call,
                              color: primaryColor,
                            )
                          ],
                        ),
                        subtitle: Text('${data.phone}'),
                      );
                    },
                  ),
                ],
              ),
            );
          }
          return Text(snapshot.error.toString());
        },
      ),
    );
  }
}
