import 'package:flutter/material.dart';

import '../../../HomeScreen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return             SingleChildScrollView(
      child: Column(
        children: [
          total('Total Categories', '5'),
          total('Total Questions', '100'),
          total('Total Users', '300')
        ],
      ),
    );

  }
}
