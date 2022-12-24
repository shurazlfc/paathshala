import 'package:flutter/material.dart';

import 'package:pathashala/screens/account_page.dart';
import 'package:pathashala/screens/test_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
          child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 2, crossAxisSpacing: 2),
        children: [
          //1st item
          Card(
            elevation: 5,
            child: SizedBox(
              width: 200,
              height: 80,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    Icons.school,
                    size: 50,
                  ),
                  const Text(
                    "Online Class",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              )),
            ),
          ),
          //2nd item
          Card(
            elevation: 5,
            child: SizedBox(
              width: 200,
              height: 80,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    Icons.note,
                    size: 50,
                  ),
                  const Text("Exam Result", style: TextStyle(fontSize: 20))
                ],
              )),
            ),
          ),
          //3rd item
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountPage()),
              );
            },
            child: Card(
              elevation: 5,
              child: SizedBox(
                width: 200,
                height: 80,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(
                      Icons.account_balance,
                      size: 50,
                    ),
                    const Text("Accounts", style: TextStyle(fontSize: 20))
                  ],
                )),
              ),
            ),
          ),
          //4th item
          Card(
            elevation: 5,
            child: SizedBox(
              width: 200,
              height: 80,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    Icons.assignment,
                    size: 50,
                  ),
                  const Text("Assignments", style: TextStyle(fontSize: 20))
                ],
              )),
            ),
          ),
          //5th item
          Card(
            elevation: 5,
            child: SizedBox(
              width: 200,
              height: 80,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    Icons.pan_tool,
                    size: 50,
                  ),
                  const Text("Attendence", style: TextStyle(fontSize: 20))
                ],
              )),
            ),
          ),
          //6th item
          Card(
            elevation: 5,
            child: SizedBox(
              width: 200,
              height: 80,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    Icons.book,
                    size: 50,
                  ),
                  const Text("Library", style: TextStyle(fontSize: 20))
                ],
              )),
            ),
          ),
        ],
      )),
    );
  }
}
