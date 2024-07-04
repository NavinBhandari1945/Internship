import 'package:demo1_int/bloc/bloc_pr1/bloc_pr1_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import '../supabase_data_01/DeleteData.dart';
import '../supabase_data_01/InsertData.dart';
import '../supabase_data_01/UpdateData.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final widthval=MediaQuery.of(context).size.width;
    final heightval=MediaQuery.of(context).size.height;
    final shortestval=MediaQuery.of(context).size.shortestSide;
    return Scaffold(
        appBar: AppBar(
          title: Text("Bloc pr1 home screeen"),
        ),
        body:Container(
          height: 400,
          width: 500,
          child: Column(
            children:
            [

              Expanded(
                child: BlocBuilder<Pr1Bloc, Pr1State>(
                  builder: (context, state) {
                    if(state.list!.isEmpty){
                      return Text("list empty",style: TextStyle(fontSize: 30),);
                    }
                    else if(state.list!.isNotEmpty) {
                      return ListView.builder(
                        itemCount: state.list!.length,
                        itemBuilder: (context, index) =>
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
                                        child: Image.network(state.list![index]["photo"]),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(state.list![index]["id"].toString(),style: TextStyle(fontSize: 25),),
                                              Text(state.list![index]["name"].toString(),style: TextStyle(fontSize: 25)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(state.list![index]["price"].toString(),style: TextStyle(fontSize: 25)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                      );

                    }
                    else{
                      return Text("else list",style: TextStyle(fontSize: 30));
                    }

                  },
                ),
              ),

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
        )
    );
  }
}
