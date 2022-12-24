import 'dart:convert';

import 'package:pathashala/model/profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:pathashala/constants/end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';

class URLS {}

class ProfileServices {
  Future<ProfileModel?> getProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("userId") ?? "";
    const String username = 'PaathshalaMobApp';
    const String password = 'P@@thSh@l@7474';

    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';

    var headers = <String, String>{
      'authorization': basicAuth,
      "Accept": "application/json"
    };
    try {
      var uri = Uri.parse(ApiEndPoints.fetchProfileInfo + userId);
      var response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        var data = response.body;

        var bodydata = jsonDecode(data);

        ProfileModel item = ProfileModel.fromJson(bodydata);
        prefs.setString("studentId", item.studentId.toString());
        return item;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
