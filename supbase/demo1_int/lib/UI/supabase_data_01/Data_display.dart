import 'package:demo1_int/Repository/Methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataDisplayApp extends StatefulWidget {
  const DataDisplayApp({super.key});
  @override
  State<DataDisplayApp> createState() => _DataDisplayAppState();
}

class _DataDisplayAppState extends State<DataDisplayApp> {
  late Future<List<Map<String, dynamic>>> _dataFuture;
  final search_cont=TextEditingController();
  late List<Map<String, dynamic>> _displayedData;
  bool _sortAscending = true; // Default sort order
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
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _sortAscending = !_sortAscending;
                _sortData();
              });
            },
            icon: Icon(_sortAscending ? Icons.arrow_upward : Icons.arrow_downward),
          ),
        ],
      ),
      body:

      Container(
        height: heightval,
        width: widthval,
        child:
        Column(
          children: [
            TextFormField(

                onChanged: (value) {
                  setState(() {
                  });

              },
              controller:search_cont,
              decoration: InputDecoration (
                  contentPadding: EdgeInsets.symmetric(vertical:shortestval*0.03, horizontal:shortestval*0.03),
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: shortestval*0.07,
                  ),
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CupertinoColors.black,
                      width: shortestval*0.011,
                    ),
                    borderRadius: BorderRadius.circular(shortestval*0.04),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(shortestval*0.04),
                    borderSide: BorderSide(
                      color: CupertinoColors.black,
                      width: shortestval*0.011,
                    ),
                  )
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Expanded(
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
                    _displayedData=data;
                    _sortData();
                     return  ListView.builder(
                       itemCount: search_cont.text.isEmpty?_displayedData.length:1,
                       itemBuilder: (context, index) {
                         if(data[index]["id"].toString().contains(search_cont.text.toString().trim())){
                           return  Padding(
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
                                       child:
                                           Methods().getNetworkImagePr(_displayedData[index]["photo"]),
                                     ),
                                   ),
                                   Expanded(
                                     child: Center(
                                       child: Container(
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text(_displayedData[index]["id"].toString(),style: TextStyle(fontSize: 25),),
                                             Text(_displayedData[index]["name"].toString(),style: TextStyle(fontSize: 25)),
                                           ],
                                         ),
                                       ),
                                     ),
                                   ),
                                   Expanded(
                                     child: Text(_displayedData[index]["price"].toString(),style: TextStyle(fontSize: 25)),
                                   )
                                 ],
                               ),
                             ),
                           );
                         }
                         else{
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
                         child:
                         Methods().getNetworkImagePr(_displayedData[index]["photo"]),
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
                         }

                       },
                     );
                  }
                },
              ),
            ),
          ],
        ),
      ),


    );
  }

  void _sortData() {
    // Sort _displayedData based on current sorting order and criteria
    _displayedData.sort((a, b) {
      if (_sortAscending) {
        return a["id"].compareTo(b["id"]);
      } else {
        return b["id"].compareTo(a["id"]);
      }
    });
  }



}



