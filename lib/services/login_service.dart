import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pathashala/model/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<LoginResponse?> login(
    {required String email,
    required String password,
    required BuildContext context}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  try {
    http.Response response = await http
        .post(Uri.parse('http://demoapi.paathshala.com.np/api/login'), body: {
      "username": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      List<LoginResponse> login = [];
      for (var d in data) {
        login.add(LoginResponse.fromJson(d));
      }

      prefs.setString("userId", login[0].userId.toString()); //first
      return login[0]; //first
    } else {}
  } catch (e) {
    rethrow;
  }
  return null;
}
