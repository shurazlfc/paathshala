// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pathashala/model/account_model.dart';

import 'package:pathashala/services/account_services.dart';



class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int? total;
  int? dueTotal;
  int? paid;
  bool isloaded = false;
  List<AccountModel>? accountinfodata = [];
  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  getProfileData() async {
    var data = await AccountServices().getAccountData();
    setState(() {
      
      accountinfodata = data;
      isloaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accounts"),
      ),
      body: accountinfodata == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: accountinfodata!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Text(
                          ' Fee Name :${accountinfodata![index].feeName.toString()}'),
                      Text(accountinfodata![index].dateBS.toString()),
                      Text(accountinfodata![index].monthName.toString()),
                      Text(accountinfodata![index].amount.toString()),
                    ],
                  ),
                );
              },
            ),
    );
  }
}





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

