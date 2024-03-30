import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class postwork extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text('Work POST'),
       leading: IconButton(icon:Icon(Icons.arrow_back_ios_new), onPressed: () {
         Navigator.pop(context);
       },),),
     body: ListView(
       children: [
         Row(mainAxisSize: MainAxisSize.min,
           children: [
             Text('Your Works Post Here!',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),
             Icon(Icons.edit,size: 20,color: Colors.black,)
           ],
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextField(decoration: InputDecoration(labelText: 'Work',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),prefixIcon: Icon(Icons.person)),),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextField(decoration: InputDecoration(labelText: 'Place',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),prefixIcon: Icon(Icons.person)),),
         ),
         Container(height: 500,
           margin: const EdgeInsets.symmetric(horizontal:5,vertical: 5),
           padding: const EdgeInsets.all(5.0),
           decoration: BoxDecoration(
               color: Colors.grey,
               borderRadius: BorderRadius.circular(20.0)
           ),
           child: TextField(
             decoration: InputDecoration(
                 hintText: "Works Post",
                 border: InputBorder.none,
                 prefixIcon: Icon(Icons.work)
             ),
           ),
         ),
         Center(child: MaterialButton(onPressed: (){
           Navigator.pop(context);
         },child: Text('Cancel'),)),
         Center(child: MaterialButton(onPressed: (){},child: Text('Send'),))
       ],
     ),
   );
  }

}