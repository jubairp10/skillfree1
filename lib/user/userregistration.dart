// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:skillfree/user/bottomNavigation.dart';
// import 'package:skillfree/user/userhome.dart';
//
// import '../login.dart';
// import '../serviece/firebasehelper.dart';
//
// class uregistration extends StatefulWidget{
//   uregistration({super.key});
//   @override
//   State<uregistration> createState() => _uregistrationState();
// }
//
// class _uregistrationState extends State<uregistration> {
//   // final FirebaseAuthServieces _auth=FirebaseAuthServieces();
//   TextEditingController _usernamecontroller=TextEditingController();
//   TextEditingController _emailcontroller=TextEditingController();
//   TextEditingController _passwordcontroller=TextEditingController();
//   GlobalKey<FormState>key = GlobalKey();
//   bool showpass = true;
//   String? email;
//   String? password;
//   String? name;
//
//   @override
//   void dispose() {
//     super.dispose();
//     _emailcontroller.dispose();
//     _passwordcontroller.dispose();
//   }
//   // void _signUp() async {
//   //   String username=_usernamecontroller.text;
//   //   String email=_emailcontroller.text;
//   //   String password=_passwordcontroller.text;
//   //
//   //
//   //   User? user=await _auth.signUpWithEmailAndPassword(email, password);
//   //   if(user!= null){
//   //     print('user is Successfully created');
//   //     Navigator.push(context, MaterialPageRoute(builder: (context)=>uhome()));
//   //   }else{
//   //     print('Some Error Happened');
//   //   }
//
//   void signUpUser() async {
//     print("Signing up user...");
//     try {
//       await context.read<Firebaseauth_method>().Signupemail(
//         email: _emailcontroller.text,
//         password: _passwordcontroller.text,
//         name: _usernamecontroller.text,
//         context: context,
//       );
//
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => bottomnavigation()));
//       print("Sign up successful!");
//     } catch (e) {
//       print("Error during sign up: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//      body:  SingleChildScrollView(
//        child: Column(
//            children: [
//        const Padding(
//        padding: EdgeInsets.only(top: 100.0),
//        child: Text(
//          "Sign up",
//          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//        ),
//    ),
//     const Padding(
//     padding: EdgeInsets.all(16.0),
//     child: Text(
//     "create an Account,Its free",
//     style: TextStyle(color: Colors.grey),
//     ),
//     ),
//              Padding(
//                padding: const EdgeInsets.all(25.0),
//                child: TextFormField(controller: _usernamecontroller,
//                onSaved: (ename){
//                  name=ename;},
//                  textInputAction: TextInputAction.next,
//                  decoration: const InputDecoration(
//                      prefixIcon: Icon(Icons.person),
//                      labelText: "Name",
//                      hintText: 'name',
//                      border: OutlineInputBorder(
//                          borderRadius: BorderRadius.all(Radius.circular(5)))),
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.all(25.0),
//                child: TextFormField(
//                  // controller: _mobailecontroller,
//                  // onSaved: (nmob){
//                  //   mob=nmob;},
//                  textInputAction: TextInputAction.next,
//                  decoration: const InputDecoration(
//                      prefixIcon: Icon(Icons.phone),
//                      labelText: "Mobile",
//                      hintText: 'Mobile',
//                      border: OutlineInputBorder(
//                          borderRadius: BorderRadius.all(Radius.circular(5)))),
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.all(25.0),
//                child: TextFormField(
//                  controller: _emailcontroller,
//                  onSaved: (pwd){
//                    password=pwd;
//                  },
//                  validator: (username) {
//                    if (username!.isEmpty ||
//                        !username.contains("@") ||
//                        !username.contains(".")) {
//                      return "enter valid mail";
//                    }
//                    else {
//                      return null;
//                    }
//                  },
//
//                  decoration: const InputDecoration(
//                      prefixIcon: Icon(Icons.email),
//                      labelText: "Email",
//                      hintText: "Email",
//                      border: OutlineInputBorder(
//                          borderRadius: BorderRadius.all(Radius.circular(5)))),
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.all(25.0),
//                child: TextFormField(
//                  validator: (pass1) {
//                    if (pass1!.isEmpty || pass1.length < 6) {
//                      return "Password must should be greater than 6";
//                    } else {
//                      return null;
//                    }
//                  },
//
//                  controller: _passwordcontroller,
//                  obscureText: showpass,
//                  obscuringCharacter: '*',
//                  decoration: const InputDecoration(
//                      prefixIcon: Icon(Icons.lock),
//                      labelText: "Password",
//                      hintText: "Password",
//                      border: OutlineInputBorder(
//                          borderRadius: BorderRadius.all(Radius.circular(5)))),
//                ),
//              ),
//
//              ElevatedButton(
//                  style: ButtonStyle(
//                      minimumSize:
//                      MaterialStateProperty.all(const Size(330, 50)),
//                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                          RoundedRectangleBorder(
//                            borderRadius: BorderRadius.circular(30.0),
//                          ))),
//                  onPressed: signUpUser
//
//                  ,child: const Text(
//                    "Sign Up",
//                    style: TextStyle(color: Colors.black),
//                  )),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: [
//                  const Text("Alredy have an account?"),
//                  TextButton(
//                      onPressed: () {
//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => login()));
//                      },
//                      child: const Text(
//                        "Login!!",
//                        style: TextStyle(
//                            fontSize: 20,
//                            fontWeight: FontWeight.bold,
//                            color: Colors.black),
//                      )),
//                ],
//              )
//     ]
//    ),
//      )
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skillfree/user/bottomNavigation.dart';

import '../serviece/firebasehelper.dart';

class Regi extends StatefulWidget {
  @override
  State<Regi> createState() => _RegiState();
}

class _RegiState extends State<Regi> {
  String? name1;
  String? email;
  String? password;
  bool showpass = true;
  var formkey = GlobalKey<FormState>();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  bool _isEmailValid(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.user != null) {
        Get.to(bottomnavigation());
      }
    } catch (e) {
      showSnackbar("Error signing in with Google: $e");
    }
  }

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.black87, size: 25.sp),
        ),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          children: [
            SizedBox(height: 40.h),
            Center(
              child: Text(
                "Hello Again!",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30.sp),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              textAlign: TextAlign.center,
              "Welcome Back You’ve\nbeen Missed!",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 40.h),
            RPadding(
              padding: const EdgeInsets.only(right: 26, left: 26),
              child: Container(
                height: 67.h,
                width: 377.w,
                child: TextFormField(
                  controller: namecontroller,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: "Enter name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  validator: (name) {
                    if (name!.isEmpty) {
                      return "Enter your name";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (ename) {
                    name1 = ename;
                  },
                ),
              ),
            ),
            SizedBox(height: 20.h),
            RPadding(
              padding: const EdgeInsets.only(right: 26, left: 26),
              child: Container(
                height: 67.h,
                width: 377.w,
                child: TextFormField(
                  controller: emailcontroller,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: "Enter email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!_isEmailValid(value)) {
                      return 'The email address is badly formatted';
                    }
                    return null;
                  },
                  onSaved: (eemail) {
                    email = eemail;
                  },
                ),
              ),
            ),
            SizedBox(height: 20.h),
            RPadding(
              padding: const EdgeInsets.only(right: 26, left: 26),
              child: Container(
                height: 67.h,
                width: 377.w,
                child: TextFormField(
                  controller: passwordcontroller,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: " Enter password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  validator: (password) {
                    if (password!.isEmpty || password.length < 8) {
                      return "Password must be at least 8 characters";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (epass) {
                    password = epass;
                  },
                ),
              ),
            ),
            SizedBox(height: 30.h),
            RPadding(
              padding: const EdgeInsets.only(right: 25, left: 25),
              child: InkWell(
                onTap: () async {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    bool userExists = await context.read<Firebaseauth_method>().checkIfUserExists(email!);
                    if (!userExists) {
                      await context.read<Firebaseauth_method>().signUp(name: name1!, email: email!, password: password!, context: context).then((value) {
                        if (value == null) {
                          Get.to(bottomnavigation());
                        } else {
                          Get.snackbar("Error", "User not found \nUser already exists with this email");
                        }
                      });
                    } else {
                      showSnackbar("User already exists with this email");
                    }
                  }
                },
                child: Container(
                  height: 50.h,
                  margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 20.sp)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 7.w),
                InkWell(
                  onTap: signInWithGoogle,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    height: 40.h,
                    decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Image(image: AssetImage("assets/image/google-logo-9808.png")),
                        Text("   Google   ", style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 25.w,),
                Container(
                  padding: EdgeInsets.all(5),
                  height: 40.h,
                  decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image(image: AssetImage("assets/image/pngwing.com.png")),
                      Text("   Apple  ", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            Text(" "),
          ],

        ),
      ),
    );
  }
}

