import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constant.dart';
import '../../component.dart';
import '../../widget/DropDownWidget.dart';
import 'TotalQuestions.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  String? dropdownValue;

  final _formKey = GlobalKey<FormState>();

  int? index = 0;

  String? corAns;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      color: appBarColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(

crossAxisAlignment: CrossAxisAlignment.start,            children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      navigator(context,TotalQuestions());
                    },
                    child: Text('All Questions', style: TextStyle(color: Colors.white),),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.greenAccent)),
                  ),
                             ),
              SizedBox(height: 20,),
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
                items: ['Science', 'Math', 'Programming']
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
              SizedBox(
                height: 10,
              ),
              InputField(label: 'Question ',
                  hint: 'Enter Question',
                  iconOrdrop: 'icon',
                  isEnabled: true,
                  texth: 15), SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 10,
              ),
              InputField(label: 'Image Url',
                  hint: 'Enter Image UrL',
                  iconOrdrop: 'icon',
                  isEnabled: true,
                  texth: 15),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Text(
                      "Questions Type:",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),

              Row(

                children: [

                  Expanded(
                    flex: 1,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.greenAccent,
                      ),
                      child: RadioListTile(
                        title: const Text('Options', style: TextStyle(
                            color: Colors.white, fontSize: 15),),
                        value: 0,
                        selectedTileColor: Colors.white,
                        activeColor: Colors.greenAccent,
                        groupValue: index,
                        onChanged: (int ? value) {
                          setState(() {
                            index = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.greenAccent
                      ),

                      child: RadioListTile(
                        activeColor: Colors.greenAccent,

                        title: const Text('True/False', style: TextStyle(
                            color: Colors.white, fontSize: 15)),
                        value: 1,
                        groupValue: index,
                        onChanged: (int? value) {
                          setState(() {
                            index = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),


             index==0?
             Container(
               child: Column(
                 children: [
                   InputField(
                       label: 'A',
                       hint: 'Option',
                       iconOrdrop: 'icon',
                       isEnabled: true,
                       texth: 15),
                   SizedBox(
                     height: 10,
                   ),
                   InputField(
                       label: 'B',
                       hint: 'Option',
                       iconOrdrop: 'icon',
                       isEnabled: true,
                       texth: 15),
                   SizedBox(
                     height: 10,
                   ),
                   InputField(
                       label: 'C',
                       hint: 'Option',
                       iconOrdrop: 'icon',
                       isEnabled: true,
                       texth: 15),
                   SizedBox(
                     height: 10,
                   ),
                   InputField(
                       label: 'D',
                       hint: 'Option',
                       iconOrdrop: 'icon',
                       isEnabled: true,
                       texth: 15),
                   SizedBox(
                     height: 10,
                   ),
                   InputField(
                       label: 'E',
                       hint: 'Option',
                       iconOrdrop: 'icon',
                       isEnabled: true,
                       texth: 15),
                 ],
               ),
             ):

                   Container(
                     child: Column(
                       children: [
                         InputField(
                             label: 'True',
                             hint: 'True',
                             iconOrdrop: 'icon',
                             isEnabled: true,
                             texth: 15),
                         SizedBox(height: 10,),
                         InputField(
                             label: 'False',
                             hint: 'False',
                             iconOrdrop: 'icon',
                             isEnabled: true,
                             texth: 15),
                       ],
                     ),
                   ),
              SizedBox(height: 30,),

              DropdownButtonFormField(
                elevation: 0,
                iconEnabledColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Please Select Correct Answer',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                  filled: true,
                  fillColor: appBarColor,
                ),
                iconDisabledColor: Colors.white,
                dropdownColor: Colors.black,
                value: corAns,
                onChanged: (String? newValue) {
                  setState(() {
                    corAns = newValue!;
                  });
                },
                items: ['A', 'B', 'C','D','E']
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


SizedBox(height: 30,),

              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Save', style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.greenAccent)),
                ),
              ),
              SizedBox(height: 30,),

            ],
          ),
        ),
      ),
    );
  }


}