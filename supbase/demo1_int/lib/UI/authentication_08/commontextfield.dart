import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

 Widget Commontextfield(String? tittle,hint_text,obscureval,controllerval,context)
{
  var widthval=MediaQuery.of(context).size.width;
  var heightval=MediaQuery.of(context).size.height;
  var shortestval=MediaQuery.of(context).size.shortestSide;
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tittle!.text.color(CupertinoColors.black).size(25).make(),
      Container(
        height:heightval*0.08,
        child:
        TextFormField(
          maxLines: null,
          keyboardType: TextInputType.multiline,
          controller: controllerval,
          obscureText: obscureval,
          style: TextStyle(fontSize: shortestval*0.07),
          decoration: InputDecoration (
              contentPadding: EdgeInsets.symmetric(vertical:shortestval*0.03, horizontal:shortestval*0.03),
              hintText: hint_text,
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: shortestval*0.07,

            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: CupertinoColors.black,
                width: shortestval*0.006,
              ),
              borderRadius: BorderRadius.circular(shortestval*0.04),
            ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(shortestval*0.04),
                borderSide: BorderSide(
                    color: CupertinoColors.black,
                  width: shortestval*0.006,
                ),
              )
          ),
        ),
      )
      ],
    ),
  );
}