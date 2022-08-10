import 'package:dashboard/Models/UsersModel.dart';
import 'package:dashboard/view/pages/Users/UserRequest.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../widget/total_widget.dart';
import '../Categories/TotalCategories.dart';
import '../Quiz.dart';
import '../Users/users.dart';


class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return             Container(
      height: MediaQuery.of(context).size.height,
      color:appBarColor ,
      child: SingleChildScrollView(
        child: Column(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            TotalWidget( total: '5', title: 'Total Categories', widget: TotalCategories(),),
            TotalWidget( total: '100', title: 'Total Questions',widget: Quiz(),),
            TotalWidget(total: '300', title: 'Total Users',widget: Users(),),


          ],
        ),
      ),
    );

  }

}
