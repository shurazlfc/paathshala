// To parse this JSON data, do
//
//     final schoolModel = schoolModelFromJson(jsonString);

import 'dart:convert';

List<SchoolModel> schoolModelFromJson(String str) => List<SchoolModel>.from(json.decode(str).map((x) => SchoolModel.fromJson(x)));

String schoolModelToJson(List<SchoolModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SchoolModel {
    SchoolModel({
        required this.schoolName,
        required this.address,
        required this.contactNumber,
        required this.emailAddress,
        required this.website,
    });

    String schoolName;
    String address;
    String contactNumber;
    String emailAddress;
    String website;

    factory SchoolModel.fromJson(Map<String, dynamic> json) => SchoolModel(
        schoolName: json["SchoolName"],
        address: json["Address"],
        contactNumber: json["ContactNumber"],
        emailAddress: json["EmailAddress"],
        website: json["Website"],
    );

    Map<String, dynamic> toJson() => {
        "SchoolName": schoolName,
        "Address": address,
        "ContactNumber": contactNumber,
        "EmailAddress": emailAddress,
        "Website": website,
    };
}
