
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter/cupertino.dart';
import '../constants/constants.dart';

class Methods {

  Future<void> insertData(name,price,imageurl) async{
    await supabase.from("data").insert({
      "name":name,
      "price":price,
      "photo":imageurl,
    });
  }

  Future<void> updateData(id,name,price,imageurl) async{
    await supabase.from("data").update({
      "name":name,
      "price":price,
      "photo":imageurl,
    }).eq("id", id);
  }

  Future<void> deleteData(id) async{
    await supabase.from("data").delete().eq("id", id);
  }


  Future<List<Map<String, dynamic>>> readData() async {
    try {
      final response = await supabase.from('data').select("*");
      final List<Map<String, dynamic>> data = response as List<Map<String, dynamic>>;
      if(data!=null){
        return data;
      }else{
        return [];
      }
    } catch (e) {
      print('Exception caught: $e');
      return [];
    }
  }

  Future<void> saveDataInHive(List<Map<String, dynamic>> data) async {
    final box = Hive.box('Hive_demo1_int');
    for (var item in data) {
      box.add(item);
    }
  }

  List<Map<String, dynamic>> getDataFromHive() {
    final box = Hive.box('Hive_demo1_int');
    List<Map<String, dynamic>> hiveData = [];
    for (var i = 0; i < box.length; i++) {
      var item = box.getAt(i);
      if (item is Map) {
        try {
          hiveData.add(Map<String, dynamic>.from(item));
        } catch (e) {
          print('Error casting item at index $i to Map<String, dynamic>: $e');
        }
      } else {
        print('Item at index $i is not a Map: $item');
      }
    }
    return hiveData;
  }

  Widget getNetworkImage() {
    String url="https://img.freepik.com/free-psd/red-fresh-apple-isolated-con-transparent-background_125540-5172.jpg?size=626&ext=jpg&ga=GA1.1.2116175301.1719273600&semt=ais_user";
    String null_url="";
    return CachedNetworkImage(
        imageUrl:url,
        placeholder:(context,url)=>CircularProgressIndicator() ,
        errorWidget: (context, url, error) => Icon(Icons.error),
    );

  }

  Widget getNetworkImagePr(String image_url) {
    String url=image_url;
    String null_url="No url found";
    return CachedNetworkImage(
      imageUrl:url,
      placeholder:(context,url)=>CircularProgressIndicator() ,
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

}





