import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mycoupons.dart';
import 'sponsoredevents.dart';
import 'sponsoreventsviewpage.dart';
import 'uploadcoupon.dart';

class CouponsPage extends StatefulWidget {
  const CouponsPage({super.key});

  @override
  State<CouponsPage> createState() => _CouponsPage();
}

DocumentSnapshot postData1 = postData1;

class _CouponsPage extends State<CouponsPage> {
  void getUserInf() async {
    DocumentSnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      postData1 = querySnapshot;
    });
  }

  @override
  void initState() {
    super.initState();

    getUserInf();
  }

  @override
  Widget build(BuildContext context) {
    if (postData1['labelname'] == 'null') {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Coupons :',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 226, 205, 255),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 80, 0, 0),
        ),
        body: Container(
          alignment: Alignment.topCenter,
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
          child: const Padding(
              padding: EdgeInsets.only(top: 150, bottom: 350),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text('contact us at :',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                  SizedBox(
                    height: 20,
                  ),
                  Text('tashehproject@gmail.com',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  SizedBox(
                    height: 20,
                  ),
                  Text('To become a Sponsor ! ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ],
              )),
        ),
      );
      // 'attendeeslistname': FieldValue.arrayUnion([userData!['full name']])
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Coupons :',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 226, 205, 255),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 80, 0, 0),
        ),
        body: Container(
          alignment: Alignment.center,
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
          child: Padding(
            padding: const EdgeInsets.only(
              top: 100,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Card(
                        color: const Color.fromARGB(255, 102, 19, 19),
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Icon(Icons.event_available_outlined,
                                size: 150,
                                color: Color.fromARGB(255, 124, 124, 124)),
                            const SizedBox(
                              height: 20,
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MysponsoredEventPage()));
                                },
                                child: const Text('Sponsored Events'))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Card(
                        color: const Color.fromARGB(255, 102, 19, 19),
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.add_business_outlined,
                              size: 150,
                              color: Color.fromARGB(255, 124, 124, 124),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SponsorEventPage()));
                                },
                                child: const Text('Sponsor Events'))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Card(
                        color: const Color.fromARGB(255, 102, 19, 19),
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Icon(Icons.event_available_outlined,
                                size: 150,
                                color: Color.fromARGB(255, 124, 124, 124)),
                            const SizedBox(
                              height: 20,
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const UploadCoupon()));
                                },
                                child: const Text('Add Coupon'))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Card(
                        color: const Color.fromARGB(255, 102, 19, 19),
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Icon(Icons.table_view,
                                size: 150,
                                color: Color.fromARGB(255, 124, 124, 124)),
                            const SizedBox(
                              height: 20,
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MyCreatedCouponsPage()));
                                },
                                child: const Text('My Coupons'))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
