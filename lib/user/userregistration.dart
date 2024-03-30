import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillfree/user/bottomNavigation.dart';
import 'package:skillfree/user/userhome.dart';

import '../login.dart';
import '../serviece/firebasehelper.dart';

class uregistration extends StatefulWidget{
  uregistration({super.key});
  @override
  State<uregistration> createState() => _uregistrationState();
}

class _uregistrationState extends State<uregistration> {
  // final FirebaseAuthServieces _auth=FirebaseAuthServieces();
  TextEditingController _usernamecontroller=TextEditingController();
  TextEditingController _emailcontroller=TextEditingController();
  TextEditingController _passwordcontroller=TextEditingController();
  GlobalKey<FormState>key = GlobalKey();
  bool showpass = true;
  String? email;
  String? password;
  String? name;

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }
  // void _signUp() async {
  //   String username=_usernamecontroller.text;
  //   String email=_emailcontroller.text;
  //   String password=_passwordcontroller.text;
  //
  //
  //   User? user=await _auth.signUpWithEmailAndPassword(email, password);
  //   if(user!= null){
  //     print('user is Successfully created');
  //     Navigator.push(context, MaterialPageRoute(builder: (context)=>uhome()));
  //   }else{
  //     print('Some Error Happened');
  //   }

  void signUpUser() async {
    print("Signing up user...");
    try {
      await context.read<Firebaseauth_method>().Signupemail(
        email: _emailcontroller.text,
        password: _passwordcontroller.text,
        name: _usernamecontroller.text,
        context: context,
      );

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => bottomnavigation()));
      print("Sign up successful!");
    } catch (e) {
      print("Error during sign up: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body:  SingleChildScrollView(
       child: Column(
           children: [
       const Padding(
       padding: EdgeInsets.only(top: 100.0),
       child: Text(
         "Sign up",
         style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
       ),
   ),
    const Padding(
    padding: EdgeInsets.all(16.0),
    child: Text(
    "create an Account,Its free",
    style: TextStyle(color: Colors.grey),
    ),
    ),
             Padding(
               padding: const EdgeInsets.all(25.0),
               child: TextFormField(controller: _usernamecontroller,
               onSaved: (ename){
                 name=ename;},
                 textInputAction: TextInputAction.next,
                 decoration: const InputDecoration(
                     prefixIcon: Icon(Icons.person),
                     labelText: "Name",
                     hintText: 'name',
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(5)))),
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(25.0),
               child: TextFormField(
                 // controller: _mobailecontroller,
                 // onSaved: (nmob){
                 //   mob=nmob;},
                 textInputAction: TextInputAction.next,
                 decoration: const InputDecoration(
                     prefixIcon: Icon(Icons.phone),
                     labelText: "Mobile",
                     hintText: 'Mobile',
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(5)))),
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(25.0),
               child: TextFormField(
                 controller: _emailcontroller,
                 onSaved: (pwd){
                   password=pwd;
                 },
                 validator: (username) {
                   if (username!.isEmpty ||
                       !username.contains("@") ||
                       !username.contains(".")) {
                     return "enter valid mail";
                   }
                   else {
                     return null;
                   }
                 },

                 decoration: const InputDecoration(
                     prefixIcon: Icon(Icons.email),
                     labelText: "Email",
                     hintText: "Email",
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(5)))),
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(25.0),
               child: TextFormField(
                 validator: (pass1) {
                   if (pass1!.isEmpty || pass1.length < 6) {
                     return "Password must should be greater than 6";
                   } else {
                     return null;
                   }
                 },

                 controller: _passwordcontroller,
                 obscureText: showpass,
                 obscuringCharacter: '*',
                 decoration: const InputDecoration(
                     prefixIcon: Icon(Icons.lock),
                     labelText: "Password",
                     hintText: "Password",
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(5)))),
               ),
             ),

             ElevatedButton(
                 style: ButtonStyle(
                     minimumSize:
                     MaterialStateProperty.all(const Size(330, 50)),
                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                         RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(30.0),
                         ))),
                 onPressed: signUpUser

                 ,child: const Text(
                   "Sign Up",
                   style: TextStyle(color: Colors.black),
                 )),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 const Text("Alredy have an account?"),
                 TextButton(
                     onPressed: () {
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) => login()));
                     },
                     child: const Text(
                       "Login!!",
                       style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                           color: Colors.black),
                     )),
               ],
             )
    ]
   ),
     )
    );
  }
}