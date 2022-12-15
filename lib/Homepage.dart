import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pathashala/card_item.dart';
import 'package:pathashala/model/school_model.dart';

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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                children: [
                  Icon(
                    Icons.school,
                    size: 50,
                  ),
                  Text(
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
                children: [
                  Icon(
                    Icons.note,
                    size: 50,
                  ),
                  Text("Exam Result", style: TextStyle(fontSize: 20))
                ],
              )),
            ),
          ),
          //3rd item
          Card(
            elevation: 5,
            child: SizedBox(
              width: 200,
              height: 80,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_balance,
                    size: 50,
                  ),
                  Text("Accounts", style: TextStyle(fontSize: 20))
                ],
              )),
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
                children: [
                  Icon(
                    Icons.assignment,
                    size: 50,
                  ),
                  Text("Assignments", style: TextStyle(fontSize: 20))
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
                children: [
                  Icon(
                    Icons.pan_tool,
                    size: 50,
                  ),
                  Text("Attendence", style: TextStyle(fontSize: 20))
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
                children: [
                  Icon(
                    Icons.book,
                    size: 50,
                  ),
                  Text("Library", style: TextStyle(fontSize: 20))
                ],
              )),
            ),
          ),
        ],
      )),
    );
  }
}
