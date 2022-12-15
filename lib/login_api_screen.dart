import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:pathashala/constants/app_constants.dart';
import 'package:pathashala/injector.dart';
import 'package:pathashala/model/Login_response.dart';
import 'package:pathashala/ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenApi extends StatefulWidget {
  const LoginScreenApi({super.key});

  @override
  State<LoginScreenApi> createState() => _LoginScreenApiState();
}

class _LoginScreenApiState extends State<LoginScreenApi> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<LoginResponse?> login(String email, password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  
    try {
    
      Response response = await post(
          Uri.parse('http://demoapi.paathshala.com.np/api/login'),
          body: {
            "username": email,
            "password": password,
          });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        var endpoint = data['userId'];
        var loginData = LoginResponse.fromJson(data);
        prefs.setString("userId", endpoint);
        // locator<SharedPreferences>()
        //     .setString(AppConstants.userId, loginData.userId.toString());

        if (data[0]["Status"] is bool && data[0]["Status"]) {
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Invalid username or password")));
          return null;
        }
      } else {}
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(hintText: "Username"),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: (() {
                login(_emailController.toString(),
                    _passwordController.toString());
              }),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardPage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 40,
                  child: const Text("Login "),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [
                    Colors.red,
                    Colors.redAccent,
                  ])),
              child: Center(
                child: Text(
                  "Apply For Admission",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              "Powered By Paathshala",
              style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
            ),
          ],
        ),
      ),
    );
  }
}
