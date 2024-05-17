import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
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

List<QueryDocumentSnapshot> data = [];

class _ShopState extends State<Shop> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  int activescreen = 1;
  int i = data.length;
  num currentbalance = 0;
  num coupon1 = 500;
  num coupon2 = 700;

  bool isloading = true;

  getUserInfo() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where("Userid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    data.addAll(querySnapshot.docs);
    isloading = false;
    setState(() {});
  }

  @override
  void initState() {
    getUserInfo();
  }

  // variables for purchase proccesss , should be replaced with instances from data base

  void donth1() {
    setState(() {
      activescreen = 1;
    });
  }

  void _updateEventStatus(num balance) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(data[i]['Userid'])
        .update({'balance': balance});
  }

  void switchScreen() {
    setState(() {
      currentbalance = data[i]['balance'];
      if (currentbalance - coupon1 >= 0) {
        currentbalance -= coupon1;
        _updateEventStatus(currentbalance-coupon1);

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
    }
    if (activescreen == 3) {
      screenwidget = PurchaseFailed(donth1);
    }

    // Conditions for purchasing copouns

    return isloading == true
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : MaterialApp(
            home: Scaffold(
            appBar: AppBar(
              title: Text('Current Balance : ${data[i]['balance']}',
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
                    Color.fromARGB(255, 155, 155, 155),
                    Color.fromARGB(255, 202, 202, 202)
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
