import 'package:dashboard/view/pages/Users/UserRequest.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import 'Categories/TotalCategories.dart';
import 'Code/CreateCode.dart';
import 'Dashboard/Dashboard.dart';
import 'Questions/Questions.dart';
import 'Quiz.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(

          actions: [
            Row(
              children: [
                Text(
                  'logout',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.redAccent,
                    shadows: <Shadow>[


                      Shadow(
                        blurRadius: 100.0,
                        color:Colors.red,
                      ),

                    ],),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.logout,color: Colors.red,))
              ],
            )
          ],
          backgroundColor:appBarColor,
          bottom: TabBar(
indicatorColor: Colors.greenAccent,
            tabs: [
              Tab(
                icon: Icon(Icons.dashboard_outlined),
                text: "Dashboard",
              ),
              Tab(icon: Icon(Icons.request_page_outlined), text: "Requests"),
              Tab(icon: Icon(Icons.question_answer_outlined), text: "Questions"),
              Tab(icon: Icon(Icons.confirmation_number_outlined), text: "Code"),

            ],
          ),
          title: Row(
            children: [
              Text('Jacobia',style: TextStyle(   shadows: <Shadow>[

                Shadow(
                  blurRadius: 30.0,
                  color:Colors.cyanAccent,
                ),


              ],color: Colors.greenAccent.shade100),),

              Text(' Dashboard',style: TextStyle(
                color: Colors.greenAccent,
                shadows: <Shadow>[

                  Shadow(
                    blurRadius: 30.0,
                    color:Colors.cyan,
                  ),


                ],
              ),),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Dashboard(),
            UsersRequest(),
            Questions(),
            CreateCode(),
          ],
        ),
      ),
    );
  }
}
