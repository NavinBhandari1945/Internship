import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Home_09 extends StatefulWidget {
  const Home_09({super.key});

  @override
  State<Home_09> createState() => _Home_09State();
}

class _Home_09State extends State<Home_09> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home_09"),
      ),
      body: Center(
        child: Container(
          child:
          Shimmer.fromColors(
            baseColor: Colors.blueAccent,
            highlightColor: Colors.brown,
            child: Text('hello',style: TextStyle(
              fontSize: 45,
            ),),
          ),
        ),
      ),
    );
  }
}
