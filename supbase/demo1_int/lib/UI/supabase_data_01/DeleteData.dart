import 'package:demo1_int/bloc/bloc_pr1/bloc_pr1_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../Repository/Methods.dart';

class DeleteData extends StatefulWidget {
  const DeleteData({super.key});

  @override
  State<DeleteData> createState() => _DeleteDataState();
}

class _DeleteDataState extends State<DeleteData> {
  @override
  Widget build(BuildContext context) {
    final widthval=MediaQuery.of(context).size.width;
    final heightval=MediaQuery.of(context).size.height;
    final shortestval=MediaQuery.of(context).size.shortestSide;
    final id_cont=TextEditingController();
    return Scaffold(

      appBar: AppBar(
        title: Text("Insert Data Page"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:

          [


            Text("Insert Id",style: TextStyle(fontSize: 25)),
            TextFormField(
              controller: id_cont,
              decoration: InputDecoration (
                  contentPadding: EdgeInsets.symmetric(vertical:shortestval*0.03, horizontal:shortestval*0.03),
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: shortestval*0.07,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:Colors.black,
                      width: shortestval*0.006,
                    ),
                    borderRadius: BorderRadius.circular(shortestval*0.04),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(shortestval*0.04),
                    borderSide: BorderSide(
                      color:Colors.black,
                      width: shortestval*0.006,
                    ),
                  )
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Center(
              child: ElevatedButton(onPressed: (){
                Methods().deleteData(int.parse(id_cont.text.toString()));
                print("Delete data success");
                context.read<Pr1Bloc>().add(DeleteItem(id:int.parse(id_cont.text.toString())));
              }, child: Text("Delete.",style: TextStyle(fontSize: 25))),
            )
          ],
        ),


      ),


    );
  }
}
