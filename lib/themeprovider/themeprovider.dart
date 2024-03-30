
import 'package:flutter/material.dart';

import 'darktheme.dart';
import 'lighttheme.dart';



class Themeprovider with  ChangeNotifier{
  ThemeData _themeData = lightTheme;
  ThemeData get themedata => _themeData;

  set themedata(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }
  void toogletheme(){
    if (_themeData == lightTheme){
      themedata = darkTheme;
    }else{
      themedata = lightTheme;
    }
  }
}