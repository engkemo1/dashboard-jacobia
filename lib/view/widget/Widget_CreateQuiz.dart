import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constant.dart';
import 'DropDownWidget.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  String? dropdownValue;
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  String _selectedDate = DateFormat.yMd().format(DateTime.now());
  final TextEditingController _timeController = TextEditingController();
  String time = '5';
  String _startDate = DateFormat('hh:mm a').format(DateTime.now());
  String _endDate =
      DateFormat('hh:mm a').format(DateTime.now().add(Duration(minutes: 15)));
  var timelist = [
    '10 Minutes',
    '15 Minutes',
    '20 Minutes',
    '25 Minutes',
    '30 Minutes'
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: appBarColor.withOpacity(0.9),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: ListBody(
            children: <Widget>[
              DropdownButtonFormField(
                decoration: InputDecoration(
                  hintText: 'Please Select Category',
                  enabledBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                dropdownColor: Colors.white,
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
InputField(label: 'Quiz name', hint: 'Enter Quiz Name', iconOrdrop: 'icon', isEnabled: true, texth: 15)    ,          SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Maxmuim User',
                        hintStyle: TextStyle(fontSize: 15),
                        contentPadding: EdgeInsets.all(10),
                        enabledBorder: OutlineInputBorder(
                          //<-- SEE HERE
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          //<-- SEE HERE
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Minimum User',
                        hintStyle: TextStyle(fontSize: 15),
                        contentPadding: EdgeInsets.all(10),
                        enabledBorder: OutlineInputBorder(
                          //<-- SEE HERE
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          //<-- SEE HERE
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              InputField(label: 'Image Url', hint: 'Enter Image UrL', iconOrdrop: 'icon', isEnabled: true, texth: 15),
              SizedBox(
                height: 10,
              ),
              InputField(
                texth: 15,
                controller: _dateController,
                isEnabled: false,
                hint: '${_selectedDate.toString()}',
                label: 'Date',
                iconOrdrop: 'button',
                widget: IconButton(
                  icon: Icon(Icons.date_range,color: Colors.white,),
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      texth: 15,
                      isEnabled: false,
                      controller: _startTimeController,
                      label: 'Start Time',
                      iconOrdrop: 'button',
                      hint: _startDate.toString(),
                      widget: IconButton(
                        icon: Icon(Icons.access_time,color: Colors.white,),
                        onPressed: () {
                          _selectStartTime(context);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: InputField(
                    texth: 15,
                    controller: _endTimeController,
                    isEnabled: false,
                    iconOrdrop: 'button',
                    label: 'End Time',
                    hint: _endDate.toString(),
                    widget: IconButton(
                      icon: Icon(Icons.access_time,color: Colors.white,),
                      onPressed: () {
                        _selectEndTime(context);
                      },
                    ),
                  ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 100,
                child: InputField(
                  controller: _timeController,
                  isEnabled: false,
                  hint: '${time.toString()}',
                  label: 'Quiz Time',
                  iconOrdrop: 'drop',
                  widget: DropdownButton(
                    items: timelist
                        .map<DropdownMenuItem<String>>(
                            (value) => DropdownMenuItem<String>(
                                value: value.toString(),
                                child: Text(
                                  '$value',
                                  style: TextStyle(color: Colors.black),
                                )))
                        .toList(),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    iconSize: 20,
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        time = newValue!;
                        _timeController.text = time;
                      });
                    },
                  ),
                  texth: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ExpansionTile(
                iconColor: Colors.white,
                collapsedIconColor: Colors.white,
                title: Text('Ranks',style: TextStyle(color: Colors.white),),
                children: [
                  Column(
                    children: [
                      InputField(
                        label: 'Rank1',
                        hint: '%',
                        iconOrdrop: 'icon',
                        isEnabled: true,
                        texth: 12,
                        widget: Icon(
                          Icons.percent,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InputField(
                          label: 'Rank2',
                          hint: '%',
                          iconOrdrop: 'icon',
                          isEnabled: true,
                          texth: 12),
                      SizedBox(
                        height: 5,
                      ),
                      InputField(
                          label: 'Rank3',
                          hint: '%',
                          iconOrdrop: 'icon',
                          isEnabled: true,
                          texth: 12),
                      SizedBox(
                        height: 5,
                      ),
                      InputField(
                          label: 'Rank4',
                          hint: '%',
                          iconOrdrop: 'icon',
                          isEnabled: true,
                          texth: 12),
                      SizedBox(
                        height: 5,
                      ),
                      InputField(
                          label: 'Rank5',
                          hint: '%',
                          iconOrdrop: 'icon',
                          isEnabled: true,
                          texth: 12),
                      SizedBox(
                        height: 5,
                      ),
                      InputField(
                          label: 'Rank6',
                          hint: '%',
                          iconOrdrop: 'icon',
                          isEnabled: true,
                          texth: 12),
                      SizedBox(
                        height: 5,
                      ),
                      InputField(
                          label: 'Rank7',
                          hint: '%',
                          iconOrdrop: 'icon',
                          isEnabled: true,
                          texth: 12),
                      SizedBox(
                        height: 5,
                      ),
                      InputField(
                          label: 'Rank8',
                          hint: '%',
                          iconOrdrop: 'icon',
                          isEnabled: true,
                          texth: 12),
                      SizedBox(
                        height: 5,
                      ),
                      InputField(
                          label: 'Rank9',
                          hint: '%',
                          iconOrdrop: 'icon',
                          isEnabled: true,
                          texth: 12),
                      SizedBox(
                        height: 5,
                      ),
                      InputField(
                          label: 'Rank10',
                          hint: '%',
                          iconOrdrop: 'icon',
                          isEnabled: true,
                          texth: 12),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              InputField(
                  label: 'Your Profit',
                  hint: '%',
                  iconOrdrop: 'icon',
                  isEnabled: true,
                  texth: 15),
              SizedBox(
                height: 10,
              ),
              InputField(
                  label: 'Price',
                  hint: '\$',
                  iconOrdrop: 'icon',
                  isEnabled: true,
                  texth: 15),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                minLines: 2,
                maxLines: 5,
                // allow user to enter 5 line in textfield
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(

                  labelText: "Description",
                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: 'Description',
                  fillColor: Colors.white
                  ,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(25.0),

                  ),
                    border: new UnderlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.white
                        )
                    )
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Save',style: TextStyle(color: Colors.white),),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(backgroundColor)),
              )
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'cancel',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  _selectStartTime(BuildContext context) async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    String formattedTime = selected!.format(context);
    setState(() {
      _startDate = formattedTime;
    });
    print(_startDate);
    print(formattedTime.toString());
  }

  _submitStartTime() {
    _startTimeController.text = _startDate;
  }

  _selectEndTime(BuildContext context) async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    String formattedTime = selected!.format(context);
    setState(() {
      _endDate = formattedTime;
    });
  }

  _submitEndTime() {
    _endTimeController.text = _endDate;
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      currentDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    setState(() {
      if (selected != null) {
        _selectedDate = DateFormat.yMd().format(selected).toString();
      } else
        _selectedDate = DateFormat.yMd().format(DateTime.now()).toString();
    });
  }

  _submitDate() {
    _dateController.text = _selectedDate;
  }
}
