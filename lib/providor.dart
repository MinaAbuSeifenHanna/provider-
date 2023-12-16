

import 'package:flutter/material.dart';

import 'manger.dart';

class AppProvider with ChangeNotifier{

  int count = 0 ;

  DateTime time = DateTime.now() ;

  String img =  Manger.img1 ;

  // AssetsManager.img1 ;

   void changeImage()
  {
    img = (img == Manger.img1) ?   Manger.img2 :   Manger.img1 ;
    notifyListeners();
  }
   void incrementCount()
  {
   ++count ;
    notifyListeners();
  }
  void defaultCount ()
  {
    count = 0 ;
    notifyListeners();
  }

   void decrementCount()
  {
    --count ;
    notifyListeners();
  }
  void  changeDataTime()
   {
      time =  DateTime.now();
      notifyListeners();
   }


}