// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pathashala/model/account_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../constants/end_points.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int paidTotal = 0;
  int dueTotal = 0;

  bool isloaded = false;
  List<AccountModel>? accountinfodata = [];
  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  getProfileData() async {
    var data = await _fetchData();
    setState(() {
      accountinfodata = data;
      isloaded = true;
    });
  }

  Future<List<AccountModel>?> _fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String studentId = prefs.getString("studentId") ?? "";

    const String username = 'PaathshalaMobApp';
    const String password = 'P@@thSh@l@7474';

    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';

    var headers = <String, String>{
      'authorization': basicAuth,
      "Accept": "application/json"
    };

    var uri = Uri.parse(ApiEndPoints.fetchAccount + studentId);
    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      var json = response.body;
      var bodydata = jsonDecode(json);
      var data = bodydata;

      List<AccountModel> list = [];
      final items = data.ad;

      for (var item in items) {
        list.add(AccountModel.fromJson(item));
        final receiptNumber = item['ReceiptNumber'];
        double amount = item['Amount'];

        if (receiptNumber > 0) {
          setState(() {
            paidTotal += amount as int;
          });
        } else {
          setState(() {
            dueTotal += amount as int;
          });
        }

        return list;
      }

      return [];
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text(
                'Paid Total: $paidTotal',
                style: TextStyle(fontSize: 32),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Due Total: $dueTotal',
                style: TextStyle(fontSize: 32),
              ),
              Text(
                'Total: ',
                style: TextStyle(fontSize: 32),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Accounts"),
    //   ),
    //   body: accountinfodata == null
    //       ? Center(child: CircularProgressIndicator())
    //       : ListView.builder(
    //           itemCount: accountinfodata!.length,
    //           itemBuilder: (context, index) {
    //             return Card(
    //               child: Column(
    //                 children: [
    //                   Text(
    //                       ' Fee Name :${accountinfodata![index].feeName.toString()}'),
    //                   Text(accountinfodata![index].dateBS.toString()),
    //                   Text(accountinfodata![index].monthName.toString()),
    //                   Text(accountinfodata![index].amount.toString()),
    //                 ],
    //               ),
    //             );
    //           },
    //         ),
    // );
//   }
// }








// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<int> paid = [];
//   List<int> due = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }

//   void _fetchData() async {
//     final response = await http.get('https://example.com/api/data');
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       final receiptNumber = data['receiptNumber'];
//       final number1 = data['number1'];
//       final number2 = data['number2'];
//       final result = number1 + number2;
//       if (receiptNumber > 0) {
//         setState(() {
//           paid.add(result);
//         });
//       } else {
//         setState(() {
//           due.add(result);
//         });
//       }
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: paid.length + due.length,
//         itemBuilder: (context, index) {
//           if (index < paid.length) {
//             return Text(
//               'Paid: ${paid[index]}',
//               style: TextStyle(fontSize: 32),
//             );
//           } else {
//             return Text(
//               'Due: ${due[index - paid.length]}',
//               style: TextStyle(fontSize: 32),
//             );
//           }
//         },
//       ),
//     );
//   }
// }






//  Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: Card(
//                 elevation: 2.0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Column(
//                   // ignore: prefer_const_literals_to_create_immutables
//                   children: [
//                     Center(
//                       child: Text(
//                         'Summary',
//                         style: TextStyle(
//                             fontSize: 30.0,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.blue),
//                       ),
//                     ),
//                     Divider(),
//                     Text(
//                       'Total Paid    Amount = Rs 39,700',
//                       style: TextStyle(fontSize: 20, color: Colors.green),
//                     ),
//                     Divider(
//                       height: 20,
//                     ),
//                     Text(
//                       'Total Due     Amount = Rs 27,200',
//                       style: TextStyle(fontSize: 20, color: Colors.red),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             ListView.builder(
//               itemCount: accountinfodata.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(accountinfodata.feeStatus),
//                   subtitle: Text(data[index]['body']),
//                 );
//               },
//             )
//           ],
        





















      // body: isloaded
      //     ? Center(
      //         child: Column(
      //           children: [Text(accountinfodata[0].address.toString())],
      //         ),
      //       )
      //     : Center(child: CircularProgressIndicator()),

