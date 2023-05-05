import 'package:flutter/material.dart';
import 'package:whatsapp/screens/CallsPage/calls_screen.dart';
import 'package:whatsapp/screens/ChatsPage/chats_screen.dart';
import 'package:whatsapp/screens/CommunityPage/community_screen.dart';
import 'package:whatsapp/screens/StatusPage/status_screen.dart';
import 'package:whatsapp/services/api_service.dart';
import 'package:whatsapp/utilities/colors.dart';
import '../../components/popup_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController? tabController;
  PageController? pageController;

  var favIcon = Icons.chat;
  List<PopupMenuEntry<dynamic>> popUpItems = [
    const PopupMenuItem(child: Text('Settings')),
  ];

  @override
  void initState() {
    // TODO: implement initState
    getUserData();
    print('Index is ${tabController?.index}');
    tabController = TabController(
      initialIndex: 1,
      length: 4,
      vsync: this,
    )..addListener(() {
        setState(() {
          switch (tabController?.index) {
            case 0:
              // favIcon = Icons.camera_alt_outlined;
              popUpItems = [popupMenuItem(title: 'Settings')];
              break;

            case 1:
              favIcon = Icons.chat;
              popUpItems = [
                popupMenuItem(title: 'New group'),
                popupMenuItem(title: 'New broadcast'),
                popupMenuItem(title: 'Linked devices'),
                popupMenuItem(title: 'Starred messages'),
                popupMenuItem(title: 'Settings'),
              ];
              break;

            case 2:
              favIcon = Icons.camera_alt_rounded;
              popUpItems = [
                popupMenuItem(title: 'Status privacy'),
                popupMenuItem(title: 'Settings'),
              ];
              break;

            case 3:
              favIcon = Icons.call;
              popUpItems = [
                popupMenuItem(title: 'Clear call log'),
                popupMenuItem(title: 'Settings'),
              ];
              break;
          }
        });
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: appBg,
          elevation: 0,
          title: Text(
            'WhatsApp',
            style: TextStyle(
                color: whiteColor.withOpacity(0.5),
                fontWeight: FontWeight.w400),
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
                icon: Icon(Icons.search,
                    color: whiteColor.withOpacity(0.5), size: 30)),
            PopupMenuButton(
              color: whiteColor,
              icon: Icon(
                Icons.more_vert,
                color: whiteColor.withOpacity(0.5),
              ),
              itemBuilder: (BuildContext context) => popUpItems,
            ),
          ],
          bottom: TabBar(
            isScrollable: false,
            indicatorColor: primaryColor,
            controller: tabController,
            tabs: const [
              Tab(
                child: Icon(Icons.person_sharp),
              ),
              Tab(
                child: Text('Chats'),
              ),
              Tab(
                child: Text('Status'),
              ),
              Tab(
                child: Text('Calls'),
              ),
            ],
          ),
        ),
        body: Center(
          child: TabBarView(controller: tabController, children: const [
            CommunityScreen(),
            ChatsScreen(),
            StatusScreen(),
            CallsScreen()
          ]),
        ),
        floatingActionButton: tabController!.index == 0
            ? Container()
            : FloatingActionButton(
                backgroundColor: primaryColor,
                onPressed: () {},
                child: Icon(favIcon),
              ));
  }

// Widget customFloatingAction() {
//   return FloatingActionButton(
//     backgroundColor: primaryColor,
//     child: Icon(favIcon),
//     onPressed: () {
//       switch (tabController!.index) {
//         case 0:
//           // tabController!.index == 0 ? Container():Container();
//           break;
//
//         case 1:
//           FloatingActionButton(
//             onPressed: () {},
//             child: Icon(favIcon),
//           );
//           break;
//
//         case 2:
//           FloatingActionButton(
//             onPressed: () {},
//             child: Icon(favIcon),
//           );
//           break;
//
//         case 3:
//           FloatingActionButton(
//             onPressed: () {},
//             child: Icon(favIcon),
//           );
//           break;
//       }
//     },
//   );
// }
}
