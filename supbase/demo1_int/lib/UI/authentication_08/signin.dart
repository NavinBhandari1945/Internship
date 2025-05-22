import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/constants.dart';
import 'commonbutton.dart';
import 'commontextfield.dart';
import 'login.dart';

class Signin_08 extends StatefulWidget {
  const Signin_08({super.key});

  @override
  State<Signin_08> createState() => _Signin_08State();
}

class _Signin_08State extends State<Signin_08> {
  String? _userId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    supabase.auth.onAuthStateChange.listen((event){
      setState(() {
        _userId=event.session?.user.id;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var shortestval=MediaQuery.of(context).size.shortestSide;
    var widthval=MediaQuery.of(context).size.width;
    var heightval=MediaQuery.of(context).size.height;
    var namecont_sign_scrn=TextEditingController();
    var emailcont_signin_scrn=TextEditingController();
    var passwordcont_signin_scrn=TextEditingController();
    var addresscont_signin_scrn=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Signin form screen _08"),
      ),
      body: Container(
        width: widthval,
        height: heightval,
        color: Colors.red,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection:Axis.vertical,
                  child:
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 350,
                    height: 580,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(_userId==null?"No user sign in":"${_userId}",style: TextStyle(fontSize: 30),),

                        10.heightBox,

                        Container (
                            width: double.infinity,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child:
                              Align(
                                alignment: Alignment.center,
                                child:
                                Commonbutton("Signin with google",()async {
                                  try {
                                    const webClientId = '977219675241-pvqa45pa97iuuumvtpg6jvb3fvsfbd33.apps.googleusercontent.com';
                                    const iosClientId = '977219675241-2371s36febssid59q65gn7klrm2n9gkv.apps.googleusercontent.com';
                                    final GoogleSignIn googleSignIn = GoogleSignIn(
                                      clientId: iosClientId,
                                      serverClientId: webClientId,
                                    );
                                    final googleUser = await googleSignIn
                                        .signIn();
                                    final googleAuth = await googleUser!
                                        .authentication;
                                    final accessToken = googleAuth.accessToken;
                                    final idToken = googleAuth.idToken;

                                    if (accessToken == null) {
                                      throw 'No Access Token found.';
                                    }
                                    if (idToken == null) {
                                      throw 'No ID Token found.';
                                    }

                                    return supabase.auth.signInWithIdToken(
                                      provider: OAuthProvider.google,
                                      idToken: idToken,
                                      accessToken: accessToken,
                                    );

                                  }catch(E){
                                    print("Exception caaught while signin.");
                                    print(E.toString());
                                  }
                                },context),
                              ),
                            ),
                          ),
                        (5).heightBox,
                        Commonbutton("Login Screeen",() {

                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return Login_08();
                          },));
                        },context),




                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
