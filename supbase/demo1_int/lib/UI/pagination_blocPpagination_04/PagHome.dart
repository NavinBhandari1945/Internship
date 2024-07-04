import 'dart:convert';
import 'package:demo1_int/bloc/bloc_pr1/bloc_pr1_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;





class PagHome extends StatefulWidget {
  const PagHome({super.key});

  @override
  State<PagHome> createState() => _PagHomeState();
}

class _PagHomeState extends State<PagHome> {

  List<Photos> photolist = [];
  final scroll_cont = ScrollController();

  Future<List<Photos>> getPhotos(limit, page) async {
    final response = await http.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/photos?_limit=${limit}&_page=${page}"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        var photos = Photos(title: i['title'], url: i['url']);
        photolist.add(photos);
      }
      return photolist;
    } else {
      return photolist;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scroll_cont.addListener(() {
      if (scroll_cont.position.maxScrollExtent == scroll_cont.offset) {
        context.read<Pr1Bloc>().add(Addpage());
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
        Container(
          color: Colors.brown,
          child: Column(
            children: [

              Expanded(
                child:
                BlocBuilder<Pr1Bloc, Pr1State>(
                  builder: (context, state) {
                    return FutureBuilder(
                      future: getPhotos(state.limit,state.page),
                      builder: (context, snapshot) {
                        return
                          Container(
                            height: 600,
                            width: 600,
                            color: Colors.white38,
                            child: ListView.builder(
                              controller: scroll_cont,
                              itemCount: photolist.length + 1,
                              itemBuilder: (context, index) {
                                if (index < photolist.length) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      color: Colors.greenAccent,
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              photolist[index].url.toString()),
                                        ),
                                        title: Text(
                                            photolist[index].title.toString()),
                                        subtitle: Text(
                                            photolist[index].url.toString()),
                                        trailing: Text(index.toString(),
                                          style: TextStyle(fontSize: 50),),
                                      ),
                                    ),
                                  );
                                }
                                else {
                                  return CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation(
                                      Colors.green,
                                    ),
                                  );
                                }
                              },
                            ),
                          );
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: 20,),

              ElevatedButton(onPressed: () {


              }, child: Text("LOad"))

            ],
          ),
        )
    );
  }
}

class Photos {
  String? title;
  String? url;

  Photos({required this.title, required this.url});
}
