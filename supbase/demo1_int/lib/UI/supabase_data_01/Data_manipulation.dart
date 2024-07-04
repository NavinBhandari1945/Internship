import 'package:demo1_int/UI/supabase_data_01/DeleteData.dart';
import 'package:demo1_int/UI/supabase_data_01/InsertData.dart';
import 'package:demo1_int/UI/supabase_data_01/UpdateData.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Data_manipulation extends StatefulWidget {
  const Data_manipulation({super.key});

  @override
  State<Data_manipulation> createState() => _Data_manipulationState();
}

class _Data_manipulationState extends State<Data_manipulation> {
  @override
  Widget build(BuildContext context) {
    final widthval=MediaQuery.of(context).size.width;
    final heightval=MediaQuery.of(context).size.height;
    final shortestval=MediaQuery.of(context).size.shortestSide;
    return Scaffold(
      appBar: AppBar(
        title: Text("Data manipulation page."),
      ),
      body: Container(
        child:Column(
          children:
          [

            Container(
              height: 50,
              width: widthval,
              child: Center(child: Text("Insert data",style: TextStyle(fontSize: 25))),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ).onTap(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return InsertData();
              },));

            }),

            SizedBox(
              height: 5,
            ),

            Container(
              height: 50,
              width: widthval,
              child: Center(child: Text("Delete data",style: TextStyle(fontSize: 25))),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ).onTap(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DeleteData();
              },));

            }),

            SizedBox(
              height: 5,
            ),

            Container(
              height: 50,
              width: widthval,
              child: Center(child: Text("Update data",style: TextStyle(fontSize: 25))),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ).onTap(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return UpdateData();
              },));

            }),

            SizedBox(
              height: 5,
            ),

          ],
        ),
      ),
    );
  }
}
