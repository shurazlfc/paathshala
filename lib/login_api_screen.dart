import 'package:flutter/material.dart';
import 'package:pathashala/model/Login_response.dart';
import 'package:pathashala/services/login_serviece.dart';
import 'package:pathashala/services/profile_services.dart';
import 'package:pathashala/ui.dart';

class LoginScreenApi extends StatefulWidget {
  const LoginScreenApi({super.key});

  @override
  State<LoginScreenApi> createState() => _LoginScreenApiState();
}

class _LoginScreenApiState extends State<LoginScreenApi> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _emailController.value = TextEditingValue(text: "11391");
    _passwordController.value = TextEditingValue(text: "8f*MbC7+");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: "Username"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(hintText: "Password"),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () async {
                  LoginResponse? loginData = await login(
                    email: _emailController.text,
                    password: _passwordController.text,
                    context: context,
                  );

                  if (loginData!.userId > 0) {
                    if (loginData.status) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardPage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Please renew your subscription")));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Something went wrong")));
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 40,
                  child: const Text("Login "),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await ProfileServices().getProfileData();
                  //   context,
                  //   MaterialPageRoute(builder: (context) => DashboardPage()),
                  // );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 40,
                  child: const Text("get USer Data "),
                ),
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
