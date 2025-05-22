import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var shortestval=MediaQuery.of(context).size.shortestSide;
    var widthval=MediaQuery.of(context).size.width;
    var heightval=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile screen"),
      ),

      body:

      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container (
                  width: widthval*0.603,
                  height: heightval*0.303,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: Image.network("dcssd",
                      fit: BoxFit.fill,
                    ),
                  ),

          ElevatedButton(
              onPressed: (){

              },
              child: Text("Change photo")
          ),

        ],
      ),
    );
  }
}
