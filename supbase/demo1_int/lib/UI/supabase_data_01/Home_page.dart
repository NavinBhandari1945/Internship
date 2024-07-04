import 'package:demo1_int/Repository/Methods.dart';
import 'package:demo1_int/UI/supabase_data_01/Data_display.dart';
import 'package:demo1_int/UI/supabase_data_01/Data_manipulation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:velocity_x/velocity_x.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final widthval=MediaQuery.of(context).size.width;
    final heightval=MediaQuery.of(context).size.height;
    final shortestval=MediaQuery.of(context).size.shortestSide;
    return
      Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        height: heightval,
        child:Column(
          children: [

            Container(
              height: 50,
              width: widthval,
              child: Center(child: Text("Data dispilay UI",style: TextStyle(fontSize: 25))),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ).onTap(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DataDisplayApp();
              },));
              
            }),

            SizedBox(
              height: 5,
            ),

            Container(
              height: 50,
              width: widthval,
              child: Center(child: Text("Data manipulation UI",style: TextStyle(fontSize: 25))),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ).onTap(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Data_manipulation();
              },));
            }),

            SizedBox(
              height: 5,
            ),

            Container(
              height: 50,
              width: widthval,
              child: Center(child: Text("Add Data In Hive",style: TextStyle(fontSize: 25))),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ).onTap(() async{

              List<Map<String, dynamic>> data = await Methods().readData();
              if (data.isNotEmpty) {
                await Methods().saveDataInHive(data);
                print('Data saved in Hive successfully');
              } else {
                print('No data fetched from Supabase');
              }

              // Print data from Hive after saving
              List<Map<String, dynamic>> hiveData = Methods().getDataFromHive();
              print('Data from Hive:');
              hiveData.forEach((item) {
                print(item);
              });


            }),
          ],
        ),
      ),
    );
  }
}
