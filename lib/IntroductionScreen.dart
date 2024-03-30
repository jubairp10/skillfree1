import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skillfree/firstscreen.dart';

import 'main.dart';
// void main(){
//   runApp(MaterialApp(
//     useInheritedMediaQuery: true,
//     debugShowCheckedModeBanner: false,
//     home: MyApp(),
//
//   ),
//   );
//
// }


class splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                firstscreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child:Center(child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40)),
        child: Image(image: AssetImage('assets/icon/photo_2024-03-03_23-28-57.jpg'),fit: BoxFit.cover,)))
    );
  }
}
// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title:Text("GeeksForGeeks")),
//       body: Center(
//           child:Text("Home page",textScaleFactor: 2,)
//       ),
//     );
//   }
// }
