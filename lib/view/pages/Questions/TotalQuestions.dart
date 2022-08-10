import 'package:flutter/material.dart';
import '../../../constant.dart';

class TotalQuestions extends StatefulWidget {

  @override
  State<TotalQuestions> createState() => _TotalQuestionsState();
}

class _TotalQuestionsState extends State<TotalQuestions> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Total Questions'),
        backgroundColor: appBarColor,
        elevation: 0,
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              DropdownButtonFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Please Select Category',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  filled: true,
                  fillColor: appBarColor,
                ),
                dropdownColor: Colors.black,
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: ['all category','Science', 'Math', 'Programming']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                }).toList(),
              ),
              Container(
                height: 200,width: 300,
                child: Column(
                  children: [
Text('what is the first num',style: TextStyle(color: Colors.black,fontSize: 17),),
                    Row(
                      children: [
                        Text('hello',style: TextStyle(color: Colors.black,fontSize: 14),),
                        Text('dasd',style: TextStyle(color: Colors.black,fontSize: 14),),
                        Text('dsad',style: TextStyle(color: Colors.black,fontSize: 14),),
                        Text('dsa',style: TextStyle(color: Colors.black,fontSize: 14),),
                        Text('helalo',style: TextStyle(color: Colors.black,fontSize: 14),),
                        Text('helddlo',style: TextStyle(color: Colors.black,fontSize: 14),),

                      ],
                    ),


                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
