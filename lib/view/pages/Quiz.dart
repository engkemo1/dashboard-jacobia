import 'package:dashboard/view/widget/Widget_CreateQuiz.dart';
import 'package:flutter/material.dart';
import '../../../constant.dart';

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        actions:[
          Container(
            height: 30,
            width: 100,
            child: ElevatedButton(
              onPressed: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: true,
                  // user must tap button!
                  builder: (BuildContext context) {
                    return CreateQuiz();
                  },
                );
              },
              child: Text('Add Quiz',style: TextStyle(color: Colors.greenAccent),),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(appBarColor)),
            ),
          )

        ] ,
        title: Text('Quiz'),
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
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white,
              boxShadow: [BoxShadow(blurRadius: 100,color: Colors.white10)]),
              height: 230,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/images/math.jpg',
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'LastStanding',
                          style: TextStyle(fontSize: 20, color: Colors.black),
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
                                return CreateQuiz();
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
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 100,
                    color: Colors.white10

                  )
                ]


              ),
              height: 230,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/images/hi.jpg',
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'playerGame',
                          style: TextStyle(fontSize: 20, color: Colors.black),
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
                                return CreateQuiz();
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
            ),

            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white,
                  boxShadow: [BoxShadow(blurRadius: 100,color: Colors.white10)]),
              height: 230,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/images/math.jpg',
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'LastStanding',
                          style: TextStyle(fontSize: 20, color: Colors.black),
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
                                return CreateQuiz();
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
            ),
          ],
        ),
      )),
    );
  }


}
