import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Colors.deepOrange.withOpacity(0.8);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Row(
              children: [
                Text(
                  'logout',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.logout))
              ],
            )
          ],
          backgroundColor: Colors.deepOrange.withOpacity(0.8),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.dashboard_outlined),
                text: "Dashboard",
              ),
              Tab(icon: Icon(Icons.category_outlined), text: "Categotry 2"),
              Tab(
                icon: Icon(Icons.android),
                text: "Tab 1",
              ),
              Tab(icon: Icon(Icons.phone_iphone), text: "Tab 2"),
            ],
          ),
          title: Text('Dashboard Jacobia'),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  total('Total Categories', '5'),
                  total('Total Questions', '100'),
                  total('Total Users', '300')
                ],
              ),
            ),
            SingleChildScrollView(
                child: Container(
              margin: EdgeInsets.all(30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
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
                                      ElevatedButton(onPressed: (){}, child: Text('Save'),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),)

                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child:  Text('cancel',style: TextStyle(color: color),),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text('Add Category'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(color)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white60),
                    height: 180,
                    child: Stack(
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            'assets/images/math.jpg',
                            fit: BoxFit.contain,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
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

                                              ElevatedButton(onPressed: (){}, child: Text('Delete'),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),)
,
                                              ElevatedButton(onPressed: (){}, child: Text('Save'),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),),

                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child:  Text('cancel',style: TextStyle(color: color),),
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
                                  color: Colors.redAccent,
                                ),
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

Widget total(String title, String total) {
  return Container(
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.all(20),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.deepOrange.withOpacity(0.9)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
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
                    color: Colors.white)),
            Icon(
              Icons.query_stats_outlined,
              size: 30,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}
