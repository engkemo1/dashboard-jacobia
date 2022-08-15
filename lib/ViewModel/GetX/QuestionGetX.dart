import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QustionGetX extends GetxController {
  List<String> options = [];
  Rx<List<String>> selectedOptionList = Rx<List<String>>([]);
  var selectedOption = ''.obs;

  @override
  void onInit() {
    FirebaseFirestore.instance
        .collection('category')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        options.add(doc["name"]);
      });
    });
    super.onInit();
  }

  @override
  void onReady() {

    super.onReady();
  }

  @override
  void onClose() {}
}