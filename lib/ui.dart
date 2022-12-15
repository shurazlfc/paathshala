import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pathashala/Homepage.dart';
import 'package:pathashala/profile_page.dart';
import 'package:pathashala/school_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int index = 0;
  final screens = [
    HomePage(),
    SchoolPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notification_important)),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.person),
                            title: Text("Profile"),
                          ),
                          ListTile(
                            leading: Icon(Icons.person),
                            title: Text("Mode"),
                          ),
                          ListTile(
                            leading: Icon(Icons.person),
                            title: Text("Help"),
                          ),
                          ListTile(
                            leading: Icon(Icons.person),
                            title: Text("Help"),
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString("userId", "");
                            },
                          ),
                        ],
                      );
                    });
              },
              icon: Icon(Icons.settings))
        ],
        backgroundColor: Colors.blueAccent,
        title: Center(child: Text("Paathashala")),
      ),
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        iconPadding: 20,
        color: Colors.blue,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.blueAccent,
        items: [
          CurvedNavigationBarItem(
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              label: 'Home',
              labelStyle: TextStyle(color: Colors.white)),
          CurvedNavigationBarItem(
              child: Icon(
                Icons.house,
                color: Colors.white,
              ),
              label: 'School',
              labelStyle: TextStyle(color: Colors.white)),
          CurvedNavigationBarItem(
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: 'Profile',
              labelStyle: TextStyle(color: Colors.white)),
        ],
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}


 //  bottomNavigationBar: NavigationBarTheme(
      //    data: NavigationBarThemeData(indicatorColor: Colors.grey),
      //    child: NavigationBar(height: 50,
      //    selectedIndex: index,
      //    onDestinationSelected: (index)=>
      //    setState(()=>this.index=index) ,
      //    backgroundColor: Colors.blueGrey,
      //     destinations: [
      //     NavigationDestination(icon: Icon(Icons.add_to_home_screen_sharp), label: 'Home'),
      //      NavigationDestination(icon: Icon(Icons.home), label: 'School'),
      //       NavigationDestination(icon: Icon(Icons.account_box), label: 'Profile'),
      //    ]),
      //  ),
// onDestinationSelected: (index)=>
//        setState(()=>this.index=index) ,