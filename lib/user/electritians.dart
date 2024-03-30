import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../PaintersData/datas.dart';


class electritian extends StatefulWidget{
  @override
  State<electritian> createState() => _electritianState();
}

class _electritianState extends State<electritian> {
  var id=[001];
  var name= ['John Smith'];
  var daily_wage= [800];
  var locality=['Pattambi'];
  var function=['House painting'];
  var image= ['assets/icon/person.png'];
  var description=['The master painter is a visionary artist with an unparalleled ability to breathe life onto canvas or any medium chosen. With strokes that dance between imagination and reality, they capture the essence of their subject matter, whether it be landscapes, portraits, abstracts, or scenes from memory. Their work transcends mere representation, evoking emotions, sparking curiosity, and inviting viewers into a world where colors and shapes converse in a language of their own'];

  @override
  Widget build(BuildContext context) {

    return Scaffold(backgroundColor: Colors.lightBlue,
      body: Stack(
        children: [

          Container(
            height: 300,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/icon/person.png'),fit: BoxFit.fill)),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 300),
            child: ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
              child: Container(
                padding: EdgeInsets.all(10),
                height: double.infinity,
                color: Colors.white,
                child: ListView(
                  children: [
                    SizedBox(height: 30,),
                    Text('001'),
                    Text('John Smith',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Icon(Icons.location_on,color: Colors.grey,),
                        Text('Pattambi',style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                    Text('House painting',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text('OverView:',style: TextStyle(fontWeight: FontWeight.bold),),
                    Text('The master painter is a visionary artist with an unparalleled ability to breathe life onto canvas or any medium chosen. With strokes that dance between imagination and reality, they capture the essence of their subject matter, whether it be landscapes, portraits, abstracts, or scenes from memory. Their work transcends mere representation, evoking emotions, sparking curiosity, and inviting viewers into a world where colors and shapes converse in a language of their own'),
                    SizedBox(height: 10,),
                    Text('Daily Wage:800\/-',style: TextStyle(fontWeight: FontWeight.bold),),
                    Row(mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 40,width: 40,
                          margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.teal,),
                          child: Center(child: FaIcon(FontAwesomeIcons.whatsapp)),
                        ),
                        Container(
                          height: 40,width: 260,
                          margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.teal,),
                          child: Center(child: Text('Book Now')),
                        ),
                        InkWell(
                          child: Container(
                            height: 40,width: 40,
                            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.teal,),
                            child: Center(child: FaIcon(FontAwesomeIcons.edit)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}