import 'package:dashboard/constant.dart';
import 'package:flutter/material.dart';
class Codes extends StatelessWidget {
  const Codes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Codes'),
        backgroundColor: appBarColor,
        elevation: 0,

      ),
      backgroundColor: appBarColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              height: 50,

              margin: EdgeInsets.all(20),
padding: EdgeInsets.only(left: 20,right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                    color: appBarColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 100,
                        color: Colors.grey
                      ),
                    ]
                    ,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Code : 12312321323212',style: TextStyle(color: Colors.white),),
                      Text('Applied',style: TextStyle(color: Colors.white),)
                    ],
                  ),


                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 50,

              margin: EdgeInsets.all(20),
              padding: EdgeInsets.only(left: 20,right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: appBarColor,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 100,
                      color: Colors.grey
                  ),
                ]
                ,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Code : 312321321312323',style: TextStyle(color: Colors.white),),
                      Text('Not Applied',style: TextStyle(color: Colors.white),)
                    ],
                  ),


                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
