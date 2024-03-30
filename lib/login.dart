import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillfree/serviece/firebasehelper.dart';
import 'package:skillfree/user/bottomNavigation.dart';
import 'package:skillfree/user/userhome.dart';
import 'package:skillfree/user/userregistration.dart';
import 'forgottenpassword.dart';

class login extends StatefulWidget{
  login({super.key});
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  GlobalKey<FormState> key = GlobalKey();
  bool showpass = true;

  // final FirebaseAuthServieces _auth=FirebaseAuthServieces();
  TextEditingController _emailcontroller=TextEditingController();
  TextEditingController _passwordcontroller=TextEditingController();
  @override
  void dispose() {
    _passwordcontroller.dispose();
    _emailcontroller.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.lightGreen[400],
     body: ListView(
       children: [
         Row(crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text('Let\'s\nGet Started!',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w800,fontSize: 40)),
           ],
         ),
         // Center(
         //     child: Padding(
         //       padding: EdgeInsets.only(top: 20.0),
         //       child: Text(
         //         "Login Page",
         //         style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
         //       ),
         //     )),
         SizedBox(height: 60,),
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: TextFormField(

             controller: _emailcontroller,
             decoration: InputDecoration(prefixIconColor: Colors.black,
                 prefixIcon: const Icon(Icons.drive_file_rename_outline),
                 labelText: "Email",


                 border: OutlineInputBorder(

                   borderRadius: BorderRadius.circular(20),

                 )
             ),
             validator: (text) {
               if (text!.isEmpty ||
                   !text.contains('@') ||
                   !text.contains(".")) {
                 return "Enter valid Email!!!";
               }else{
                 return null;
               }
             },

           ),
         ),
         Padding(
             padding: const EdgeInsets.all(20),
             child: TextFormField(
               controller: _passwordcontroller,
               obscureText: showpass,
               obscuringCharacter: "*",
               decoration: InputDecoration(
                   prefixIconColor: Colors.black,

                 prefixIcon: const Icon(Icons.lock),
                 // suffixIcon: IconButton(
                 //   onPressed: () {
                 //     setState(() {
                 //       if (hidepass)
                 //         hidepass = false;
                 //       else
                 //         hidepass = true;
                 //     });
                 //   },
                 //   icon: Icon(
                 //       hidepass ? Icons.visibility : Icons.visibility_off),
                 // ),
                 labelText: "Password",
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(20),
                 ),
               ),
             )),
         Padding(
           padding: const EdgeInsets.all(60),
           child: MaterialButton(color: Colors.pink,
               textColor: Colors.white,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(20.0),
               ),onPressed: Loginuser, child:Text('Login')),
         ),
         TextButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>forgotpass()));
         }, child:Text("Forget password",style: TextStyle(color: Colors.white),)),

         TextButton(
             onPressed: () {
               Navigator.push(context,
                   MaterialPageRoute(builder: (context) => uregistration()));
             },
             child: const Text('Not a User? Register Here!!!')),

         Image(image: AssetImage('assets/icon/loginimg.png'),)
       ],
     ),
   );
  }
  // void _signIn() async {
  //
  //   String email = _emailcontroller.text;
  //   String password = _passwordcontroller.text;
  //
  //
  //   User? user = await _auth.signInWithEmailAndPassword(email, password);
  //   if (user != null) {
  //     print('user is Successfully SignedIn');
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => bottomnavigation()));
  //   } else {
  //     print('Some Error Happened');
  //   }
  // }
  void Loginuser() {
    Firebaseauth_method(FirebaseAuth.instance).loginWithEmail(
        email: _emailcontroller.text,
        password: _passwordcontroller.text,
        context: context);
  }
}