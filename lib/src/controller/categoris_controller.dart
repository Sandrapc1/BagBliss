import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  final CollectionReference productRef =
      FirebaseFirestore.instance.collection('products');
  final RxList<Map<String, String>> categoriesList =
      RxList<Map<String, String>>();
  final RxBool isLoading = RxBool(true);

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

   fetchCategories() async {
    try {
      var snapshot = await productRef.get();
      categoriesList.assignAll(
        snapshot.docs.map((doc) => (doc.data() as Map<String, String>)).toList(),
      );
      return categoriesList;
      // isLoading.value = false;
    } catch (error) {
      isLoading.value = false;
    }
  }
}

