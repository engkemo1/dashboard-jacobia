import 'package:flutter/material.dart';

import 'Categories/TotalCategories.dart';
import 'Dashboard/Dashboard.dart';

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
          Dashboard(),
            TotalCategories()          ],
        ),
      ),
    );
  }
}

