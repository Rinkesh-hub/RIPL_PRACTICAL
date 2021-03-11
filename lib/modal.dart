/// UserDataModel.dart
import 'dart:convert';

UserData userDataFromJson(String str) {
  final jsonData = json.decode(str);
  return UserData.fromMap(jsonData);
}

String userDataToJson(UserData data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class UserData {
  int id;
  String fName;
  String lName;
  String email;
  String password;
  String gender;
  String dob;


  UserData({
    this.id,
    this.fName,
    this.lName,
    this.email,
    this.password,
    this.gender,
    this.dob,

  });

  factory UserData.fromMap(Map<String, dynamic> json) => new UserData(
    id: json["id"],
    fName: json["fName"],
    lName: json["lName"],
    email: json["email"],
    password: json["password"],
    gender: json["gender"],
    dob: json["dob"]
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "fName": fName,
    "lName": lName,
    "email": email,
    "password": password,
    "gender": gender,
    "dob": dob,
  };
}