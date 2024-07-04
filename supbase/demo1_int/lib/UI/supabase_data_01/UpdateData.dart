import 'dart:io';
import 'package:demo1_int/bloc/bloc_pr1/bloc_pr1_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../Repository/Methods.dart';
import '../../constants/constants.dart';

class UpdateData extends StatefulWidget {
  const UpdateData({super.key});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  File? image_path_u;
  String? image_url_u;
  @override
  Widget build(BuildContext context) {
    final widthval=MediaQuery.of(context).size.width;
    final heightval=MediaQuery.of(context).size.height;
    final shortestval=MediaQuery.of(context).size.shortestSide;
    final name_cont=TextEditingController();
    final price_cont=TextEditingController();
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

            Center(
              child: ElevatedButton(
                onPressed:() async{
                  final imagePick= ImagePicker();
                  final select_image=await imagePick.pickImage(source: ImageSource.camera);
                  print("test1");
                  if(select_image!=null){
                    image_path_u=File(select_image.path);
                    final String path_name=DateTime.now().millisecondsSinceEpoch.toString();
                    final String path="${path_name}/pImage";
                    final upload_bucket =await supabase.storage.from("demo1_int_images").upload(path,image_path_u!);
                    image_url_u=await supabase.storage.from("demo1_int_images").getPublicUrl(path);
                  }
                  else{
                    return;
                  }
                },
                child: const Text("Pick and Upload Image",style: TextStyle(fontSize: 25)),
              ),
            ),


            SizedBox(
              height: 10,
            ),


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


            Text("Insert name",style: TextStyle(fontSize: 25)),
            TextFormField(
              controller: name_cont,
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

            Text("Insert price",style: TextStyle(fontSize: 25)),
            TextFormField(
              controller: price_cont,
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
              child: ElevatedButton(onPressed: ()async{
                Methods().updateData(int.parse(id_cont.text.toString()),name_cont.text.toString(),int.parse(price_cont.text.toString()),image_url_u);
                print("Update data success");
                final data=await Methods().readData();
                int length=data.length;
                for(int i=0;i<length;++i){
                  context.read<Pr1Bloc>().add(UpdateItem(
                      id:int.parse(id_cont.text.toString()) ,
                      list_value:data[i!]));
                }
              }, child: Text("Update.",style: TextStyle(fontSize: 25))),
            )
          ],
        ),


      ),
    );
  }
}
