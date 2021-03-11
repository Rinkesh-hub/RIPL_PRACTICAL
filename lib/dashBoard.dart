import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'constant.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class DashB extends StatefulWidget{
  @override
  _DashBState createState()=>_DashBState();
}
class _DashBState extends State<DashB>{
  var url ;//= "https://jsonplaceholder.typicode.com/posts";
  var data;

  @override
  void initState(){
    super.initState();
    getData();
  }

    getData() async{
    url = "https://jsonplaceholder.typicode.com/posts";
    var  res= await http.get(url),
     data=jsonDecode(res.body);
    print(data);
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: (){
              Constant.pref.setBool("isLoggedIn", false);
              Navigator.pushReplacementNamed(
                  context,"/login");
            },
          ),
        ],
        title: Text("DASH BOARD"),
      ),
      body: data!=null?
      ListView.builder(itemBuilder: (context,index){
        return Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(title: Text(data[index]["title"]),
            subtitle: Text("ID : ${data[index]["id"]}"),
           // leading: Image.network(data[index]["body"]),),
        ),);
      },
        itemCount: data.length,): Center(child:  CircularProgressIndicator(),),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add,)
        ,),
    );
  }
}