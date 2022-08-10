import 'package:dashboard/constant.dart';
import 'package:flutter/material.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';

import '../../../Models/UsersModel.dart';

class UsersRequest extends StatelessWidget {
  const UsersRequest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 10),
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
                    columnSpacing: 20,
                    columns: [
                      DataColumn(
                        label: Text(
                          "Name",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Request",
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
                          "operation",
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
      DataCell(GestureDetector(
        onTap: (){
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                    title: Center(
                      child: Text(userInfo.reqeust.toString()),
                    ),
                    content: Container(
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('200 yellow coins '),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.phone),
                              Text(userInfo.number.toString()),
                            ],
                          ),

SizedBox(height: 10,),
                          userInfo.reqeust.toString()=='deposit'?
                          ElevatedButton.icon(
                              icon: Icon(
                                Icons.send,
                                size: 14,
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.red),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              label: Text("send"))
:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.call,
                                    size: 14,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  label: Text("call")),


                              SizedBox(
                                width: 20,
                              ),
                              ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.whatsapp,
                                    size: 14,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red),
                                  onPressed: () {},
                                  label: Text("chat"))
                            ],
                          )
                        ],
                      ),
                    ));
              });
        },
        child: Text(
          userInfo.reqeust.toString(),
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      )),
      DataCell(Text(
        userInfo.coins!,
        style: TextStyle(color: Colors.white, fontSize: 12),
      )),
      DataCell(
        Row(
          children: [
            InkWell(onTap: (){},child: Text('Accept',style: TextStyle(color: Colors.greenAccent,fontSize: 13),),),
            SizedBox(width: 10,),
            InkWell(onTap: (){},child: Text('Reject',style: TextStyle(color: Colors.red,fontSize: 13),),)

          ],
        )
      ),
    ],
  );
}
