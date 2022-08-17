import 'package:dashboard/constant.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QustionGetX extends GetxController {
  List<String> options =[];

  Rx<List<String>> selectedOptionList = Rx<List<String>>([]);
  var selectedOption = ''.obs;
  String? imageUrl;
  int type=0;
  String question = "";
  String option1 = "", option2 = "", option3 = "", option4 = "", option5 = "";
  String? answer;
  bool answertf=true;
  bool isLoading = false;



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

  postQOptions() {
    firestore.collection('question').add({
      'selected': FieldValue.arrayUnion(selectedOptionList.value),
      'question': question,
      'type': type==0?'options':'True/False',
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'option4': option4,
      'option5': option5,
      "answer": answer
    });
    update();
  }

  postQTF() {
    firestore.collection('question').add({
      'selected': FieldValue.arrayUnion(selectedOptionList.value),
      'question': question,
      'type': type,
      'answer': answertf,
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
