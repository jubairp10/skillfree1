import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skillfree/main.dart';

import 'WandAlogin.dart';
import 'login.dart';


// void main(){
//   runApp(DevicePreview(
//       isToolbarVisible: true,
//       builder: (BuildContext context) => MaterialApp(
//         useInheritedMediaQuery: true,
//         debugShowCheckedModeBanner: false,
//         home: firstscreen(),
//       )));
// }
class firstscreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(backgroundColor: Colors.deepPurple[300],
     body: ListView(
       children: [
         SizedBox(height: 60,),
         Padding(
           padding: const EdgeInsets.only(left: 5,right: 180),
           child: Text('Welcome to',style: TextStyle
             (fontSize: 30,color: Colors.black,fontWeight: FontWeight.w800),),
         ),
         SizedBox(height: 5,),
         Padding(
           padding: const EdgeInsets.only(right: 240,left: 5),
           child: Text('SkillFree',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
         ),
         SizedBox(height: 100,),
         Row(
           children: [
             SizedBox(width: 20,),
             Container(
               height: 100,
               width: 150,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.greenAccent,

               ),
               child: InkWell(onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthWrapper()));
               },
                 child: Stack(
                   children: [
                     Positioned(left: 5,top:10,child: Text('User')),
                     Positioned(top: 60,right:5,child: Icon(Icons.arrow_forward_ios_outlined)),
                   ],
                 ),
               ),
             ),
             SizedBox(width:20,),
             Container(
               height: 100,
               width: 150,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.greenAccent,

               ),
               child: InkWell(onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>walogin()));
               },
                 child: Stack(
                   children: [
                     Positioned(left: 5,top:10,child: Text('Worker')),
                     Positioned(top: 60,right:5,child: Icon(Icons.arrow_forward_ios_outlined)),
                   ],
                 ),
               ),
             )
           ],
         ),
         SizedBox(height: 250,),
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: Image(image: AssetImage('assets/icon/img1.png')),
         )
       ],
     ),
   );
  }

}