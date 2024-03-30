import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

// final List categorys=[
//   {
//     'icon':FaIcon(FontAwesomeIcons.paintbrush);
//     'work':'Painters'
//      'num':350
//   },
// {
// 'icon':FaIcon(FontAwesomeIcons.paintbrush);
// 'work':'Painters'
// 'num':350
// },
// {
// 'icon':FaIcon(FontAwesomeIcons.paintbrush);
// 'work':'Painters'
// 'num':350
// }
// ];
// void main(){
//   runApp(DevicePreview(
//       isToolbarVisible: true,
//       builder: (BuildContext context) => MaterialApp(
//         useInheritedMediaQuery: true,
//         debugShowCheckedModeBanner: false,
// //         home: category(txt: '', icons: Icon(Icons.add), num: '1', num1: 'views',),
//       )));}
final List Photos=[
  {
    'assets/image/electrition.jpg',

  },
  {
    'assets/image/electrition.jpg',

  },{
    'assets/image/electrition.jpg',

  }


];
class category extends StatelessWidget{
  category({
    Key? key,
    required this.txt,
    required this.icons,
    required this.num,
    required this.num1,
    required this.img,


  }): super(key: key);
  final String txt;
  final Icon icons;
  final String num;
  final String num1;
  final String? img ;

  @override
  Widget build(BuildContext context) {

    return Container(height:180,
      width: 140,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical:20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(fit: BoxFit.cover, image:AssetImage(img!))),
      child: Stack(
        children:[Positioned(top: 80,left:10,child: Text(txt,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.blue),)),
        Positioned(top:5,left:5,child:CircleAvatar(radius: 30,child: icons,)),
          Positioned(top: 120,left: 10,
            child: Column(
              children: [
                Text(num,style: TextStyle(fontSize:15,fontWeight:FontWeight.bold,color: Colors.yellowAccent),),
                Text(num1,style: TextStyle(fontSize: 10,fontWeight:FontWeight.bold,color: Colors.green),),
              ],
            ),
          )
        ]
      ),
    );
  }}
