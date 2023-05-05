import 'package:flutter/material.dart';
import 'package:whatsapp/utilities/colors.dart';

class ChatDetails extends StatelessWidget {
  final String name;
  final String avatar;

  const ChatDetails({Key? key, required this.name, required this.avatar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appBg,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back,size: 20)),
                const SizedBox(
                  width: 6,
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(avatar),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                    const Text('last seen today 3:12 pm',
                        style: TextStyle(
                          fontSize: 12,
                        )),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.videocam_rounded,size: 20,),
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.call,size: 20),
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.more_vert,size: 20)
              ],
            )
          ],
        ),
      ),
    );
  }
}
