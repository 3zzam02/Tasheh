import 'package:flutter/material.dart';
import 'Shop_Home.dart';
import 'purchasefailed.dart';
import 'purchasesuccess.dart';

class Purchase extends StatefulWidget {
  const Purchase({super.key});
  
  @override
  State<Purchase> createState() => _Purchase ();
}

class _Purchase extends State<Purchase> {
  int activescreen = 1;
  void donth() {}
  void switchScreen1() {
    setState(() {
      activescreen = 2;
    });
  }

  @override
  Widget build(context) {
    Widget? screenwidget;
    if (screenwidget == PurchaseSuccess(switchScreen1)) {
      screenwidget = Shop_Page((p0, p1) {
        
      },);
    }
    if (activescreen == 2) {
      screenwidget = Shop_Page((p0, p1) {
        
      },);
    }
    if (screenwidget == PurchaseFailed(switchScreen1)) {
      screenwidget = Shop_Page((p0, p1) {
        
      },);
    }

    

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 141, 23, 14),
                Color.fromARGB(255, 223, 161, 153)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenwidget,
        ),
      ),
    );
  }
}
