import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../Repository/Methods.dart';
import '../../bloc/bloc_pr1/bloc_pr1_bloc.dart';
import '../supabase_data_01/Data_display.dart';
import '../supabase_data_01/Data_manipulation.dart';

class Home1_07 extends StatefulWidget {
  const Home1_07({super.key});

  @override
  State<Home1_07> createState() => _Home1_07State();
}

class _Home1_07State extends State<Home1_07> {


  @override
  Widget build(BuildContext context) {
    final widthval=MediaQuery.of(context).size.width;
    final heightval=MediaQuery.of(context).size.height;
    final shortestval=MediaQuery.of(context).size.shortestSide;
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Home Page of 07 search sort"),
        ),
        body: Container(
          height: heightval,
          child:Column(
            children: [

              SizedBox(height: 5,),

              Expanded(
                child: Container(
                  height: 500,
                  width: 500,
                  color: Colors.grey,
                  child: BlocBuilder<Pr1Bloc, Pr1State>(
                    builder: (context, state) {
                      if(state.list1!.isEmpty){
                        return Text("list empty",style: TextStyle(fontSize: 30),);
                      }
                      else if(state.list1!.isNotEmpty) {
                        return ListView.builder(
                          itemCount: state.list1!.length,
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
                                          child: Image.network(state.list1![index]["photo"]==null?"https://media.istockphoto.com/id/185262648/photo/red-apple-with-leaf-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=gUTvQuVPUxUYX1CEj-N3lW5eRFLlkGrU_cwwwOWxOh8=":state.list1![index]["photo"]),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(state.list1![index]["id"].toString(),style: TextStyle(fontSize: 25),),
                                                Text(state.list1![index]["name"].toString(),style: TextStyle(fontSize: 25)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(state.list1![index]["price"].toString(),style: TextStyle(fontSize: 25)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                        );

                      }
                      else{
                        return Text("Else list",style: TextStyle(fontSize: 30));
                      }

                    },
                  ),
                ),
              ),

              SizedBox(height: 20,),

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
                List<Map<dynamic, dynamic>> hiveData = Methods().getDataFromHive();
                print('Data from Hive:');
                hiveData.forEach((item) {
                  print(item);
                });


              }
              ),

              SizedBox(
                height: 5,
              ),

              Container(
                height: 50,
                width: widthval,
                child: Center(child: Text("Load Data from Hive using bloc",style: TextStyle(fontSize: 25))),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ).onTap(() async{
                List<Map<String, dynamic>> hiveData = Methods().getDataFromHive();
                print('Data from Hive:');

                for(int i=0;i<hiveData.length;++i){
                  context.read<Pr1Bloc>().add(ShowItem(list_value1: hiveData[i]));
                }
              }
              ),


            ],
          ),
        ),
      );
  }


}
