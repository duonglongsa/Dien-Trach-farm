import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dien_trach_farm/constants/color_constants.dart';
import 'package:flutter_dien_trach_farm/screens/QLV/qlv_add_work.dart';
import 'package:flutter_dien_trach_farm/screens/QLV/qlv_list_works.dart';
import 'package:get/get.dart';

class QLVListWorks extends StatefulWidget {
  const QLVListWorks({Key? key}) : super(key: key);

  @override
  State<QLVListWorks> createState() => _QLVListWorksState();
}

class _QLVListWorksState extends State<QLVListWorks>  {
  @override
  Widget build (BuildContext context){
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: mainGreenColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (){
              Get.back();
            },
          ),
          title: const Text("Vườn 1"),
        ),

        body:
        Padding(padding:EdgeInsets.only(top: 30) ,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child:Text('Danh sách công việc trong ngày:', style: TextStyle(color: mainGreenColor))
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index){
                      return _gardentCard(context: context, index: index);
                    }),
              ],
            )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => QLVAddWorks()),
            );

          },
          backgroundColor: mainGreenColor,
          child: const Icon(Icons.add),

        ),

      ),
    );
  }
}

Widget _gardentCard({required BuildContext context,required int index}){
  return Card(
      semanticContainer: true,
      margin: const EdgeInsets.fromLTRB(5, 20, 5, 0),
      elevation: 5,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
        },
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center ,
            children: <Widget>[
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('7h30-8h00: Bón phân cho cây')
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        TextButton(
                          child: const Text(
                            'Sửa',
                            style: TextStyle(color: Colors.blue),
                          ),
                          onPressed: () {/* ... */},
                        ),
                        TextButton(
                          child: const Text('Xóa', style: TextStyle(color: Colors.red),),
                          onPressed: () {/* ... */},
                        ),
                      ],
                    ),
                  )
                ],
              )
      ),
    );
}