import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pathashala/services/school_services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/school_model.dart';

class SchoolPage extends StatefulWidget {
  const SchoolPage({super.key});

  @override
  State<SchoolPage> createState() => _SchoolPageState();
}

class _SchoolPageState extends State<SchoolPage> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "Can't lauch url";
    }
  }

  bool isloaded = false;
  List<SchoolModel> schoolinfoData = [];
  @override
  void initState() {
    super.initState();
    getSchoolData();
  }

  getSchoolData() async {
    await SchoolInfoServices().getSchoolData().then((value) {
      setState(() {
        schoolinfoData = value;
        isloaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloaded
          ? Column(
              children: [
                Container(
                  height: 150,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/1.png"),
                        fit: BoxFit.contain),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // ignore: prefer_const_constructors
                      gradient: LinearGradient(colors: [
                        Colors.blue,
                        Colors.blue,
                      ])),
                  child: Center(
                    child: Text(
                      "Details",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        Colors.red,
                        Colors.purple,
                      ])),
                  child: Center(
                    child: Text(
                      schoolinfoData[0].schoolName.toString(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        Colors.red,
                        Colors.purple,
                      ])),
                  child: Center(
                    child: Text(
                      schoolinfoData[0].address.toString(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        Colors.red,
                        Colors.purple,
                      ])),
                  child: Center(
                    child: Text(
                      schoolinfoData[0].contactNumber.toString(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        Colors.red,
                        Colors.purple,
                      ])),
                  child: Center(
                    child: Text(
                      schoolinfoData[0].emailAddress.toString(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    _launchURL("www.avn.edu.np");
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          Colors.red,
                          Colors.purple,
                        ])),
                    child: Center(
                      child: Text(
                        schoolinfoData[0].website.toString(),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}




      // body: isloaded
      //     ? Center(
      //         child: Column(
      //           children: [Text(schoolinfoData[0].address.toString())],
      //         ),
      //       )
      //     : Center(child: CircularProgressIndicator()),

