import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class feedback extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feedback'),
        leading: IconButton(icon:Icon(Icons.arrow_back_ios_new), onPressed: () {
          Navigator.pop(context);
        },),),
      body: ListView(
        children: [
          Row(mainAxisSize: MainAxisSize.min,
            children: [
              Text('Your Feedback Here!',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),
              Icon(Icons.edit,size: 20,color: Colors.black,)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(decoration: InputDecoration(labelText: 'Worker Id',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),prefixIcon: Icon(Icons.person)),),
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
                  hintText: "Feedback",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.feedback)
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