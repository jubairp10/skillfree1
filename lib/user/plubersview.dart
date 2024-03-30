import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skillfree/user/painters.dart';
import 'package:skillfree/user/plumbers.dart';

import '../PaintersData/datas.dart';


// void main(){
//   runApp(MaterialApp(home:plumbersview(),
//   )
//   );
// }
class plumbersview extends StatefulWidget{
  @override
  State<plumbersview> createState() => _paintersviewState();
}

class _paintersviewState extends State<plumbersview> {
  var id=[001];
  var name= ['John Smith'];
  var daily_wage= [800];
  var locality=['Pattambi'];
  var function=['House painting'];
  var image= ['assets/icon/person.png'];
  var description=['The master painter is a visionary artist with an unparalleled ability to breathe life onto canvas or any medium chosen. With strokes that dance between imagination and reality, they capture the essence of their subject matter, whether it be landscapes, portraits, abstracts, or scenes from memory. Their work transcends mere representation, evoking emotions, sparking curiosity, and inviting viewers into a world where colors and shapes converse in a language of their own'];



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text('Painters'),

          leading: IconButton(icon:Icon(Icons.arrow_back_ios_new), onPressed: () {
            Navigator.pop(context);
          },),
          bottom:AppBar(
            flexibleSpace: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.0)
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Near by workers",
                  border: InputBorder.none,
                  icon: IconButton(onPressed: (){}, icon: const Icon(Icons.location_on_outlined)),
                ),
              ),
            ),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return  Card(color: Colors.lightBlue[100],
              child: ListTile(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>plumbers()));
              },
                leading: CircleAvatar(backgroundImage: AssetImage('${image[index]}'),),
                title: Text('${name[index]}',style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text('${function[index]}',style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('Daily Wage:${daily_wage[index]}\/-',style: TextStyle(color:Colors.blueGrey )),
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Icon(Icons.location_on),
                          Text('${locality[index]}')
                        ],
                      ),

                    ]),
                trailing: Wrap(
                  children: [
                    Icon(Icons.star, color: Colors.yellowAccent,size: 20.0,),
                    Icon(Icons.star, color: Colors.yellowAccent,size: 20.0,),Icon(Icons.star, color: Colors.yellowAccent,size: 20.0,),Icon(Icons.star, color: Colors.yellowAccent,size: 20.0,),
                    Icon(Icons.star_border, color: Colors.grey,size: 20.0,),
                  ],),
              ),
            );},itemCount: 1,
        )


      // floatingActionButton: Obx(() =>
      // controller.isInternetConnected.value ? buildFAB() : Container()),

    );
  }
// FloatingActionButton buildFAB() {
//   return FloatingActionButton(
//       backgroundColor: Colors.blueGrey,
//       onPressed: () {
//         controller.isListScrollToDown.value
//             ? controller.scrollListUpWard()
//             : controller.scrollListDownWard();
//       },
//       child: FaIcon(controller.isListScrollToDown.value
//           ? FontAwesomeIcons.arrowUp
//           : FontAwesomeIcons.arrowDown));
// }


}