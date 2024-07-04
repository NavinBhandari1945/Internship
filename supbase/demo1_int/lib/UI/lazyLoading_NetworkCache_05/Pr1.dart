import 'package:demo1_int/Repository/Methods.dart';
import 'package:flutter/material.dart';

class Pr1_05 extends StatefulWidget {
  const Pr1_05({super.key});

  @override
  State<Pr1_05> createState() => _Pr1_05State();
}

class _Pr1_05State extends State<Pr1_05> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

      Center(child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            shape: BoxShape.circle
          ),
            child: Methods().getNetworkImage()
      )
      ),


    );
  }
}
