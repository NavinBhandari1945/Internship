import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Pr1 extends StatefulWidget {
  const Pr1({super.key});

  @override
  State<Pr1> createState() => _Pr1State();
}

class _Pr1State extends State<Pr1> {
  List<Photos> photolist=[];
  int limit=5;
  int page=1;
  final scroll_cont=ScrollController();

  Future<List<Photos>> getPhotos()async{
    final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos?_limit=${limit}&_page=${page}"));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200)
    {
      for(Map i in data)
      {

        var photos=Photos(title:i['title'], url: i['url']);
        photolist.add(photos);
      }
      return photolist;
    }else
    {
      return photolist;
    }
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    scroll_cont.addListener((){
      if(scroll_cont.position.maxScrollExtent==scroll_cont.offset){
        ++page;
        print("page value = ${page}");
        setState(() {
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo section screen"),
      ),
      body:
      Container (
        height: 600,
        width: 600,
        color: Colors.grey,
        child: Column(
          children: [
            Expanded(
              child:
              FutureBuilder(
                future: getPhotos(),
                builder:(context, snapshot) {
                  return
                    ListView.builder (
                      controller: scroll_cont,
                    itemCount: photolist.length + 1,
                    itemBuilder:(context, index) {
                      if(index<photolist.length){
                        return   Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.greenAccent,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(photolist[index].url.toString()),
                              ),
                              title:Text(photolist[index].title.toString()),
                              subtitle: Text(photolist[index].url.toString()),
                              trailing: Text(index.toString(),style: TextStyle(fontSize: 50),),
                            ),
                          ),
                        );
                      }
                      else{
                        return CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                            Colors.green,
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),

          ],
        ),
      )
    );
  }



}

class Photos{
  String? title;
  String? url;
  Photos({required this.title,required this.url});
}
