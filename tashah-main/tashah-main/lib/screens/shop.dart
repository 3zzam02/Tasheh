import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasheh/screens/Shop_Home.dart';
import 'package:tasheh/screens/purchasefailed.dart';
import 'package:tasheh/screens/purchasesuccess.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() {
    return _ShopState();
  }
}

class _ShopState extends State<Shop> {
  int activescreen = 1;

  // variables for purchase proccesss , should be replaced with instances from data base

  int currentbalance = 2000;
  int coupon1 = 500;
  int coupon2 = 700;
  void donth1() {
    setState(() {
      activescreen = 1;
    });
  }

  getcurrentbalance() {
    return currentbalance;
  }

  void switchScreen() {
    setState(() {
      if (currentbalance - coupon1 >= 0) {
        currentbalance -= coupon1;
        activescreen = 2;
      } else if (currentbalance - coupon1 < 0) {
        activescreen = 3;
      }
    });
  }

  @override
  Widget build(context) {
    Widget screenwidget = Shop_Page(switchScreen);

    if (activescreen == 2) {
      screenwidget = PurchaseSuccess(donth1);
      activescreen = 1;
    }
    if (activescreen == 3) {
      screenwidget = PurchaseFailed(donth1);
      activescreen = 1;
    }

    // Conditions for purchasing copouns

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Current Balance : $currentbalance',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 226, 205, 255),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: const Color.fromARGB(255, 80, 0, 0),
      ),
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
    ));
  }
}
