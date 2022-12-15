import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pathashala/model/profile_model.dart';
import 'package:pathashala/services/profile_services.dart';
import 'package:pathashala/services/school_services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/school_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isloaded = false;
  ProfileModel? profileinfodata;
  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  getProfileData() async {
    await ProfileServices().getProfileData().then((value) {
      setState(() {
        profileinfodata = value;
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
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
                      profileinfodata!.fatherName.toString(),
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
                      profileinfodata!.mobileNumber.toString(),
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
                      profileinfodata!.gender.toString(),
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
                      profileinfodata!.permanentAddress.toString(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
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
      //           children: [Text(profileinfodata[0].address.toString())],
      //         ),
      //       )
      //     : Center(child: CircularProgressIndicator()),

