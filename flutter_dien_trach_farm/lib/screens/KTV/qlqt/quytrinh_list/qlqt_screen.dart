import 'package:flutter/material.dart';
import 'package:flutter_dien_trach_farm/constants/color_constants.dart';
import 'package:flutter_dien_trach_farm/models/quytrinh_model.dart';
import 'package:flutter_dien_trach_farm/screens/KTV/qlqt/quytrinh_view/qlqt_view_screen.dart';
import 'package:get/get.dart';

import 'qlqt_screen_controller.dart';

class QLQTScreen extends StatefulWidget {
  const QLQTScreen({Key? key}) : super(key: key);

  @override
  State<QLQTScreen> createState() => _QLQTScreenState();
}

class _QLQTScreenState extends State<QLQTScreen> {
  final QLQTController qlqtController = Get.put(QLQTController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: mainGreenColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
          title: const Text(
            "Quản lý quy trình",
          ),
        ),
        body: Obx(
          () => ListView.builder(
              itemCount: qlqtController.quytrinh.length,
              itemBuilder: (context, index) {
                return _quytrinhCard(
                  quytrinh: qlqtController.quytrinh[index],
                  onCardTap: qlqtController.onQLQTTap,
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => qlqtController.onAddTap(),
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

Widget _quytrinhCard({
  required QuyTrinhModel quytrinh,
  required void Function(QuyTrinhModel quyTrinhModel) onCardTap
}) {
  return Card(
    margin: const EdgeInsets.fromLTRB(5, 20, 5, 0),
    elevation: 5,
    shadowColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: () => onCardTap(quytrinh),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(quytrinh.ten!),
            subtitle: Text("Loại cây trồng: " + quytrinh.loaiCayTrong!),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text(
                  'Xóa',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {/* ... */},
              ),
              TextButton(
                child: const Text('Sửa'),
                onPressed: () {/* ... */},
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
