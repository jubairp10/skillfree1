import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillfree/admin/adminhome.dart';
import 'package:skillfree/worker/workerbottomNavigation.dart';

class walogin extends StatefulWidget{
  @override
  State<walogin> createState() => _waloginState();
}

class _waloginState extends State<walogin> {
  GlobalKey<FormState> key = GlobalKey();
  bool showpass = true;
  TextEditingController _emailcontroller=TextEditingController();
  TextEditingController _passwordcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[400],
      body: Form(key: key,
        child: ListView(
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
                  ), onPressed: () {
            final valid = key.currentState!.validate();

            if (valid) {
            logincheck(_emailcontroller.text, _passwordcontroller.text);
            } else {ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            action:
            SnackBarAction(label: 'UNDO', onPressed: () {}),
            content: const Text('Invalid username / password')));}
            }, child:Text('Login')),
            ),


            Image(image: AssetImage('assets/icon/loginimg.png'),)
          ],
        ),
      ),
    );
  }

  void logincheck(String email, String password)  {
    if (email == 'admin@gmail.com' && password == '123456') {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => admin()));

    } else if(email=='worker@gmail.com'&&password=='654123') {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => workerbottomnavigation()));
    }else
    {
        print('Login faild');
      }
    }
}