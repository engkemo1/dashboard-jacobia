import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../constant.dart';

class QuizGetX extends GetxController {
  List<String> options = [];
  Rx<List<String>> selectedOptionList = Rx<List<String>>([]);
  var selectedOption = ''.obs;
  String? imageUrl='';
  String desc = '';
  String name = "";

  String date = "", startTime = "", endTime = "";
  int? rank1 ,
      rank2 ,
      rank3 ,
      rank4 ,
      rank5 ,
      rank6 ,
      rank7 ,
      rank8 ,
      rank9 ,
      rank10 ,
      min ,
      max
  , profit,
   price ;

  Future createoption() async{
    options.clear();
    await firestore.collection('category').get().then((value) {
      value.docs.forEach((element) {
        print(element['name']);


        options.add(element['name']);

        update();
      });
    });

  }


  postData() {
    firestore.collection('quiz').add({
      'selected': FieldValue.arrayUnion(selectedOptionList.value),
      'name': name,
      'min': min,
      'max': max,
      'date': date,
      'startTime': startTime,
      'EndTime': endTime,
      "Rank1": rank1,
      "Rank2": rank2,
      "Rank3": rank3,
      "Rank4": rank4,
      "Rank5": rank5,
      "Rank6": rank6,
      "Rank7": rank7,
      "Rank8": rank8,
      "Rank9": rank9,
      "Rank10": rank10,
      'profit': profit,
      'price': price,
      'desc': desc
    });
    update();
  }

  postQTF() {
    firestore.collection('Quiz').add({
      'selected': FieldValue.arrayUnion(selectedOptionList.value),
      'question': name,
    });
    update();
  }

  @override
  void onInit() {
    createoption();
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
