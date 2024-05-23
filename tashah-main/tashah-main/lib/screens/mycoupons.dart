import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'singlecoupon.dart';

class MyCreatedCouponsPage extends StatefulWidget {
  const MyCreatedCouponsPage({super.key});

  @override
  State<MyCreatedCouponsPage> createState() => _MyCreatedCouponsPage();
}

class _MyCreatedCouponsPage extends State<MyCreatedCouponsPage> {
  @override
  Widget build(BuildContext context) {
    Widget EventBox = SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(
      // FirebaseFirestore.instance.collection('posts').where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(),for own events
      stream: FirebaseFirestore.instance
          .collection('coupon')
          .where("Userid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          padding: const EdgeInsets.only(bottom: 100),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return Column(children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Card(
                color: Color.fromARGB(255, 102, 19, 19),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: 350,
                  height: 350,
                  child: Column(
                    children: [
                      Card(
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/copoun.jpg',
                          cacheHeight: 150,
                          cacheWidth: 250,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(data['title'],
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('${data['price']}',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center),
                      const SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SingleCouponPage(
                              couponId: data['couponid'],
                            ),
                          ),
                        ),
                        child: const Text('View'),
                      ),
                    ],
                  ),
                ),
              ),

              // Add more widgets to display other data as needed
            ]);
          }).toList(),
        );
      },
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Coupons : ',
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
        child: EventBox,
      ),
    );
  }
}
