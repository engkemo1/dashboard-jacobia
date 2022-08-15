import 'package:dashboard/ViewModel/GetX/QuestionGetX.dart';
import 'package:flutter/material.dart';import '../../../ViewModel/GetX/CategoryGetX.dart';

import '../../../constant.dart';
import 'package:multiselect/multiselect.dart';
import 'package:get/get.dart';

class TotalQuestions extends StatefulWidget {

  @override
  State<TotalQuestions> createState() => _TotalQuestionsState();
}

class _TotalQuestionsState extends State<TotalQuestions> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    var controller= QustionGetX();
    var cat =CategoryController();
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
              Column(
                children: [
                  StreamBuilder<Object>(
                    stream: cat.docs,
                    builder: (context,AsyncSnapshot snapshot) {
                      List<String> options = ['sda','sdasda'];
                      return DropDownMultiSelect(
                        options: options,
                        whenEmpty: snapshot.data.docs[1]['name'],
                        onChanged: (value) {
                          controller.selectedOptionList.value = value;
                          controller.selectedOption.value = "";
                          controller.selectedOptionList.value.forEach((element) {
                            controller.selectedOption.value =
                                controller.selectedOption.value + " " + element;
                          });
                        },
                        selectedValues: controller.selectedOptionList.value,
                      );
                    }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(() => Text(controller.selectedOption.value))
                ],
              ),              Container(
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
