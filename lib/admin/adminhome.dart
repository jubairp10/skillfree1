import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skillfree/WandAlogin.dart';
import 'package:skillfree/admin/addworker.dart';
import 'package:skillfree/worker/activity.dart';
import 'package:skillfree/worker/notification.dart';
void main (){
  runApp(MaterialApp(home: admin(),));
}
class admin extends StatelessWidget{
  var image=['assets/image/8048.jpg','assets/image/5759.jpg','assets/image/plumber-with-thumb-up.jpg','assets/image/woman-repairer-with-painting-roller-isolated.jpg'];
  var color=[Colors.lime,Colors.grey,Colors.brown];
  var iconname=['View requests','Feedback','View Postworks'];
  var icon=[Icons.request_page,Icons.feedback,Icons.grid_view_rounded];
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.indigo[50],
        appBar: AppBar(backgroundColor: Colors.transparent,
            leading: Image(image: AssetImage('assets/icon/app.jpg'),),
            title: Text('Admin'),
            actions: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>notification()));
              },color: Colors.black, icon:FaIcon(FontAwesomeIcons.bell,color: Colors.black,)),
              InkWell(onTap: (){
                showDialog(context: context, builder: (context){
                  return Container(height: 200,
                    child: AlertDialog(
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.asset(
                                    'assets/icon/person.png',
                                    // Adjust the path to your actual image
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Admin'
                                        // "Name : ${user.displayName!}"
                                        ,
                                        style: TextStyle(fontWeight: FontWeight.bold,
                                          fontSize: 23,
                                        ),
                                      ),
                                      // Text(
                                      //   "Email : ${user.email!}",
                                      //
                                      //   style: TextStyle(
                                      //      // fontSize: 15,fontWeight: FontWeight.w600
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey[400],
                            indent: 16,
                            endIndent: 16,
                          ),
                          SizedBox(height: 10),
                          ListTile(
                            title: Text(
                              'Account',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // ListTile(
                          //   onTap: () {
                          //     Navigator.pushReplacement(context,
                          //         MaterialPageRoute(builder: (context) => forgotpass()));
                          //   },
                          //   title: Text(
                          //     'Change Password',
                          //     style: TextStyle(
                          //       fontSize: 20,
                          //     ),
                          //   ),
                          //   leading: Icon(Icons.lock),
                          // ),
                          ListTile(
                            onTap: () {
                              // FirebaseAuth.instance.signOut();
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>walogin()));
                            },
                            title: Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                            leading: Icon(Icons.logout, color: Colors.red),
                          ),
                          ListTile(
                            onTap: () {

                              // context.read<Firebaseauth_method>().deleteAccount(context);

                            },
                            title: Text(
                              'Delete your Account',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                            leading: Icon(Icons.logout, color: Colors.red),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text('Back'))
                      ],
                    ),
                  );
                });
              },
                  child: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/icon/person.png'),fit: BoxFit.fitWidth),borderRadius: BorderRadius.circular(5),color: Colors.orangeAccent),height: 30,width: 30,margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),)),
              // PopupMenuButton(itemBuilder: (context){
              //   return[
              //     PopupMenuItem(child: TextButton(onPressed: () {  },child: Text('Logout'),))
              //   ];
              // })
            ]),
        body:ListView(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(30),
              child: Container(color: Colors.green[300],
                child:SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      FanCarouselImageSlider(
                        sliderHeight: 500,
                        sliderWidth: double.infinity,
                        imagesLink: image,
                        isAssets: true,
                        autoPlay: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(mainAxisSize: MainAxisSize.min,
                children: [
                  Activity(icn: Icon(Icons.person), txt: 'Users Profile', clr: Colors.green, tap: (){}),
                  SizedBox(width: 20,),
                  Activity(icn: Icon(Icons.add), txt: 'Add Workers', clr: Colors.red, tap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>addworkers()));
                  }),
                  SizedBox(width: 20,),
                  Activity(icn:Icon (Icons.account_circle_outlined), txt: 'Complaints', clr: Colors.green, tap: (){}),
                  SizedBox(width: 20,),
                  Activity(icn:Icon (Icons.edit_note), txt: 'Feedback', clr: Colors.green, tap: (){}),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(mainAxisSize: MainAxisSize.min,
                children: [

                  Activity(icn: Icon(Icons.feedback), txt: 'More', clr: Colors.yellowAccent, tap: (){})
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),shape: BoxShape.rectangle,color: Colors.redAccent,
                // image: DecorationImage(image: AssetImage('Albert_Schweitzer.png',),fit: BoxFit.cover,)
              ),
                height: 120,

                child: Stack(
                  children: [
                    Positioned(top: 20,left: 5,
                        child: Text("The best way to predict the future is to create it.\n -Peter Drucker" ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.left,)),
                    Positioned(bottom: 0,right: 5,
                        child: Image(image: AssetImage('assets/icon/drucker.png'),height: 80,width: 80,))

                  ],
                ),
              ),
            ),
          ],
        )
    );
  }

}
