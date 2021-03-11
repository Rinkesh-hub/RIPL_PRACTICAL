import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dashBoard.dart';
import 'modal.dart';
class DataBase {
  DataBase._();
  static final DataBase db = DataBase._();
  bool alreadyExist = false;
  static Database _database;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<UserData> userData = <UserData>[];
  Future<Database> get database async {
    if (_database != null)
      return _database;

    ///if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE UserTable ("
          "id INTEGER PRIMARY KEY,"
          "fName TEXT,"
          "lName TEXT,"
          "email TEXT,"
          "password TEXT,"
          "gender INTEGER,"
          "dob TEXT"
          ")");
    });
  }

  insertData({String fName,lName,email,password,int gender,String dob,BuildContext context}) async {
    final SharedPreferences prefs = await _prefs;
    final db = await database;
    var select = await db.rawQuery("SELECT * FROM UserTable ");
    userData = select.toList().map((e) => UserData.fromMap(e)).toList();
    userData.forEach((element) {
      print(element.password);
      print(element.email);
      print(element.dob);
      print(element.gender.toString());
      if(element.email == email){

        alreadyExist = true;
      }

    });

    if(alreadyExist){
      alreadyExist = false;
      print("User Already Exist");


    } else{
      var res = await db.rawInsert(
          "INSERT Into UserTable (fName,lName,email,password,gender,dob)"" VALUES ('${fName}','${lName}','${email}','${password}','${gender}','${dob}')");
      print(res);
      prefs.setBool("isLoggedIn", true);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>
          DashB()), (Route<dynamic> route) => false);
      return res;
    }

  }

}