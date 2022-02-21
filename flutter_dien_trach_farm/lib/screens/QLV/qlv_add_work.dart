import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dien_trach_farm/constants/color_constants.dart';
import 'package:flutter_dien_trach_farm/constants/style_constants.dart';
import 'package:flutter_dien_trach_farm/screens/QLV/qlv_farmers_name.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async' show Future;
import 'qlv_show_full_image.dart';

import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';


class QLVAddWorks extends StatefulWidget{
  const QLVAddWorks({Key? key}) : super(key: key);
  @override
  State<QLVAddWorks> createState() => _QLVAddWorksState();

}

class _QLVAddWorksState extends State<QLVAddWorks>{
  String dropdownValue = 'Chăm sóc cây con';

  // Time picker
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  Future selectedTime(BuildContext context, bool ifPickedTime,
      TimeOfDay initialTime, Function(TimeOfDay) onTimePicked) async {
    var _pickedTime =
    await showTimePicker(context: context, initialTime: initialTime);
    if (_pickedTime != null) {
      onTimePicked(_pickedTime);
    }
  }
  Widget _buildTimePick(bool ifPickedTime, TimeOfDay currentTime,
      Function(TimeOfDay) onTimePicked) {
    return Row(
      children: [
            TextButton(
                child:Text('${currentTime.hour.toString().padLeft(2,'0')}:${currentTime.minute.toString().padLeft(2, '0')}',
                  style: TextStyle(
                      color: greyTextColor,
                      fontWeight: FontWeight.normal, decoration: TextDecoration.underline),),
              onPressed:(){
                selectedTime(context, ifPickedTime, currentTime, onTimePicked);
                 },),
      ],
    );
  }
  // Image Picker
  final ImagePicker _picker = ImagePicker();
  List<XFile> _imageList =[];
  var search = false;

  PickedFile? imageFile=null;
  // Get from gallery
  void _openGallery(BuildContext context) async{
    final List <XFile>? pickedFiles = await _picker.pickMultiImage(
    );
    if (pickedFiles!.isNotEmpty){
      _imageList.addAll(pickedFiles);
    }
    setState((){});
    Navigator.pop(context);
  }

  // Get from Camera
  void _openCamera(BuildContext context)  async{
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera
    );
    if (pickedFile!.path.isNotEmpty){
      _imageList.add(pickedFile);
    }
    setState((){});
    Navigator.pop(context);
  }


  List<String> _ListNameOfFarmer = [];// Danh sách tên của người thực hiện công việc
  // List Name
  final _nameControler = TextEditingController(); // TextField Người thực hiện
  //Suggestion list farmer name
  final suggestionListName = lsFarmerSuggestion;

  // Alert dialog
  Farmer? selectedFarmer;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child:  Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: mainGreenColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: (){
                Get.back();
              },
            ),
            title: const Text("Thêm công việc"),
          ),
          body:
          SingleChildScrollView(
             child: Padding(
               padding: EdgeInsets.only(top: 20),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Center(
                     child: Text('Vuờn 1: 04/10/2021', style: TextStyle(color: mainGreenColor, fontSize: 15)),
                   ),
                   _addWorkTextField(text: 'Mô tả công việc:'),
                   Padding(
                       padding: EdgeInsets.only(right: 40, left: 15, top: 20),
                       child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children:[
                             Text('Thuộc bước:', style:TextStyle(color: greyTextColor, fontSize: 15),),
                             const SizedBox(height: 8),
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
                                       'Chăm sóc cây con',
                                       'Chăm sóc cây và bước vào thụ phấn',
                                       'Thúc quả lớn',
                                       'Bón phân chuyển hóa tạo ngọt ',
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
                           ])
                   ),
                  Padding(
                  padding: EdgeInsets.only(right: 40, left: 15, top: 20),
                    child: Row(
                     children: [
                       Text('Thời gian:   từ', style: TextStyle(color: greyTextColor)),
                       _buildTimePick(true, startTime, (x) {
                         setState(() {
                           startTime = x;
                         });
                       }),
                       Text('đến', style: TextStyle(color: greyTextColor)),
                       _buildTimePick(true, endTime, (x) {
                         setState(() {
                           endTime = x;
                         });
                       }),
                     ] ,
                    ),
                  ),

                   // Người thực hiện:
              Padding(
                  padding: EdgeInsets.only(right: 40, left: 15, top: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text("Người thực hiện",
                          style:TextStyle(
                              color: greyTextColor,
                              fontSize: 15),),
                        const SizedBox(height: 8),
                        Material(
                          borderRadius: BorderRadius.circular(10.0),
                          elevation: 5.0,
                          shadowColor: mainGreenColor,
                          child: SimpleAutocompleteFormField<Farmer>(
                            controller: _nameControler,
                            decoration: normalFormDecoration,
                            suggestionsHeight: 80.0,
                            itemBuilder: (context, f) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Text(f!.name)
                              ]),
                            ),
                            onSearch: (search) async => suggestionListName.where((f)=>
                                f.name.toLowerCase().contains(search.toLowerCase())).toList(),
                            itemFromString: (string) {
                              final matches = suggestionListName.where((f) => f.name.toLowerCase() == string.toLowerCase());
                              return matches.isEmpty ? null : matches.first;
                            },
                            onChanged: (value) => setState(() => selectedFarmer = value),
                            onSaved: (value) => setState(() => selectedFarmer = value),
                            validator: (f) => f == null ? 'Invalid person.' : null,
                            onFieldSubmitted:(value){
                              setState(() {
                                for(Farmer farmer in suggestionListName){
                                  if (farmer.name == value.toString()){
                                    search = true;
                                    break;
                                  }else{
                                    search = false;
                                  }
                                  //_ListNameOfFarmer.add(_nameControler.text.toString());
                                }
                                if(search == true){
                                  _ListNameOfFarmer.add(_nameControler.text.toString());
                                  _nameControler.text = '';
                                }else{
                                  final snackBar = SnackBar(
                                    content: const Text('Không tìm thấy tên này!'),
                                    duration: const Duration(seconds: 3),
                                    // action: SnackBarAction(
                                    //   label: 'Đồng ý',
                                    //   onPressed: () {
                                    //     // _ListNameOfFarmer.add(_nameControler.text.toString());
                                    //     // _nameControler.text = '';
                                    //   },
                                    // ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }
                              });
                            }
                            ),
                        ),
                      ]),
              ),
                   Wrap(
                       children: _ListNameOfFarmer.map((eachName){
                         return _farmerCard(eachName, _ListNameOfFarmer.indexOf(eachName));
                       }).toList(),
                   ),

                   _addWorkTextField(text: 'Vật tư sử dụng:'),
                    Padding(
                        padding: EdgeInsets.only(right: 40, left: 15, top: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              Text('Kết quả công việc:',
                                style:TextStyle(
                                    color: greyTextColor,
                                    fontSize: 15),),
                              const SizedBox(height: 8),
                              IconButton(
                                icon: Icon(Icons.add_photo_alternate_outlined),
                                onPressed: (){
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context){
                                        return AlertDialog(
                                          title: Text('Choose option',
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal),
                                          ),
                                          content: SingleChildScrollView(
                                            child:ListBody(
                                              children: [
                                                InkWell(
                                                  onTap: (){
                                                    _openCamera(context);
                                                  },
                                                  splashColor: Colors.blue.withAlpha(30),
                                                  child: Row(
                                                        children: [
                                                          Padding(
                                                              padding: const EdgeInsets.all(8),
                                                              child: Icon(Icons.camera_alt)
                                                          ),
                                                          Text('Camera')
                                                        ],
                                                      ),
                                                ),
                                                InkWell(
                                                  onTap: (){
                                                    _openGallery(context);
                                                  },
                                                  splashColor: Colors.blue.withAlpha(30),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                          padding: const EdgeInsets.all(8),
                                                          child: Icon(Icons.image)
                                                      ),
                                                      Text('Gallery')
                                                    ],
                                                  ),
                                                )
                                              ],
                                          )

                                            )
                                        );

                                      });

                                },
                                iconSize:50,
                              )
                            ])
                    ),
                   Container(
                     child: _imageList.isEmpty ? Center(child: SizedBox()):
                     GridView.builder(
                            shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:3),
                            itemCount: _imageList.length,
                            itemBuilder: (BuildContext context, int index){
                                return _imageResult(_imageList[index], index);
                              }),
                   ),


                   Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         FlatButton(
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(30),
                             ),
                             child: Text('Hủy bỏ',
                               style: TextStyle(
                                   color: Colors.white,
                                   fontFamily: 'OpenSans')
                             ),
                             onPressed: (){
                               print("Hủy bỏ");
                             },
                           color: Colors.red,
                           ),
                         SizedBox(
                           width: 20,
                         ),
                         FlatButton(
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(30),
                           ),
                           child: Text('Xác nhận',
                               style: TextStyle(
                               color: Colors.white,
                               fontFamily: 'OpenSans')),
                           onPressed: (){
                             print("Xác nhận");
                           },
                           color: mainGreenColor,
                         )
                       ],
                   )
                 ],
               ),
             )
          )
        ),
    );
  }
  Widget _farmerCard(var NameOfFarmer, int index){
    return Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Container(
            child: Card(
              margin: const EdgeInsets.all(10),
              color: qlvNameCardColor,
              elevation: 5,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child:
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(padding: EdgeInsets.only(left: 10),
                    child: Image(image: AssetImage("assets/people.png"),
                      height: 20,
                      width: 20,
                    ),),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(NameOfFarmer, style: TextStyle(color: Color(0xFF5C5C5C))),
                  ),
                  Container(
                      height: 18.0,
                      width: 18.0,
                      child: IconButton(
                        padding: new EdgeInsets.all(0.0),
                        icon: new Icon(Icons.clear, size: 15.0),
                        color: Color(0xFF5C5C5C),
                        onPressed: () {
                          setState(() {
                            _ListNameOfFarmer.removeAt(index);
                          });
                        },
                      )
                  )
                ],
              ),)
        )
    );
  }
  // Thông báo khi thêm một nông dân

  Widget _imageResult(var imageFile, int index){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder:(context) => ShowFullImages(imageResultFull: imageFile)));
      },
      child: Card(
          child: (Stack(children: <Widget>[
            Image.file(File(imageFile!.path), width: 270, height: 200, fit: BoxFit.cover,),
            Positioned(
              top: -5,
              right:-5,
              child:IconButton(
                icon:Icon(Icons.close, size: 22,color: Colors.black45),
                splashColor: Colors.blue.withAlpha(30),
                onPressed: (){
                  setState(() {
                    _imageList.removeAt(index);
                  });
                },
              ),
            )
          ],)
          )),
    );

  }
}
Widget _addWorkTextField({@required text}) {
  return  Padding(
        padding: EdgeInsets.only(right: 40, left: 15, top: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text(text,
                style:TextStyle(
                    color: greyTextColor,
                    fontSize: 15),),
              const SizedBox(height: 8),
               Material(
                 borderRadius: BorderRadius.circular(10.0),
                 elevation: 5.0,
                 shadowColor: mainGreenColor,
                child: TextField(
                   decoration: normalFormDecoration,
                 ),
               )
            ])
  );


}





