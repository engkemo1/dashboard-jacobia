import 'package:dashboard/ViewModel/GetX/QuestionGetX.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multiselect/multiselect.dart';
import '../../ViewModel/GetX/QuizGetx.dart';
import '../../constant.dart';
import 'DropDownWidget.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  String? dropdownValue;
  TextEditingController rank1Controller = TextEditingController();
  TextEditingController rank2Controller = TextEditingController();
  TextEditingController rank3Controller = TextEditingController();
  TextEditingController rank4Controller = TextEditingController();
  TextEditingController rank5Controller = TextEditingController();
  TextEditingController rank6Controller = TextEditingController();
  TextEditingController rank7Controller = TextEditingController();
  TextEditingController rank8Controller = TextEditingController();
  TextEditingController rank9Controller = TextEditingController();
  TextEditingController rank10Controller = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();
  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController profitController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController minController = TextEditingController();
  TextEditingController maxController = TextEditingController();
  TextEditingController descController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String _selectedDate = DateFormat.yMd().format(DateTime.now());
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
  var controller = QuizGetX();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: appBarColor.withOpacity(0.9),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: ListBody(
            children: <Widget>[
              FutureBuilder(
                  future: controller.createoption(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        snapshot.connectionState == ConnectionState.none) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.greenAccent,
                        ),
                      );
                    } else
                      return DropDownMultiSelect(
                        options: controller.options,
                        whenEmpty: 'Please Select Category',
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (value) {
                          controller.selectedOptionList.value = value;
                          controller.selectedOption.value =
                              "Please Select Category";
                          controller.selectedOptionList.value
                              .forEach((element) {
                            controller.selectedOption.value =
                                controller.selectedOption.value + " " + element;
                          });
                        },
                        selectedValues: controller.selectedOptionList.value,
                      );
                  }),
              SizedBox(
                height: 10,
              ),
              InputField(
                  controller: nameController,
                  label: 'Quiz name',
                  hint: 'Enter Quiz Name',
                  iconOrdrop: 'icon',
                  isEnabled: true,
                  texth: 15),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child:
                    InputField(controller:maxController,label: 'Max User', hint: "Enter Max User", isEnabled: true, iconOrdrop: 'icon', texth: 15,)
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                      child:InputField(
                        controller:minController,label: 'Min User', hint: "Enter Min User", isEnabled: true, iconOrdrop: 'icon', texth: 15,)
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              InputField(
                  controller: imageUrlController,
                  label: 'Image Url',
                  hint: 'Enter Image UrL',
                  iconOrdrop: 'icon',
                  isEnabled: true,
                  texth: 15),
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
                  icon: Icon(
                    Icons.date_range,
                    color: Colors.white,
                  ),
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
                        icon: Icon(
                          Icons.access_time,
                          color: Colors.white,
                        ),
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
                      icon: Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
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
                title: Text(
                  'Ranks',
                  style: TextStyle(color: Colors.white),
                ),
                children: [
                  Column(
                    children: [
                      InputField(
                        controller: rank1Controller,
                        label: 'Rank1',
                        hint: '%',
                        iconOrdrop: 'icon',
                        isEnabled: true,
                        texth: 12,
                        widget: Icon(
                          Icons.percent,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InputField(
                          controller: rank2Controller,
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
                          controller: rank3Controller,
                          texth: 12),
                      SizedBox(
                        height: 5,
                      ),
                      InputField(
                          label: 'Rank4',
                          hint: '%',
                          controller: rank4Controller,
                          iconOrdrop: 'icon',
                          isEnabled: true,
                          texth: 12),
                      SizedBox(
                        height: 5,
                      ),
                      InputField(
                          label: 'Rank5',
                          hint: '%',
                          controller: rank5Controller,
                          iconOrdrop: 'icon',
                          isEnabled: true,
                          texth: 12),
                      SizedBox(
                        height: 5,
                      ),
                      InputField(
                          label: 'Rank6',
                          hint: '%',
                          controller: rank6Controller,
                          iconOrdrop: 'icon',
                          isEnabled: true,
                          texth: 12),
                      SizedBox(
                        height: 5,
                      ),
                      InputField(
                          controller: rank7Controller,
                          label: 'Rank7',
                          hint: '%',
                          iconOrdrop: 'icon',
                          isEnabled: true,
                          texth: 12),
                      SizedBox(
                        height: 5,
                      ),
                      InputField(
                          controller: rank8Controller,
                          label: 'Rank8',
                          hint: '%',
                          iconOrdrop: 'icon',
                          isEnabled: true,
                          texth: 12),
                      SizedBox(
                        height: 5,
                      ),
                      InputField(
                          controller: rank9Controller,
                          label: 'Rank9',
                          hint: '%',
                          iconOrdrop: 'icon',
                          isEnabled: true,
                          texth: 12),
                      SizedBox(
                        height: 5,
                      ),
                      InputField(
                          controller: rank10Controller,
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
                  controller: profitController,
                  hint: '%',
                  iconOrdrop: 'icon',
                  isEnabled: true,
                  texth: 15),
              SizedBox(
                height: 10,
              ),
              InputField(
                  controller: priceController,
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
                controller: descController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    labelText: "Description",
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: 'Description',
                    fillColor: Colors.white,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    border: new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white))),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.price = int.tryParse (priceController.text);
                  controller.profit = int.tryParse(profitController.text);
                  controller.imageUrl = imageUrlController.text;
                  controller.name = nameController.text;
                  controller.max = int.tryParse(maxController.text);
                  controller.min = int.tryParse(minController.text);
                  controller.desc = descController.text;
                  controller.date = _selectedDate.toString();
                  controller.startTime = _startDate.toString();
                  controller.endTime = _endDate.toString();
                  controller.rank1 = int.tryParse(rank1Controller.text);
                  controller.rank2 = int.tryParse(rank2Controller.text);
                  controller.rank3 = int.tryParse(rank3Controller.text);
                  controller.rank4 = int.tryParse(rank4Controller.text);
                  controller.rank5 = int.tryParse(rank5Controller.text);
                  controller.rank6 = int.tryParse(rank6Controller.text);
                  controller.rank7 = int.tryParse(rank7Controller.text);
                  controller.rank8 = int.tryParse(rank8Controller.text);
                  controller.rank9 = int.tryParse(rank9Controller.text);
                  controller.rank10 = int.tryParse(rank10Controller.text);
                  controller.postData();
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(backgroundColor)),
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
}
