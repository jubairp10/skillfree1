import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skillfree/admin/paintersreg.dart';

class addworkers extends StatefulWidget{

  @override
  State<addworkers> createState() => _addworkersState();
}

class _addworkersState extends State<addworkers> {

  var works=['Painters','Electritian','Plumber'];
  var code=['101','102','103'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:Colors.lightBlue[200] ,
      appBar: AppBar(title: Text('Category'),
        leading: IconButton(icon:Icon(Icons.arrow_back_ios_new), onPressed: () {
          Navigator.pop(context);
        },),
      ),
      body: ListView(
        children: [
      Card(color: Colors.white,
        child: ListTile(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>pregister()));
        },
        title: Text('Painters'),
        subtitle: Text('Works Id:101'),
            ),
      ),
          Card(color: Colors.white,
            child: ListTile(
              title: Text('Electritian'),
              subtitle: Text('Works Id:102'),
            ),
          ),
          Card(color: Colors.white,
            child: ListTile(
              title: Text('Plumber'),
              subtitle: Text('Works Id:103'),
            ),
          ),
        ],
      ),

    );
  }
}