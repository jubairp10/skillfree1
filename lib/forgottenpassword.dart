import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class forgotpass extends StatefulWidget {
  @override
  State<forgotpass> createState() => _forgotpassState();
}

class _forgotpassState extends State<forgotpass> {
  var mail_controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    mail_controller.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: mail_controller.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Password reset link send ! check your email"),
            );
          });
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: const Text("Forget password" ,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                size: 25,
              )),
          elevation: 0,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Text(
                "Enter your email and we will send  you  password reset link",
                style: GoogleFonts.merriweather(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                controller: mail_controller,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.shade50,
                  hintText: " Enter your mail",
                  hintStyle: TextStyle(color: Colors.black),
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.black),
                  suffixIcon: Icon(Icons.email),
                  suffixIconColor: Colors.black,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: Colors.black), // Change this line
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child:
              ElevatedButton(onPressed: passwordReset,

                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text("Send")),
            )
          ],
        ));
  }
}