// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pathashala/model/login_response.dart';
import 'package:pathashala/services/login_service.dart';

import 'package:pathashala/screens/dashboard_screen.dart';

class LoginScreenApi extends StatefulWidget {
  const LoginScreenApi({super.key});

  @override
  State<LoginScreenApi> createState() => _LoginScreenApiState();
}

class _LoginScreenApiState extends State<LoginScreenApi> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // @override
  // void initState() {
  //   _emailController.value = TextEditingValue(text: "11391");
  //   _passwordController.value = TextEditingValue(text: "8f*MbC7+");
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text("Paathshala"),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network("https://softlabinc.com/images/logo/logo.png"),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: "Username"),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: const InputDecoration(hintText: "Password"),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () async {
                  LoginResponse? loginData = await login(
                    email: _emailController.text,
                    password: _passwordController.text,
                    context: context,
                  );

                  if (loginData!.userId > 0) {
                    if (loginData.status) {
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardPage()),
                      );
                    } else {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              "Your user account is inactive . Please contact your school/college")));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            "Wrong Username or Password. Please do check your credientials")));
                  }
                },
                child: const Text("Login"),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(colors: [
                      Colors.red,
                      Colors.redAccent,
                    ])),
                child: const Center(
                  child: Text(
                    "Apply For Admission",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              const Text(
                "Powered By Paathshala",
                style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
