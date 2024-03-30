import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: topworkers(),));
}
class topworkers extends StatelessWidget{
  var name=['Jasir P','Anas K','Rahul M','Jacob N','Ansil','Irfan kk'];
  var work=['Painter','Electretian','Plumber','Painter','Electretian','Plumber'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: name.length,itemBuilder: (context,index){
        return  ExpansionTile(leading: Image(image: AssetImage('assets/icon/man_4140037.png'),),title:Text('${name[index]}',),subtitle: Text('${work[index]}'),
        //   trailing:
          //   Row(children: [
        //   Icon(Icons.star, color: Colors.yellowAccent,size: 20.0,),
        //   Icon(Icons.star, color: Colors.yellowAccent,size: 20.0,),Icon(Icons.star, color: Colors.yellowAccent,size: 20.0,),Icon(Icons.star, color: Colors.yellowAccent,size: 20.0,),
        //   Icon(Icons.star_border, color: Colors.grey,size: 20.0,),
        // ],),
        );
      });
  }

}