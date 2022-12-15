// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.studentId,
    this.studentCode,
    this.studentName,
    this.mobileNumber,
    this.emailAddress,
    this.gender,
    this.ddobEnglish,
    this.dobNepali,
    this.permanentAddress,
    this.temporaryAddress,
    this.fatherName,
    this.fatherContactNumber,
    this.motherName,
    this.motherContactNumber,
    this.localGuardianName,
    this.localGuardianContactNumber,
  });

  int? studentId;
  String? studentCode;
  String? studentName;
  String? mobileNumber;
  String? emailAddress;
  String? gender;
  String? ddobEnglish;
  String? dobNepali;
  String? permanentAddress;
  String? temporaryAddress;
  String? fatherName;
  String? fatherContactNumber;
  String? motherName;
  String? motherContactNumber;
  String? localGuardianName;
  String? localGuardianContactNumber;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        studentId: json["StudentId"],
        studentCode: json["StudentCode"],
        studentName: json["StudentName"],
        mobileNumber: json["MobileNumber"],
        emailAddress: json["EmailAddress"],
        gender: json["Gender"],
        ddobEnglish: json["DDOBEnglish"],
        dobNepali: json["DOBNepali"],
        permanentAddress: json["PermanentAddress"],
        temporaryAddress: json["TemporaryAddress"],
        fatherName: json["FatherName"],
        fatherContactNumber: json["FatherContactNumber"],
        motherName: json["MotherName"],
        motherContactNumber: json["MotherContactNumber"],
        localGuardianName: json["LocalGuardianName"],
        localGuardianContactNumber: json["LocalGuardianContactNumber"],
      );

  Map<String, dynamic> toJson() => {
        "StudentId": studentId,
        "StudentCode": studentCode,
        "StudentName": studentName,
        "MobileNumber": mobileNumber,
        "EmailAddress": emailAddress,
        "Gender": gender,
        "DDOBEnglish": ddobEnglish,
        "DOBNepali": dobNepali,
        "PermanentAddress": permanentAddress,
        "TemporaryAddress": temporaryAddress,
        "FatherName": fatherName,
        "FatherContactNumber": fatherContactNumber,
        "MotherName": motherName,
        "MotherContactNumber": motherContactNumber,
        "LocalGuardianName": localGuardianName,
        "LocalGuardianContactNumber": localGuardianContactNumber,
      };
}
