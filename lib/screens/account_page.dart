// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'dart:ui';

import 'package:collection/collection.dart';
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
  double? dueTotal;
  double _paidTotal = 0;
  double _paidDue = 0;
  List<double>? _dueTotal;
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
  void didChangeDependencies() {
    _getDueAmount();
    super.didChangeDependencies();
  }

  Amount? _getDueAmount() {
    double? _dueAmountt;
    double? _paidAmount;

    if (accountinfodata != null) {
      accountinfodata!.forEach((e) {
        if (e.receiptNumber == '0') {
          _dueAmountt = _paidDue += e.amount!;
        } else {
          _paidAmount = _paidTotal += e.amount!;
        }
      });
      return Amount(
        dueAmount: _dueAmountt,
        paidAmount: _paidAmount,
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accounts"),
      ),
      body: accountinfodata == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Text(
                  _getDueAmount()!.dueAmount.toString(),
                ),
                Text(
                  _getDueAmount()!.paidAmount.toString(),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: accountinfodata!.length,
                    itemBuilder: (context, index) {
                      if (accountinfodata?[index].receiptNumber != '0') {
                        _paidTotal += accountinfodata?[index].amount as double;
                        // paidTotal += data[index]['amount'];
                      } else {
                        _paidDue += accountinfodata?[index].amount as double;
                        // dueTotal += data[index]['amount'];
                      }

                      accountinfodata!.forEach((e) {
                        if (e.receiptNumber == '0') {
                          _paidDue += e.amount!;
                        } else {
                          _paidTotal += e.amount!;
                        }
                      });
                      log(_paidDue.toString());

                      // accountinfodata!.where((element) {

                      // });
                      // accountinfodata?.forEach(
                      //   (e) {
                      //     if (e.receiptNumber == "0") {
                      //       _dueTotal?.add(e.amount ?? 0);
                      //     }
                      //   },
                      // );

                      // log(_dueTotal.toString());

                      return Card(
                        child: Column(
                          children: [
                            Text(
                                ' Fee Name :${accountinfodata![index].feeName.toString()}'),
                            Text(accountinfodata![index].dateBS.toString()),
                            Text(accountinfodata![index].monthName.toString()),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
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

class Amount {
  final double? dueAmount;
  final double? paidAmount;

  Amount({
    this.dueAmount,
    this.paidAmount,
  });
}
