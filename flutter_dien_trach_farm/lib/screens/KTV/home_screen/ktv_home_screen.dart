import 'package:flutter/material.dart';
import 'package:flutter_dien_trach_farm/constants/color_constants.dart';

class KTVHome extends StatefulWidget {
  const KTVHome({Key? key}) : super(key: key);

  @override
  State<KTVHome> createState() => _KTVHomeState();
}

class _KTVHomeState extends State<KTVHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: mainGreenColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                child: Container(
                  height: double.infinity,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        _managmentCard(
                          assetImage: const AssetImage("assets/field.png"),
                          title: "Quản lý vườn",
                          cardColor: qlvCardColor,
                        ),
                        _managmentCard(
                          assetImage: const AssetImage("assets/shovels.png"),
                          title: "Quản lý mùa vụ",
                          cardColor: qlmvCardColor,
                        ),
                        _managmentCard(
                          assetImage: const AssetImage("assets/smart-farm.png"),
                          title: "Quản lý quy trình",
                          cardColor: qlqtCardColor,
                        ),
                        _managmentCard(
                          assetImage: const AssetImage("assets/farmer.png"),
                          title: "Quản lý nhân công",
                          cardColor: qlncCardColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _managmentCard({
  required AssetImage assetImage,
  required String title,
  required Color cardColor,
}) {
  return Card(
    margin: const EdgeInsets.all(10),
    color: cardColor,
    elevation: 5,
    shadowColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Container(
        alignment: Alignment.center,
        height: 100,
        child: ListTile(
          leading: Image(
            image: assetImage,
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFFE5E5E5),
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
