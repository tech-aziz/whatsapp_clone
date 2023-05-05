import 'package:flutter/material.dart';
import 'package:whatsapp/screens/CallsPage/calls_screen.dart';
import 'package:whatsapp/screens/ChatsPage/chats_screen.dart';
import 'package:whatsapp/screens/CommunityPage/community_screen.dart';
import 'package:whatsapp/screens/StatusPage/status_screen.dart';
import 'package:whatsapp/services/api_service.dart';
import 'package:whatsapp/utilities/colors.dart';
import '../../components/navigates.dart';
import '../../components/popup_items.dart';
import '../../utilities/config.dart';
import '../Settings/settings_screen.dart';

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
    const PopupMenuItem(child: Text('New group')),
    const PopupMenuItem(child: Text('New broadcast')),
    const PopupMenuItem(child: Text('Linked device')),
    const PopupMenuItem(child: Text('Starred message')),
    const PopupMenuItem(child: Text('Settings')),
  ];

  @override
  void initState() {
    getUserData();
    print('Index is ${tabController?.index}');
    tabController = TabController(
      initialIndex: 1,
      length: 4,
      vsync: this,
    )
      ..addListener(() {
        setState(() {
          switch (tabController?.index) {
            case 0:
            // favIcon = Icons.camera_alt_outlined;
              popUpItems = [
                popupMenuItem(
                    value: 0,
                    title: 'Settings',
                    child: Setting(),
                    context: context,
                    onTap: () {
                      print('Index 0 tapped');
                      showDialog(
                          context: context,
                          builder: (_) =>
                              AlertDialog(
                                title: Text('data'),
                              ));
                    })
              ];
              break;

            case 1:
              favIcon = Icons.chat;
              popUpItems = [
                popupMenuItem(
                    value: 0,
                    title: 'New group',
                    context: context,
                    onTap: () {
                      print('Index 1 Tapped');
                    }),
                popupMenuItem(
                    value: 1,
                    title: 'New broadcast',
                    context: context,
                    onTap: () {}),
                popupMenuItem(
                    value: 2,
                    title: 'Linked devices', context: context, onTap: () {}),
                popupMenuItem(
                    value: 3,
                    title: 'Starred messages', context: context, onTap: () {}),
                popupMenuItem(
                  value: 4,
                  title: 'Settings',
                  child: Setting(),
                  context: context,
                  onTap: () {},
                ),
              ];
              break;

            case 2:
              favIcon = Icons.camera_alt_rounded;
              popUpItems = [
                popupMenuItem(
                    value: 0,
                    title: 'Status privacy', context: context, onTap: () {}),
                popupMenuItem(
                    value: 1,
                    title: 'Settings',
                    child: Setting(),
                    context: context,
                    onTap: () {}),
              ];
              break;

            case 3:
              favIcon = Icons.call;
              popUpItems = [
                popupMenuItem(
                    value: 0,
                    title: 'Clear call log', context: context, onTap: () {}),
                popupMenuItem(
                    value: 1,
                    title: 'Settings',
                    child: ChatsScreen(),
                    context: context,
                    onTap: () {}),
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
            appName,
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
              onSelected: (result) {
                switch (tabController!.index) {
                  case 0:
                    switch (result) {
                      case 0:
                        navigate(context, Setting());
                        break;
                    }
                    break;
                  case 1:
                    switch (result) {
                      case 0:
                        print('New Group Tapped');
                        break;
                      case 1:
                        print('New broadcast tapped');
                        break;
                      case 2:
                        print('Linked Device tapped');
                        break;
                      case 3:
                        print('Starred message tapped');
                        break;
                      case 4:
                        navigate(context, Setting());
                    }
                }
              },
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
            : tabController!.index == 2
            ? Column(
          mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 45,
              width: 45,
              child: FloatingActionButton(
                backgroundColor: appBg,
                onPressed: () {},
                child: const Icon(
                  Icons.edit,
                  size: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(
              backgroundColor: primaryColor,
              onPressed: () {},
              child: Icon(favIcon),
            )
          ],
        )
            : FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {},
          child: Icon(favIcon),
        ));
  }
}
