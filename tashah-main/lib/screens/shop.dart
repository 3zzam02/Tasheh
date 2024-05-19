// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
List<QueryDocumentSnapshot> data1 = [];

class _ShopState extends State<Shop> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  int activescreen = 1;
  int i = 0;
  num currentbalance = 0;
  num couponprice = 0;

  bool isloading = true;

  getCouponInfo() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('coupon').get();
    data1.addAll(querySnapshot.docs);
    setState(() {
      isloading = false;
    });
  }

  getUserInfo() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where("Userid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    data.addAll(querySnapshot.docs);
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
    getCouponInfo();
    _getBalanceStream().listen((balance) {
      setState(() {
        currentbalance = balance;
      });
    });
  }

  void donth1() {
    setState(() {
      activescreen = 1;
    });
  }

  Stream<int> _getBalanceStream() {
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .map((snapshot) => snapshot.data()?['balance'] ?? 0);
  }

  void _updateEventStatus(num balance) {
    String uid = FirebaseAuth.instance.currentUser?.uid ?? '';
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'balance': balance}).then((_) {
      setState(() {
        currentbalance = balance;
      });
    });
  }

  void switchScreen(int couponIndex, num couponPrice) {
    // Update balance in Firestore

    // Update local balance

    // Check if balance is sufficient
    if (currentbalance >= couponPrice) {
      // Proceed to success screen
      setState(() {
        _updateEventStatus(currentbalance - couponPrice);
        Shop_Page((int couponIndex, num couponPrice) {
          switchScreen(couponIndex, couponPrice);
        });

        activescreen = 2;
      });
    } else {
      // Insufficient balance, show failure screen
      setState(() {
        activescreen = 3;
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenwidget = Shop_Page((int couponIndex, num couponPrice) {
      switchScreen(couponIndex, couponPrice);
    });

    if (activescreen == 2) {
      screenwidget = PurchaseSuccess(donth1);
    } else if (activescreen == 3) {
      screenwidget = PurchaseFailed(donth1);
    }

    return isloading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : MaterialApp(
            home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: StreamBuilder<int>(
                stream: _getBalanceStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  final balance = snapshot.data;
                  return Text(
                    'Balance: $balance',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  );
                },
              ),
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
