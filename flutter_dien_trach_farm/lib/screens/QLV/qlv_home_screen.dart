import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dien_trach_farm/constants/color_constants.dart';
import 'package:flutter_dien_trach_farm/screens/QLV/qlv_list_works.dart';

class QLVHome extends StatefulWidget {
  const QLVHome({Key? key}) : super(key: key);

  @override
  State<QLVHome> createState() => _KTVHomeState();
}

class _KTVHomeState extends State<QLVHome>  {
  @override
  Widget build (BuildContext context){
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: mainGreenColor,
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: (){
                // Menu
              },
            ),
            title: const Text("Chọn vườn"),
            actions:<Widget>[
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is alert!')));
                },
              )
            ],
          ),
          body: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index){
                return _gardentCard(context: context, index: index);
              }),
        ),
    );
  }
}

Widget _gardentCard({required BuildContext context,required int index}){
  return SizedBox(
    height: 150,
    child: Card(
      semanticContainer: true,
      margin: const EdgeInsets.fromLTRB(5, 20, 5, 0),
      elevation: 5,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        splashColor: qlvCardColor,
        onTap: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => QLVListWorks()),
          );
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: Text('Vườn ${index+1}', style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: new EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child:  Text('Mùa vụ hiện tại: Dưa hoàng hậu'),
                    ),
                    Container(
                      child:  Text('Quy trình: Quy trình chuẩn 1',),
                    ),
                  ],
                ),

              ),
            ]),
      ),
    ),
  );
}