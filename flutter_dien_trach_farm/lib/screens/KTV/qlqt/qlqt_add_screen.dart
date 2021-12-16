import 'package:flutter/material.dart';
import 'package:flutter_dien_trach_farm/constants/color_constants.dart';
import 'package:flutter_dien_trach_farm/constants/style_constants.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class QLQTAddScreen extends StatefulWidget {
  const QLQTAddScreen({Key? key}) : super(key: key);

  @override
  State<QLQTAddScreen> createState() => _QLQTAddScreenState();
}

class _QLQTAddScreenState extends State<QLQTAddScreen> {
  String dropdownValue = "Dưa hoàng hậu";

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
            "Thêm quy trình mới",
          ),
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                _normalForm(title: "Tên quy trình"),
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
                              value: dropdownValue,
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
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
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return _giaidoanCard(
                              cardColor: Color(
                                      ((index+1) * 0xFF289768)
                                          .toInt())
                                  .withOpacity(1.0),
                              index: index + 1);
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
}

Widget _normalForm({
  required String title,
}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
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
            'Giai đoạn $index',
            style: TextStyle(color: cardColor),
          ),
          subtitle: Row(
            children: [
              const Text('Thời gian:'),
              SizedBox(
                width: 50,
                height: 30,
                child: TextFormField(),
              ),
              const Text("ngày")
            ],
          ),
        ),
      ],
    ),
  );
}
