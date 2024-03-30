import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skillfree/worker/waccount.dart';
import 'package:skillfree/worker/whome.dart';


// void  main(){
//   runApp(MaterialApp(home: workerbottomnavigation(),));
// }




class workerbottomnavigation extends StatefulWidget {
  @override
  State<workerbottomnavigation> createState() => _navigationState();
}

class _navigationState extends State<workerbottomnavigation> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: index,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          onTap: (tap) {
            setState(() {
              index = tap;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account")
          ],
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Center(
            child: _getpage(index),
          ),
        ));
  }
}

_getpage(int page) {
  switch (page) {
    case 0:
      return workerhome();
    case 1:
      return woSettings();
  }
}