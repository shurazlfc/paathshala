import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pathashala/model/account_model.dart';
import 'package:pathashala/constants/end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';

class URLS {}

class AccountServices {
  Future<List<AccountModel>?> getAccountData() async {
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

      for (var d in data) {
        list.add(AccountModel.fromJson(d));
      }
      return list;
    }

    return [];
  }
}
