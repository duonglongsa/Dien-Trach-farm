import 'package:flutter/material.dart';
import 'package:flutter_dien_trach_farm/constants/color_constants.dart';
import 'package:flutter_dien_trach_farm/constants/style_constants.dart';
import 'package:flutter_dien_trach_farm/models/giaidoan_model.dart';
import 'package:flutter_dien_trach_farm/models/quytrinh_model.dart';
import 'package:get/get.dart';

import 'qlqt_view_controller.dart';

class QLQTViewScreen extends StatefulWidget {
  final QuyTrinhModel quytrinh;

  const QLQTViewScreen({Key? key, required this.quytrinh}) : super(key: key);

  @override
  State<QLQTViewScreen> createState() => _QLQTViewScreenState();
}

class _QLQTViewScreenState extends State<QLQTViewScreen> {
  final QLQTViewController qlqtViewController = Get.put(QLQTViewController());

  @override
  void initState() {
    super.initState();
    qlqtViewController.quyTrinhModel = widget.quytrinh;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder(
        init: qlqtViewController,
        builder: (_) {
          return Form(
            key: qlqtViewController.formKey,
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
                title: Text(
                  widget.quytrinh.ten!,
                ),
              ),
              body: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: TextButton(
                            child: const Text(
                              "Chỉnh sửa",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () => qlqtViewController.onEditTap(),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0))),
                            ),
                          ),
                        ),
                      ),
                      _normalForm(
                        ten: qlqtViewController.quyTrinhModel!.ten ?? "",
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Loại cây trồng áp dụng",
                              style: TextStyle(
                                color: greyTextColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Material(
                              borderRadius: BorderRadius.circular(10.0),
                              elevation: 5.0,
                              shadowColor: mainGreenColor,
                              child: InputDecorator(
                                decoration: normalFormDecoration,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    isDense: true,
                                    isExpanded: true,
                                    value: qlqtViewController.loaiCayTrong,
                                    elevation: 16,
                                    style: const TextStyle(color: Colors.black),
                                    onChanged: null,
                                    items: <String>[
                                      'Dưa hoàng hậu',
                                    ].map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Các giai đoạn chăm sóc",
                              style: TextStyle(
                                color: greyTextColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: qlqtViewController
                                  .quyTrinhModel!.cacGiaiDoan!.length,
                              itemBuilder: (context, index) {
                                return _giaidoanCard(
                                  cardColor:
                                      Color(((index + 1) * 0xFF289768).toInt())
                                          .withOpacity(1.0),
                                  index: index,
                                  giaiDoan: qlqtViewController
                                      .quyTrinhModel!.cacGiaiDoan![index],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }

  Widget _normalForm({required String ten}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Tên quy trình",
            style: TextStyle(
              color: greyTextColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          const SizedBox(height: 10.0),
          Material(
            borderRadius: BorderRadius.circular(10.0),
            elevation: 5.0,
            shadowColor: mainGreenColor,
            child: TextFormField(
              key: Key(ten),
              initialValue: ten,
              enabled: false,
              onChanged: (value) {},
              keyboardType: TextInputType.name,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
              decoration: normalFormDecoration,
            ),
          ),
        ],
      ),
    );
  }

  Widget _giaidoanCard({
    required Color cardColor,
    required int index,
    required GiaiDoanModel giaiDoan,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 5,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(
              'Giai đoạn ${index + 1}',
              style: TextStyle(
                color: cardColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text('Thời gian:'),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 25,
                      height: 25,
                      child: TextFormField(
                        key: Key(giaiDoan.thoiGian.toString()),
                        initialValue: giaiDoan.thoiGian.toString(),
                        enabled: false,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("ngày")
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Các bước:'),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: giaiDoan.cacBuoc!.length,
                              itemBuilder: (context, index) {
                                return _buocCard(
                                  cardColor: cardColor,
                                  isEditing: false,
                                  buoc: giaiDoan.cacBuoc![index],
                                );
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buocCard({
    required Color cardColor,
    required bool isEditing,
    required String buoc,
  }) {
    return Card(
      color: cardColor,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        height: 20,
        child: TextFormField(
          key: Key(buoc),
          initialValue: buoc,
          enabled: isEditing,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 14),
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.white70, fontSize: 15),
        ),
      ),
    );
  }
}
