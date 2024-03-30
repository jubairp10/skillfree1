import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Activity extends StatelessWidget{
  final  Icon icn;
  final String txt;
  final Color clr;
  final VoidCallback tap;
  Activity({
    Key?key,
    required this.icn, required this.txt, required this.clr, required this.tap,
}):super(key: key);
  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
       ClipRRect(
         borderRadius: BorderRadius.circular(10),
         child: InkWell(
           onTap: tap,
           child: Container(
             height: 60,width: 60,
             color: clr,
             child: icn,
           ),
         ),
       ),
       Text(txt)
     ],
   );
  }

}