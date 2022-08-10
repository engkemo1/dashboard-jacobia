import 'package:dashboard/constant.dart';
import 'package:flutter/material.dart';

import '../component.dart';

class TotalWidget extends StatelessWidget {
  final  String total;
 final   String title;
 final Widget  widget;
   TotalWidget( {required this.total, required this.title, required this.widget});

  @override
  Widget build(BuildContext context) {
    return
       GestureDetector(
         onTap: (){
           navigator(context,widget);
         },
         child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(

              border: new Border(

                  top: new BorderSide( color: Colors.greenAccent),
                  left: new BorderSide(width: 1.0, color: Colors.greenAccent),
                  right: new BorderSide(width: 1.0, color: Colors.cyanAccent),
                  bottom: new BorderSide(width: 1.0, color: Colors.cyanAccent)
              ),
              color: appBarColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 30, color:Colors.greenAccent,

                    shadows: <Shadow>[

                    Shadow(
                blurRadius: 100.0,
                color:Colors.green,
              ),
                      Shadow(
                        blurRadius: 100.0,
                        color:Colors.green,
                      ),

            ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(total,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.greenAccent,

                        shadows: <Shadow>[

                          Shadow(
                            blurRadius: 100.0,
                            color:Colors.green,
                          ),
                          Shadow(
                            blurRadius: 100.0,
                            color:Colors.green,
                          ),

                        ],)),
                  Icon(
                    Icons.query_stats_outlined,
                    size: 30,
                    color: Colors.greenAccent,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),

    ),
       );
  }
}
