

import 'package:firebase_auth/firebase_auth.dart';


import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:skillfree/serviece/showSnackbar.dart';
import 'package:skillfree/user/bottomNavigation.dart';

import '../login.dart';


class Firebaseauth_method {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Firebaseauth_method(this._auth,);


  User get user => _auth.currentUser!; //

  //State persistence
  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();


  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }





  // Register
  // Future<User?> register(String email, String password, String name) async {
  //   try {
  //     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     User? user = userCredential.user;
  //     if (user != null) {
  //       await user.updateDisplayName(name);
  //       await user.reload();
  //       return _auth.currentUser;
  //     }
  //   }
  //   on FirebaseAuthException catch (e) {
  //     if (e.code == 'email-already-in-use') {
  //       Get.snackbar('Error', 'The account already exists for that email.');
  //     } else if (e.code == 'invalid-email') {
  //       Get.snackbar('Error', 'The email address is badly formatted.');
  //     } else if (e.code == 'weak-password') {
  //       Get.snackbar('Error', 'The password provided is too weak.');
  //     } else {
  //       Get.snackbar('Error', e.message ?? 'An unknown error occurred.');
  //     }
  //   }
  //   catch (e) {
  //     Get.snackbar('Error', 'An unknown error occurred.');
  //   }
  //   return null;
  // }
  final FirebaseAuth auth = FirebaseAuth.instance;

  // get user => auth.currentUser;
  //  Future<String?>signUp(  {required String name,required String email, required String pasword,required BuildContext context,}) async {
  //    try {
  //      await auth.createUserWithEmailAndPassword(
  //          email: email, password: pasword);
  //      await _auth.currentUser!.updateProfile(displayName: name);
  //      return null;
  //    } on FirebaseAuthException
  //    catch (e) {
  // Get.snackbar(
  //      'Error',e.message!);
  //    }
  //
  //  }

  Future<String?> signUp({required String name, required String email, required String password, required BuildContext context}) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      await user?.updateDisplayName(name);
      return null;
    } catch (e) {
      print("Error during sign up: $e");
      return e.toString();
    }
  }

//already exist
  Future<bool> checkIfUserExists(String email) async {
    try {
      final signInMethods = await _auth.fetchSignInMethodsForEmail(email);
      return signInMethods.isNotEmpty;
    } catch (e) {
      print("Error checking user existence: $e");
      return false;
    }
  }

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