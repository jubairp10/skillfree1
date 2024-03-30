
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:skillfree/firstscreen.dart';
import 'package:skillfree/serviece/firebasehelper.dart';
import 'package:skillfree/themeprovider/themeprovider.dart';
import 'package:skillfree/user/bottomNavigation.dart';
import 'package:skillfree/user/userhome.dart';
import 'IntroductionScreen.dart';
import 'login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDE2l-XxgAHUCTYjYtKeN2HsEKjHbBGBxE",
          appId:  "1:490847392658:android:3e7ee23acf12738ecde74b",
          messagingSenderId: '',
          projectId: "skillfree-be80e",
      storageBucket: 'skillfree-be80e.appspot.com')
  );
  runApp(
      MultiProvider(providers:[
        ChangeNotifierProvider(
            create: (context) => Themeprovider()),
        Provider<Firebaseauth_method>(create: (_)=>Firebaseauth_method( FirebaseAuth.instance)),
        StreamProvider(create: (context)=> context.read<Firebaseauth_method>().authState, initialData: null),



      ],
        child: myapp(),
      ));

}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: Provider.of<Themeprovider>(context).themedata,
        home:splash()
    );
  }
}
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final Firebaseuser= context.watch<User?>();

    if (Firebaseuser != null){
      return bottomnavigation();
    }
    return login();
  }
}