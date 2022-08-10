import 'package:flutter/material.dart';

import '../../../constant.dart';
class TotalCategories extends StatelessWidget {
  const TotalCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return             Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                barrierDismissible: false,
                // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: SingleChildScrollView(
                      child: ListBody(
                        children:  <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Catergory name",
                              fillColor: Colors.grey,
                              focusedBorder:OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black, width: 1.0),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Image Url",
                              fillColor: Colors.white,

                              focusedBorder:OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.circular(25.0),

                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          ElevatedButton(onPressed: (){}, child: Text('Save'),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(appBarColor)),)

                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child:  Text('cancel',style: TextStyle(color: appBarColor),),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Add Category',style: TextStyle(color: Colors.greenAccent),),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(appBarColor)),
          )

        ],
        title: Text('Categories'),
        backgroundColor: appBarColor,
        elevation: 0,
      ),
      backgroundColor: appBarColor,
      body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(30),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(
                        color: backgroundColor,
                        blurRadius: 100
                      )],
                      color: Colors.white12),
                  child: Stack(
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          'assets/images/math.jpg',
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              'Math',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          )),
                      Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              onPressed: () {
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: false,
                                  // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.white,
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children:  <Widget>[
                                            TextFormField(
                                              initialValue: 'math',

                                              decoration: InputDecoration(

                                                labelText: "Catergory name",
                                                fillColor: Colors.grey,
                                                focusedBorder:OutlineInputBorder(
                                                  borderSide: const BorderSide(color: Colors.black, width: 1.0),
                                                  borderRadius: BorderRadius.circular(25.0),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 20,),
                                            TextFormField(
                                              initialValue: 'image/daasdasdffaadc.adasdadaas.png',
                                              decoration: InputDecoration(
                                                labelText: "Image Url",
                                                fillColor: Colors.white,

                                                focusedBorder:OutlineInputBorder(
                                                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                                  borderRadius: BorderRadius.circular(25.0),

                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 20,),

                                            ElevatedButton(onPressed: (){}, child: Text('Delete'),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(appBarColor)),)
                                            ,
                                            ElevatedButton(onPressed: (){}, child: Text('Save'),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(appBarColor)),),

                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child:  Text('cancel',style: TextStyle(color: appBarColor),),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          )),
    );

  }
}
