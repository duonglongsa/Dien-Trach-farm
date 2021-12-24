import 'package:flutter_dien_trach_farm/models/quytrinh_model.dart';
import 'package:flutter_dien_trach_farm/screens/KTV/qlqt/quytrinh_edit/qlqt_edit_screen.dart';
import 'package:flutter_dien_trach_farm/screens/KTV/qlqt/quytrinh_view/qlqt_view_screen.dart';
import 'package:flutter_dien_trach_farm/services/firebase_services.dart';
import 'package:get/get.dart';

class QLQTController extends GetxController{

  final quytrinhList = <QuyTrinhModel>[].obs;
  List<QuyTrinhModel> get quytrinh => quytrinhList.value;

  @override
  void onInit(){
    super.onInit();
    quytrinhList.bindStream(quyTrinhListStream());
  }

  void onQLQTTap(QuyTrinhModel quyTrinhModel) async {
    await getGiaiDoanList(quyTrinhModel);
    Get.to(() => QLQTViewScreen(quytrinh: quyTrinhModel));
  }

  void onAddTap() async {
    Get.to(() => QLQTEditScreen(quytrinh: QuyTrinhModel(), isAdding: true,));
  }

}