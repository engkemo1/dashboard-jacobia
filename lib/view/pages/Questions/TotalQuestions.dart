import 'package:dashboard/ViewModel/GetX/QuestionGetX.dart';
import 'package:flutter/material.dart';import '../../../ViewModel/GetX/CategoryGetX.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:multiselect/multiselect.dart';
import 'package:get/get.dart';

import '../../../constant.dart';

class TotalQuestions extends StatefulWidget {

  @override
  State<TotalQuestions> createState() => _TotalQuestionsState();
}
List<String> options = [];
class _TotalQuestionsState extends State<TotalQuestions> {
  String? dropdownValue;
  @override
  void initState() {
    var  fire = FirebaseFirestore.instance
        .collection('category')
        .get().then((value) {
          value.docs.forEach((element) {
            print(element['name']);
            options.add(element['name']);
          });
          setState(() {

          });
    });

    super.initState();
  }

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
                DropDownMultiSelect(
                options: options,
                whenEmpty: 'new',
                onChanged: (value) {
                  controller.selectedOptionList.value = value;
                  controller.selectedOption.value = "";
                  controller.selectedOptionList.value.forEach((element) {
                    controller.selectedOption.value =
                        controller.selectedOption.value + " " + element;
                  });
                },
                selectedValues: controller.selectedOptionList.value,

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
