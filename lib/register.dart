import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ripl_rinkesh_practical/service.dart';
import 'modal.dart';
class RegitF extends StatefulWidget{
  @override
  _RegitFState createState()=>_RegitFState();
}
class _RegitFState extends State<RegitF>{
  String fName;
  String lName;
  String email;
  String password;
  String rePassword;
  String dob;
  int gender = 1;
  static DateTime selectedDate = new DateTime.now();
  @override
  void initState() {
    super.initState();
    DataBase.db.initDB();
  }
  String _formattdate= new  DateFormat.yMd().format(selectedDate);

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;

      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("REGISTRATION"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (value){
                    if(value.isEmpty ){
                      return 'First Name required';
                    }else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "First Name",
                  ),
                  onChanged: ( value){
                    this.fName = value;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  validator: (value){
                    if(value.isEmpty ){
                      return 'Last Name required';
                    }else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Last Name",
                  ),
                  onChanged: ( value){
                    this.lName = value;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  validator: (value){
                    if(value.isEmpty || !value.contains("@")){
                      return 'Invalid Email';
                    }else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email ID",
                  ),
                  onChanged: ( value){
                    this.email = value;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  validator: (value){
                    if(value.isEmpty || value.length!=4){
                      return 'Invalid password';
                    }else{
                      return null;
                    }
                  },
                  obscureText: true,
                  maxLength: 4,
                  keyboardType: (TextInputType.number),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                  ),
                  onChanged: ( value){
                    this.password = value;
                  },

                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Re Enter Password",
                  ),
                  onChanged: ( value){
                    this.rePassword = value;
                  },
                ),
                SizedBox(
                  height: 5.0,
                ),
                InkWell(child: Text(_formattdate.toString(),style: TextStyle(
                  fontSize: 20.0,
                ),),onTap: (){
                  setState(() {
                    _selectDate(context);
                  });
                },),
                SizedBox(
                  height: 10.0,
                ),
                Text("Select date of Birth"),
                SizedBox(
                  height: 10.0,
                ),
                RadioListTile(title: Text("Male"),value: 1, groupValue: gender, onChanged: (val){

                  setState(() {
                    gender = val;
                  });
                }),
                RadioListTile(title: Text("Female"),value: 2, groupValue: gender, onChanged: (val){
                  setState(() {
                    gender = val;
                  });
                }),
                SizedBox(
                  height: 5.0,
                ),
                MaterialButton(
                  shape: StadiumBorder(),
                  onPressed: () {
                    if(password !=rePassword){
                      print("please match the password");
                    } else
                    if(fName != null || lName !=null ||password!=null  ){
                      print("Inserted");
                      DataBase.db.insertData(fName:fName,lName:lName,email: email,password: password,dob: selectedDate.toString(),gender: gender,context: context);
                      Navigator.pushReplacementNamed(context, "/dashB");
                    }
                    else{
                    }
                  },
                  splashColor: Colors.yellow,
                  elevation: 5.0,
                  padding: EdgeInsets.symmetric(
                      horizontal: 60.0, vertical: 10.0),
                  color: Colors.lightBlueAccent,
                  child: Text("SUBMIT",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}