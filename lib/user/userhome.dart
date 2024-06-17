import 'package:animated_float_action_button/animated_floating_action_button.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skillfree/postwork.dart';
import 'package:skillfree/user/Viewfeddbacks.dart';
import 'package:skillfree/user/comingsoon.dart';
import 'package:skillfree/user/electritianview.dart';
import 'package:skillfree/user/feedback.dart';
import 'package:skillfree/user/paintersview.dart';
import 'package:skillfree/user/plubersview.dart';


import '../forgottenpassword.dart';
import '../login.dart';
import '../serviece/firebasehelper.dart';
import '../worker/notification.dart';
import 'category.dart';
import 'complaints.dart';
// void main(){
//   runApp( MaterialApp(
//         useInheritedMediaQuery: true,
//         debugShowCheckedModeBanner: false,
//         home: uhome(),
//       ));
// }
class uhome extends StatefulWidget{


  @override
  State<uhome> createState() => _uhomeState();
}

class _uhomeState extends State<uhome> {
  // static const List<String> sampleImages = [
  //   'https://img.freepik.com/free-photo/lovely-woman-vintage-outfit-expressing-interest-outdoor-shot-glamorous-happy-girl-sunglasses_197531-11312.jpg?w=1800&t=st=1673886721~exp=1673887321~hmac=57318aa37912a81d9c6e8f98d4e94fb97a766bf6161af66488f4d890f88a3109',
  //   'https://img.freepik.com/free-photo/attractive-curly-woman-purple-cashmere-sweater-fuchsia-sunglasses-poses-isolated-wall_197531-24158.jpg?w=1800&t=st=1673886680~exp=1673887280~hmac=258c92922874ad41d856e7fdba03ce349556cf619de4074143cec958b5b4cf05',
  //   'https://img.freepik.com/free-photo/stylish-blonde-woman-beret-beautiful-french-girl-jacket-standing-red-wall_197531-14428.jpg?w=1800&t=st=1673886821~exp=1673887421~hmac=5e77d3fab088b29a3b19a9023289fa95c1dc2af15565f290886bab4642fa2621',
  //   'https://img.freepik.com/free-photo/pretty-young-girl-with-pale-skin-dark-hair-french-beret-sunglasses-polka-dot-skirt-white-top-red-shirt-walking-around-sunny-city-laughing_197531-24480.jpg?w=1800&t=st=1673886800~exp=1673887400~hmac=9a1c61de63180118c5497ce105bbb36bfbb53050111de466d5110108848f2128',
  //   'https://img.freepik.com/free-photo/elegant-woman-brown-coat-spring-city_1157-33434.jpg?w=1800&t=st=1673886830~exp=1673887430~hmac=cc8c28a9332e008db251bdf9c7b838b7aa5077ec7663773087a8cc56d11138ff',
  //   'https://img.freepik.com/free-photo/high-fashion-look-glamor-closeup-portrait-beautiful-sexy-stylish-blond-young-woman-model-with-bright-yellow-makeup-with-perfect-clean-skin-with-gold-jewelery-black-cloth_158538-2003.jpg?w=826&t=st=1673886857~exp=1673887457~hmac=3ba51578e6a1e9c58e95a6b72e492cbbc26abf8e2f116a0672113770d3f4edbe',
  // ];
  var name=['Jasir P','Anas K','Rahul M','Jacob N','Ansil','Irfan kk'];
  var work=['Painter','Electretian','Plumber','Painter','Electretian','Plumber'];
  var image=['assets/image/8048.jpg','assets/image/5759.jpg','assets/image/plumber-with-thumb-up.jpg','assets/image/woman-repairer-with-painting-roller-isolated.jpg'];

  get fabKey => null;
  @override
  Widget build(BuildContext context) {
    final user=context.read<Firebaseauth_method>().user;
   return Scaffold(backgroundColor: Theme.of(context).colorScheme.background,
     // backgroundColor: Colors.purple[50],
     appBar: AppBar(backgroundColor: Colors.transparent,
       leading: Image(image: AssetImage('assets/icon/app.jpg'),),
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
                                            Text(
                                              "Name : ${user.displayName!}",
                                              style: TextStyle(
                                                fontSize: 23,
                                              ),
                                            ),
                                            Text(
                                              "Email : ${user.email!}",

                                              style: TextStyle(
                                                 fontSize: 15,fontWeight: FontWeight.w600
                                              ),
                                            )
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
                                ListTile(
                                  onTap: () {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) => forgotpass()));
                                  },
                                  title: Text(
                                    'Change Password',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  leading: Icon(Icons.lock),
                                ),
                                ListTile(
                                  onTap: () {
                                    FirebaseAuth.instance.signOut();
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
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

                                    context.read<Firebaseauth_method>().deleteAccount(context);

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
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>uhome()));
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
         SizedBox(height: 10,),
         Padding(
           padding: const EdgeInsets.only(left: 10),
           child: Text('Hello!!',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 25),),
         ),
         Text(
           '${user.displayName!}'
           ,style: GoogleFonts.aboreto(fontWeight: FontWeight.w800,fontSize: 40),),
         SizedBox(height: 15,),
         Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(10),boxShadow: [
           BoxShadow(blurRadius: 5,color: Colors.black)
         ],color: Colors.grey[200],
         ),margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
           padding: EdgeInsets.all(5),
           child: TextField(decoration: InputDecoration(labelText: 'Search',
               suffixIcon: Icon(Icons.search_outlined),border: InputBorder.none),),height: 50,),

         SizedBox(height: 40,),
         Row(
           children: [
             Padding(
               padding: const EdgeInsets.only(left: 10,right: 100),
               child: Text('Category',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
             ),
             SizedBox(width: 50,),
             Padding(
               padding: const EdgeInsets.only(right: 5,left: 80),
               child: Icon(Icons.category),
             ),
           ],
         ),

         Container(
           child: SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Row(
               children: [
                 InkWell(onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>paintersview()));
                 },
                     child: category(txt: 'Painters', icons: Icon(Icons.brush), num: '350+', num1: 'views',img:'assets/image/painter.jpg',)),
                 SizedBox(width: 10,),
                 InkWell(onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>electritianview()));
                 },
                     child: category(txt: 'Electrietion', icons: Icon(Icons.electrical_services), num: '400+', num1: 'views', img: 'assets/image/electrition.jpg',)),
                 SizedBox(width: 10,),
                 InkWell(onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>plumbersview()));
                 },
                     child: category(txt: 'Plumber', icons: Icon(Icons.plumbing), num: '40+', num1: 'views', img: 'assets/image/plumber.jpg',)),
                 SizedBox(width: 10,),
                 InkWell(onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>comingsoon()));
                 },
                     child: category(txt: 'More', icons: Icon(Icons.more), num: '', num1: '', img: 'assets/image/worker.jpeg',))
               ],
             ),
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
         ClipRRect(borderRadius: BorderRadius.circular(30),
           child: Container(color: Colors.greenAccent,
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
         SizedBox(height: 15,),
         Row(
           children: [
             Padding(
               padding: const EdgeInsets.only(left: 10,right: 10),
               child: Text('Top Workers',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
             ),
             SizedBox(width: 90,),
             Padding(
               padding: const EdgeInsets.only(right: 5,left: 80),
               child: FaIcon(FontAwesomeIcons.rankingStar),
             ),
           ],
         ),

         Container(height:
           500,
           child:ListView.builder(itemCount: name.length,itemBuilder: (context,index){
             return  ExpansionTile(leading: Image(image: AssetImage('assets/icon/man_4140037.png'),),title:Text('${name[index]}',style: TextStyle(fontWeight: FontWeight.bold),),subtitle: Text('${work[index]}'),
                 trailing:
                 // Image(image: AssetImage('assets/icon/rating.png'),)
                 Wrap(
                   children: [
                 Icon(Icons.star, color: Colors.yellowAccent,size: 20.0,),
                 Icon(Icons.star, color: Colors.yellowAccent,size: 20.0,),Icon(Icons.star, color: Colors.yellowAccent,size: 20.0,),Icon(Icons.star, color: Colors.yellowAccent,size: 20.0,),
                 Icon(Icons.star_border, color: Colors.grey,size: 20.0,),
               ],),
             );
           }),
         )

       ],
     ),
     floatingActionButton:  AnimatedFloatingActionButton(
         key: fabKey,
         fabButtons: <Widget>[

           newchat(),
           newgroup(),
           newchannel(),
           newsecretchat()

         ],
         colorStartAnimation: Colors.blue,
         colorEndAnimation: Colors.red,
         animatedIconData: AnimatedIcons.home_menu //To principal button
     ),


   );
  }
  newchannel() {
    return FloatActionButtonText(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewFeddback()));
      },
      icon: Icons.view_kanban_rounded,
      textLeft: -160,
      text: "View Feedbacks",
    );
  }
  newchat() {
    return FloatActionButtonText(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>feedback()));
      },
      icon: Icons.feed_rounded,
      text: "Feedback",
      textLeft: -120,
    );

  }

  newgroup() {
    return FloatActionButtonText(
      onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>complaints()));
      },
      icon:Icons.edit,
      textLeft: -130,
      text: "Complaints",
    );
  }



  newsecretchat() {
    return FloatActionButtonText(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>postwork()));
      },
      icon: Icons.work,
      textLeft: -120,
      text: "Work Post",
    );
  }
}
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:skillfreeflutter/user/extention.dart';
// import 'package:skillfreeflutter/user/textstyle.dart';
// import 'package:skillfreeflutter/user/theme.dart';
//
//
//
// import 'package:skillfreeflutter/user/user_model.dart';
//
// import 'data.dart';
// import 'liightcolor.dart';
//
// void main(){
//   runApp(MaterialApp(home: HomePageScreen(key:),));
// }
// class HomePageScreen extends StatefulWidget {
//   HomePageScreen({
//      required Key key,
//   }) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePageScreen> {
//   late List<DoctorModel> doctorDataList;
//   @override
//   void initState() {
//     doctorDataList = doctorMapList.map((x) => DoctorModel.fromJson(x)).toList();
//     super.initState();
//   }
//
//   Widget _appBar() {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: Theme.of(context).backgroundColor,
//       leading: Icon(
//         Icons.short_text,
//         size: 30,
//         color: Colors.black,
//       ),
//       actions: <Widget>[
//         Icon(
//           Icons.notifications_none,
//           size: 30,
//           color: LightColor.grey,
//         ),
//         ClipRRect(
//           borderRadius: BorderRadius.all(Radius.circular(13)),
//           child: Container(
//             // height: 40,
//             // width: 40,
//             decoration: BoxDecoration(
//               color: Theme.of(context).backgroundColor,
//             ),
//             child: Image.asset("assets/user.png", fit: BoxFit.fill),
//           ),
//         ).p(8),
//       ],
//     );
//   }
//
//   Widget _header() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           "Hello,",
//           style: TextStyles.title.subTitleColor,
//         ),
//         Text("Peter Parker", style: TextStyles.h1Style),
//       ],
//     ).p16;
//   }
//
//   Widget _searchField() {
//     return Container(
//       height: 55,
//       margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(13)),
//         boxShadow: <BoxShadow>[
//           BoxShadow(
//             color: LightColor.grey.withOpacity(.3),
//             blurRadius: 15,
//             offset: Offset(5, 5),
//           )
//         ],
//       ),
//       child: TextField(
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//           border: InputBorder.none,
//           hintText: "Search",
//           hintStyle: TextStyles.body.subTitleColor,
//           suffixIcon: SizedBox(
//             width: 50,
//             child:
//             Icon(Icons.search, color: LightColor.purple).alignCenter.ripple(
//                   () {},
//               borderRadius: BorderRadius.circular(13),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _category() {
//     return Column(
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 4),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text("Category", style: TextStyles.title.bold),
//               Text(
//                 "See All",
//                 style: TextStyles.titleNormal
//                     .copyWith(color: Theme.of(context).primaryColor),
//               ).p(8).ripple(() {})
//             ],
//           ),
//         ),
//         SizedBox(
//           height: AppTheme.fullHeight(context) * .28,
//           width: AppTheme.fullWidth(context),
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             children: <Widget>[
//               _categoryCardWidget(
//                 "Chemist & Drugist",
//                 "350 + Stores",
//                 color: LightColor.green,
//                 lightColor: LightColor.lightGreen,
//               ),
//               _categoryCardWidget(
//                 "Covid - 19 Specilist",
//                 "899 Doctors",
//                 color: LightColor.skyBlue,
//                 lightColor: LightColor.lightBlue,
//               ),
//               _categoryCardWidget(
//                 "Cardiologists Specilist",
//                 "500 + Doctors",
//                 color: LightColor.orange,
//                 lightColor: LightColor.lightOrange,
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _categoryCardWidget(
//       String title,
//       String subtitle, {
//         required Color color,
//         required Color lightColor,
//       }) {
//     TextStyle titleStyle = TextStyles.title.bold.white;
//     TextStyle subtitleStyle = TextStyles.body.bold.white;
//     if (AppTheme.fullWidth(context) < 392) {
//       titleStyle = TextStyles.body.bold.white;
//       subtitleStyle = TextStyles.bodySm.bold.white;
//     }
//     return AspectRatio(
//       aspectRatio: 6 / 8,
//       child: Container(
//         height: 280,
//         width: AppTheme.fullWidth(context) * .3,
//         margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.all(Radius.circular(20)),
//           boxShadow: <BoxShadow>[
//             BoxShadow(
//               offset: Offset(4, 4),
//               blurRadius: 10,
//               color: lightColor.withOpacity(.8),
//             )
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.all(Radius.circular(20)),
//           child: Container(
//             child: Stack(
//               children: <Widget>[
//                 Positioned(
//                   top: -20,
//                   left: -20,
//                   child: CircleAvatar(
//                     backgroundColor: lightColor,
//                     radius: 60,
//                   ),
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: <Widget>[
//                     Flexible(
//                       child: Text(title, style: titleStyle).hP8,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Flexible(
//                       child: Text(
//                         subtitle,
//                         style: subtitleStyle,
//                       ).hP8,
//                     ),
//                   ],
//                 ).p16
//               ],
//             ),
//           ),
//         ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
//       ),
//     );
//   }
//
//   Widget _doctorsList() {
//     return SliverList(
//       delegate: SliverChildListDelegate(
//         [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text("Top Doctors", style: TextStyles.title.bold),
//               IconButton(
//                   icon: Icon(
//                     Icons.sort,
//                     color: Theme.of(context).primaryColor,
//                   ),
//                   onPressed: () {})
//               // .p(12).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
//             ],
//           ).hP16,
//           getdoctorWidgetList()
//         ],
//       ),
//     );
//   }
//
//   Widget getdoctorWidgetList() {
//     return Column(
//         children: doctorDataList.map((x) {
//           return _doctorTile(x);
//         }).toList());
//   }
//
//   Widget _doctorTile(DoctorModel model) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(20)),
//         boxShadow: <BoxShadow>[
//           BoxShadow(
//             offset: Offset(4, 4),
//             blurRadius: 10,
//             color: LightColor.grey.withOpacity(.2),
//           ),
//           BoxShadow(
//             offset: Offset(-3, 0),
//             blurRadius: 15,
//             color: LightColor.grey.withOpacity(.1),
//           )
//         ],
//       ),
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
//         child: ListTile(
//           contentPadding: EdgeInsets.all(0),
//           leading: ClipRRect(
//             borderRadius: BorderRadius.all(Radius.circular(13)),
//             child: Container(
//               height: 55,
//               width: 55,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: randomColor(),
//               ),
//               child: Image.asset(
//                 model.image,
//                 height: 50,
//                 width: 50,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//           title: Text(model.name, style: TextStyles.title.bold),
//           subtitle: Text(
//             model.type,
//             style: TextStyles.bodySm.subTitleColor.bold,
//           ),
//           trailing: Icon(
//             Icons.keyboard_arrow_right,
//             size: 30,
//             color: Theme.of(context).primaryColor,
//           ),
//         ),
//       ).ripple(
//             () {
//           Navigator.pushNamed(context, "/DetailPage", arguments: model);
//         },
//         borderRadius: BorderRadius.all(Radius.circular(20)),
//       ),
//     );
//   }
//
//   Color randomColor() {
//     var random = Random();
//     final colorList = [
//       Theme.of(context).primaryColor,
//       LightColor.orange,
//       LightColor.green,
//       LightColor.grey,
//       LightColor.lightOrange,
//       LightColor.skyBlue,
//       LightColor.titleTextColor,
//       Colors.red,
//       Colors.brown,
//       LightColor.purpleExtraLight,
//       LightColor.skyBlue,
//     ];
//     var color = colorList[random.nextInt(colorList.length)];
//     return color;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _appBar(),
//       backgroundColor: Theme.of(context).backgroundColor,
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverList(
//             delegate: SliverChildListDelegate(
//               [
//                 _header(),
//                 _searchField(),
//                 _category(),
//               ],
//             ),
//           ),
//           _doctorsList()
//         ],
//       ),
//     );
//   }
// }
