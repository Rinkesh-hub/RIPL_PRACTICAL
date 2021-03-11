import 'package:flutter/material.dart';
import 'customPainter.dart';
import 'constant.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {
  String emailL;
  String passL;
   final emailController= new TextEditingController();
  @override
  bool _SecureText = true;
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          centerTitle: true,
          title: Text("RIPL",style:TextStyle(
            wordSpacing: 5.0,
            fontSize: 35.0,
          ),),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Center(
              child: SingleChildScrollView(
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      transform: Matrix4.rotationZ(0.05),
                      width: 300,
                      height: 100,
                      color: Colors.greenAccent,
                      child: Center(
                        child: Text("WELCOME", style: TextStyle(
                          fontSize: 40.0,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold,
                        ),),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: TextFormField(
                        controller: emailController,
                        validator: (value){
                          if(value.isEmpty || !value.contains("@")){
                            return 'Invalid Email';
                          }else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email Address",
                        labelText: "Email",
                      ),
                        onChanged: ( value){
                          this.emailL = value;
                        },
                      ),

                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 30.0),
                      child: TextFormField(
                        validator: (value){
                          if(value.isEmpty || value.length!=4){
                            return 'incorrect password';
                          }else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Password",
                          labelText: "Password",
                        ),
                        onChanged: ( value){
                          this.passL = value;
                        },
                        obscureText: _SecureText,
                        maxLength: 4,
                        keyboardType: TextInputType.number,),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 30.0),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        onPressed: () {
                          Constant.pref.setBool("isLoggedIn", true);
                          Navigator.pushReplacementNamed(context, "/dashB");
                        },
                        splashColor: Colors.yellow,
                        elevation: 5.0,
                        padding: EdgeInsets.symmetric(
                            horizontal: 60.0, vertical: 10.0),
                        color: Colors.lightBlueAccent,
                        child: Text("LOGIN",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 80,
                child: Stack(
                  children: <Widget>[
                    CustomPaint(
                      size: Size(MediaQuery
                          .of(context)
                          .size
                          .width, 80),
                      painter: LSCustomPainter(),
                    ),
                    Center(
                      heightFactor: 0.6,
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/register");
                        },
                        backgroundColor: Colors.lightGreenAccent,
                        child: Text
                          ("SignUp"),
                      ),
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
  }
