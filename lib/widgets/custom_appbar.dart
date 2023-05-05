import 'package:flutter/material.dart';
import 'package:whatsapp/utilities/colors.dart';

PreferredSizeWidget customAppBar({required String title}) {
  List items = [
    {
      "name":"Chats",
      "count":"32",
    },
    {
      "name":"Status",
      "count":"",
    },
    {
      "name":"Calls",
      "count":"",
    }
  ];
  var selected = 0;
  return AppBar(
    backgroundColor: appBg,
    elevation: 0,
    title: Text(
      title,
      style: TextStyle(
          color: whiteColor.withOpacity(0.5), fontWeight: FontWeight.w400),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.camera_alt_outlined,
          color: whiteColor.withOpacity(0.5),
          size: 30,
        ),
      ),
      IconButton(
          onPressed: () {},
          icon:
              Icon(Icons.search, color: whiteColor.withOpacity(0.5), size: 30)),
      IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert,
              color: whiteColor.withOpacity(0.5), size: 30)),
    ],
    bottom:
        PreferredSize(
            preferredSize: Size.fromHeight(60), 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.person)),
                    Container(
                      width: 120,
                      height: 4,
                      decoration: BoxDecoration(
                        color: primaryColor
                      ),
                    )
                  ],
                ),


                Column(
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.person)),
                    Container(
                      width: 120,
                      height: 4,
                      decoration: BoxDecoration(
                          color: primaryColor
                      ),
                    )
                  ],
                ),


                Column(
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.person)),
                    Container(
                      width: 120,
                      height: 4,
                      decoration: BoxDecoration(
                          color: primaryColor
                      ),
                    )
                  ],
                ),



              ],
            ),
        ),
  );
}
