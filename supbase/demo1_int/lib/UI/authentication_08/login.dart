import 'package:demo1_int/UI/authentication_08/Home.dart';
import 'package:demo1_int/UI/authentication_08/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'commonbutton.dart';
import 'commontextfield.dart';

class Login_08 extends StatefulWidget {
  const Login_08({super.key});

  @override
  State<Login_08> createState() => _Login_08State();
}

class _Login_08State extends State<Login_08> {

  @override
  Widget build(BuildContext context) {
    var shortestval=MediaQuery.of(context).size.shortestSide;
    var widthval=MediaQuery.of(context).size.width;
    var heightval=MediaQuery.of(context).size.height;
    var sizeval=MediaQuery.of(context).size.shortestSide;
    var emailcontrollerval_auth_screen=TextEditingController();
    var passwordcont_auth_scr=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Authentication screen"),
      ),
      body:
      Container(
        width:widthval,
        height:heightval,
        color: Colors.red,
        child:Center(
          child: Container(
            width: 350,
            height: 420,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Commontextfield("Email","abcd123@gmail.com",false, emailcontrollerval_auth_screen, context),
                (5).heightBox,
                "Enter password".text.color(CupertinoColors.black).size(25).make(),
                Container(
                  height:heightval*0.08,
                  child:
                  TextFormField(
                    controller: passwordcont_auth_scr,
                    obscureText:true,
                    style: TextStyle(fontSize: shortestval*0.07),
                    decoration: InputDecoration (
                        contentPadding: EdgeInsets.symmetric(vertical:shortestval*0.03, horizontal:shortestval*0.03),
                        hintText: "xxxxx",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: shortestval*0.07,

                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: CupertinoColors.black,
                            width: shortestval*0.006,
                          ),
                          borderRadius: BorderRadius.circular(shortestval*0.04),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(shortestval*0.04),
                          borderSide: BorderSide(
                            color: CupertinoColors.black,
                            width: shortestval*0.006,
                          ),
                        )
                    ),
                  ),
                ),

                // Commontextfield("Password", "Xxx123@", true, passwordcont_auth_scr, context),
                (10).heightBox,

                Container (
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    child:
                      Commonbutton ("Login ",
                              ()async {},context
                      ),
                    ),

                SizedBox(height: 20,),

                Container(
                  width: double.infinity,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Commonbutton("Signup",(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>Signin_08(),));
                    },context),
                  ),
                ),
                (sizeval*0.03).heightBox,
                Text("Don't have an account Signup",
                  style: TextStyle(color: Colors.black,fontSize:20),
                ),
                (5).heightBox,
                Commonbutton("Home Screen",() {

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Home_08();
                  },));
                },context),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
