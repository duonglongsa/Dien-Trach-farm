import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ShowFullImages extends StatefulWidget{
  final XFile imageResultFull;
  const ShowFullImages({ Key? key, required this.imageResultFull}) : super(key: key);
  @override
  State<ShowFullImages> createState() => _ShowFullImageState();

}
class _ShowFullImageState extends State<ShowFullImages>  {

  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black26,
          appBar:AppBar(
            backgroundColor: Colors.black26 ,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
            onPressed: (){
            Get.back();
            },
          )
        ),
          body:
            Center(
              child: Image.file(File(widget.imageResultFull.path), fit: BoxFit.fill),
            )
    ));
  }


}
