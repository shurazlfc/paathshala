import 'dart:convert';

import 'package:pathashala/model/profile_model.dart';
import 'package:pathashala/model/school_model.dart';
import 'package:http/http.dart' as http;
import 'package:pathashala/services/end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';

class URLS {}

class ProfileServices {
  Future<ProfileModel?> getProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("userid") ?? "";
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
        var json = response.body;
        var bodydata = jsonDecode(json);

        ProfileModel item = ProfileModel.fromJson(bodydata);
        return item;
        //11391 //
        //8f*MbC7+//
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}


//     final response = await http.get('${URLS.base_url}/UserInfo/v1/GetUserInfo',
//         headers: headers);

//     if (response.statusCode == 200) {
//       final jsonResponse = json.decode(response.body);
//       return new UserInfo.fromJson(jsonResponse);
//     } else {
//       throw Exception('Failed to load data!');
//     }
//   }
// }
