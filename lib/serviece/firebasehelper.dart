

import 'package:firebase_auth/firebase_auth.dart';


import 'package:flutter/material.dart';

import 'package:skillfree/serviece/showSnackbar.dart';
import 'package:skillfree/user/bottomNavigation.dart';

import '../login.dart';


class Firebaseauth_method {
  final FirebaseAuth _auth;

  Firebaseauth_method(this._auth,);


  User get user => _auth.currentUser!; //

  //State persistence
  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();



  //Email Signup
  Future<void> Signupemail({
    required String email,
    required String password,
    required String name,
    required BuildContext
    context, //use to display like a snack bar items & Firestore (provider)
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password);

      await _auth.currentUser!.updateProfile(displayName: name);

      // await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }



//Email login
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (_auth.currentUser!.emailVerified) {
        // User is verified, navigate to the home page
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    bottomnavigation())); // Replace '/home' with your actual home page route
      }
      // else {
      //   // User not verified, send an email verification
      //   await sendEmailVerification(context);
      // }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

// //Email verify
//   Future<void> sendEmailVerification(BuildContext context) async {
//     try {
//       _auth.currentUser!.sendEmailVerification();
//       showSnackBar(context, 'Email verification sent!');
//     } on FirebaseAuthException catch (e) {
//       showSnackBar(context, e.message!); // Display error message
//     }
//   }

  // Sign out
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => login()));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  // Delete account
  Future<void> deleteAccount(BuildContext context) async {
    try {
      await _auth.currentUser!.delete();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => login()));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
      // Displaying the error message
      // if an error of requires-recent-login is thrown, make sure to log
      // in user again and then delete account.
    }
  }
}




// class FireBaseHelper{
//   final FirebaseAuth auth=FirebaseAuth.instance;
//   get user => auth.currentUser;
//   Future<String?>registerUser({required String email,required String password})async{
//     try {
//       await auth.createUserWithEmailAndPassword(
//         email:email,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//     //try{
//     //  await auth.createUserWithEmailAndPassword(
//     //         email:email,
//     //         password: password,
//     //       );
//     //       return null;}on FireAuthExeception catch(e){
//     //       retun e.message;
//     //       return e.message}
//   }
//   //signin user
//   Future<String?>loginUser({
//     required String email,required String password
//   })async{
//     try{
//       await auth.signInWithEmailAndPassword(email: email, password: password);
//       return null;
//     }on FirebaseAuthException catch(e){
//       if(e.code=='user not found'){
//         print("no user found that email");
//       }else if(e.code=='wrong password'){
//         print("wrong password provided for that user");
//       }
//       return e.message;
//     }
//   }
//   //sign out
//   Future<void>logout()async{
//     await auth.signOut();
//   }
// }



// class FirebaseAuthServieces{
//   FirebaseAuth _auth=FirebaseAuth.instance;
//   Future<User?> signUpWithEmailAndPassword(String email,String password)async{
//     try{
//       UserCredential credential=await _auth.createUserWithEmailAndPassword(email: email, password: password);
//       return credential.user;
//     }catch(e){
//       print('Some error occurd');
//     }
//     return  null;
//   }
//   Future<User?> signInWithEmailAndPassword(String email,String password)async{
//     try{
//       UserCredential credential=await _auth.signInWithEmailAndPassword(email: email, password: password);
//       return credential.user;
//     }catch(e){
//       print('Some error occurd');
//     }
//     return  null;
//   }
//
//
//
// }