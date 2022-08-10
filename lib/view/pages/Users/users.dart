import 'package:dashboard/constant.dart';
import 'package:flutter/material.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';

import '../../../Models/UsersModel.dart';

class Users extends StatelessWidget {
  const Users({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        centerTitle: true,
        title: Text('Users',style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          color: appBarColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                "Recent Users",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    horizontalMargin: 0,
                    columnSpacing: 25,
                    columns: [
                      DataColumn(
                        label: Text(
                          "Name",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Phone",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Coins",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Delete",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                    rows: List.generate(
                      recentUsers.length,
                      (index) => recentUserDataRow(recentUsers[index], context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

DataRow recentUserDataRow(RecentUser userInfo, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            TextAvatar(
              size: 35,
              backgroundColor: Colors.white,
              textColor: Colors.white,
              fontSize: 14,
              upperCase: true,
              numberLetters: 1,
              shape: Shape.Rectangle,
              text: userInfo.name!,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                userInfo.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
      DataCell(Text(
        userInfo.number!,
        style: TextStyle(color: Colors.white, fontSize: 12),
      )),
      DataCell(Text(
        userInfo.coins!,
        style: TextStyle(color: Colors.white, fontSize: 12),
      )),
      DataCell(
        IconButton(
          icon: Icon(
            Icons.delete,
            size: 25,
            color: Colors.white,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                      title: Center(
                        child: Text("Confirm Deletion"),
                      ),
                      content: Container(
                        height: 100,
                        child: Column(
                          children: [
                            Text(
                              "Are you sure want to delete '${userInfo.name}'?",
                              style: TextStyle(color: Colors.black),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton.icon(
                                    icon: Icon(
                                      Icons.cancel,
                                      size: 14,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    label: Text("cancel")),


                                SizedBox(
                                  width: 20,
                                ),
                                ElevatedButton.icon(
                                    icon: Icon(
                                      Icons.delete,
                                      size: 14,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red),
                                    onPressed: () {},
                                    label: Text("Delete"))
                              ],
                            )
                          ],
                        ),
                      ));
                });
          },
          // Delete
        ),
      ),
    ],
  );
}
