import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:device_preview/device_preview.dart';

import 'category.dart';
// void main(){
//   runApp(DevicePreview(
//       isToolbarVisible: true,
//       builder: (BuildContext context) => MaterialApp(
//         useInheritedMediaQuery: true,
//         debugShowCheckedModeBanner: false,
//         home: wcatecory(),
//       )));}
class wcatecory extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:
          Row(
            children: [
              category(txt: 'Painters', icons: Icon(Icons.brush), num: '350+', num1: 'views', img: 'assets/image/painter.jpg',),
              SizedBox(width: 10,),
              category(txt: 'Electrietion', icons: Icon(Icons.electrical_services), num: '400+', num1: 'views', img: 'assets/image/electrition.jpg',),
              SizedBox(width: 10,),
              category(txt: 'Plumber', icons: Icon(Icons.plumbing), num: '40+', num1: 'views', img: 'assets/image/plumber.jpg',)
            ],
          ),

      ),
    );
  }

}