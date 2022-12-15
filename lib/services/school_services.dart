// ignore_for_file: empty_catches

import 'dart:convert';

import 'package:pathashala/model/school_model.dart';
import 'package:http/http.dart' as http;
import 'package:pathashala/services/end_points.dart';

class SchoolInfoServices {
  Future<List<SchoolModel>> getSchoolData() async {
    try {
      var uri = Uri.parse(ApiEndPoints.fetchSchoolInfo);
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var json = response.body;
        var bodydata = jsonDecode(json) as List;

        List<SchoolModel> list = [];
        for (var element in bodydata) {
          list.add(SchoolModel.fromJson(element));
        }
        return list;
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}



// var uri = Uri.parse('http://demoapi.paathshala.com.np/api/schoolinfo');
