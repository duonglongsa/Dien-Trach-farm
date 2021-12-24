import 'package:flutter/material.dart';
import 'package:flutter_dien_trach_farm/constants/color_constants.dart';
import 'package:flutter_dien_trach_farm/constants/style_constants.dart';
import 'package:flutter_dien_trach_farm/models/giaidoan_model.dart';
import 'package:flutter_dien_trach_farm/models/quytrinh_model.dart';
import 'package:get/get.dart';

import 'qlqt_edit_controller.dart';

class QLQTEditScreen extends StatefulWidget {
  final QuyTrinhModel quytrinh;
  final bool isAdding;

  const QLQTEditScreen(
      {Key? key, required this.quytrinh, required this.isAdding})
      : super(key: key);

  @override
  State<QLQTEditScreen> createState() => _QLQTEditScreenState();
}

class _QLQTEditScreenState extends State<QLQTEditScreen> {
  final QLQTEditController qlqtEditController = Get.put(QLQTEditController());

  @override
  void initState() {
    super.initState();
    qlqtEditController.quyTrinhModel = widget.quytrinh;
    qlqtEditController.isAdding = widget.isAdding;
  }

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
          title: widget.isAdding
              ? const Text(
                  "Thêm quy trình mới",
                )
              : Text(
                  widget.quytrinh.ten!,
                ),
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: GetBuilder<QLQTEditController>(
                init: qlqtEditController,
                builder: (context) {
                  return Form(
                    key: qlqtEditController.formKey,
                    child: Column(
                      children: [
                        _normalForm(
                          ten: qlqtEditController.quyTrinhModel!.ten ?? "",
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
                                      hint: const Text("Chọn loại cây trồng"),
                                      value: qlqtEditController.quyTrinhModel!.loaiCayTrong,
                                      elevation: 16,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          qlqtEditController.quyTrinhModel!.loaiCayTrong = newValue;
                                        });
                                      },
                                      items: <String>[
                                        'Dưa hoàng hậu',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
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
                                itemCount: qlqtEditController
                                        .quyTrinhModel!.cacGiaiDoan.length,
                                itemBuilder: (context, index) {
                                  return _giaidoanCard(
                                      cardColor: Color(
                                              ((index + 1) * 0xFF289768)
                                                  .toInt())
                                          .withOpacity(1.0),
                                      giaiDoanIndex: index,
                                      giaiDoan: qlqtEditController
                                          .quyTrinhModel!.cacGiaiDoan[index],
                                      addBuoc: qlqtEditController.addBuoc);
                                },
                              ),
                              Card(
                                margin: const EdgeInsets.only(bottom: 10),
                                elevation: 5,
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10.0),
                                  onTap: () => qlqtEditController.addGiaiDoan(),
                                  child: SizedBox(
                                    height: 40,
                                    child: TextFormField(
                                      enabled: false,
                                      textAlign: TextAlign.center,
                                      initialValue: "+",
                                      style: TextStyle(
                                        color: mainGreenColor,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(bottom: 8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    TextButton(
                                      child: const Text(
                                        "Hủy bỏ",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () =>
                                          qlqtEditController.onCancelEditTap(),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                cancelRedColor),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0))),
                                      ),
                                    ),
                                    TextButton(
                                      child: const Text(
                                        "Xác nhận",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () =>
                                          qlqtEditController.onConfirmTap(),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                mainGreenColor),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0))),
                                      ),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
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
              onSaved: (value) => qlqtEditController.quyTrinhModel!.ten = value!,
              initialValue: ten,
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
    required int giaiDoanIndex,
    required GiaiDoanModel giaiDoan,
    required Function(int) addBuoc,
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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Giai đoạn ${giaiDoanIndex + 1}',
                  style: TextStyle(
                    color: cardColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  iconSize: 20,
                  onPressed: () {},
                  icon: Icon(Icons.delete, color: cancelRedColor),
                ),
              ],
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
                        onSaved: (value) {
                          qlqtEditController
                            .quyTrinhModel!
                            .cacGiaiDoan[giaiDoanIndex]
                            .thoiGian = int.parse(value!);
                          giaiDoan.stt = giaiDoanIndex;
                        },
                        initialValue: giaiDoan.thoiGian != null ? giaiDoan.thoiGian.toString() : "",
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
                                  buoc: giaiDoan.cacBuoc![index],
                                  giaiDoanIndex: giaiDoanIndex,
                                  buocIndex: index,
                                );
                              }),
                          Card(
                            color: cardColor,
                            margin: const EdgeInsets.only(bottom: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10.0),
                              onTap: () => addBuoc(giaiDoanIndex),
                              child: SizedBox(
                                height: 20,
                                child: TextFormField(
                                  enabled: false,
                                  initialValue: "+",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(0, 0, 0, 14),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
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
    required String buoc,
    required int giaiDoanIndex,
    required int buocIndex,
  }) {
    return Card(
      color: cardColor,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          SizedBox(
            height: 20,
            child: TextFormField(
              onSaved: (value) {
                qlqtEditController.quyTrinhModel!.cacGiaiDoan![giaiDoanIndex]
                    .cacBuoc![buocIndex] = value!;
        
              },
              initialValue: buoc,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 14),
                border: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.white70, fontSize: 15),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 20,
              child: IconButton(
                padding: EdgeInsets.zero,
                iconSize: 20,
                onPressed: () {},
                icon: Icon(
                  Icons.close,
                  color: cancelRedColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
