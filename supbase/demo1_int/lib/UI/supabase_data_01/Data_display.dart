import 'package:demo1_int/Repository/Methods.dart';
import 'package:flutter/material.dart';

class DataDisplayApp extends StatefulWidget {
  const DataDisplayApp({super.key});
  @override
  State<DataDisplayApp> createState() => _DataDisplayAppState();
}

class _DataDisplayAppState extends State<DataDisplayApp> {

  late Future<List<Map<String, dynamic>>> _dataFuture;
  @override
  void initState() {
    super.initState();
    _dataFuture =Methods().readData();
  }
  @override
  Widget build(BuildContext context) {
    final widthval=MediaQuery.of(context).size.width;
    final heightval=MediaQuery.of(context).size.height;
    final shortestval=MediaQuery.of(context).size.shortestSide;
    return Scaffold(
      appBar: AppBar(
        title: Text("Data display app"),
      ),
      body:

      Container(
        height: heightval,
        width: widthval,
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _dataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No data available'));
            } else {
              List<Map<String, dynamic>> data = snapshot.data!;
                  return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                  return
                    Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Container(
                  height: 100,
                  width: widthval,
                  decoration: BoxDecoration(
                  color: Colors.grey,
                  ),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Expanded(
                  child: Container(
                  child: Image.network(data[index]["photo"]),
                  ),
                  ),
                  Expanded(
                  child: Center(
                  child: Container(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(data[index]["id"].toString(),style: TextStyle(fontSize: 25),),
                  Text(data[index]["name"].toString(),style: TextStyle(fontSize: 25)),
                  ],
                  ),
                  ),
                  ),
                  ),
                  Expanded(
                  child: Text(data[index]["price"].toString(),style: TextStyle(fontSize: 25)),
                  )
                  ],
                  ),
                  ),
                  );


                  },
                  );

            }
          },
        ),
      ),


    );
  }


}
