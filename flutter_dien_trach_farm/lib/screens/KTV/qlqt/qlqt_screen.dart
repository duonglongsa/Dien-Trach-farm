import 'package:flutter/material.dart';
import 'package:flutter_dien_trach_farm/constants/color_constants.dart';
import 'package:get/get.dart';

class QLQTScreen extends StatefulWidget {
  const QLQTScreen({Key? key}) : super(key: key);

  @override
  State<QLQTScreen> createState() => _QLQTScreenState();
}

class _QLQTScreenState extends State<QLQTScreen> {
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
        body: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return _quytrinhCard(
               
              );
            }),
      ),
    );
  }
}

Widget _quytrinhCard(

) {
  return Card(
    margin: const EdgeInsets.fromLTRB(5, 20, 5, 0),
    elevation: 5,
    shadowColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          title: Text('Quy trình chuẩn 1'),
          subtitle: Text('Loại cây trồng: dưa hoàng hậu'),
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
  );
}
