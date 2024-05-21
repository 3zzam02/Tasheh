import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mycoupons.dart';
import 'uploadcoupon.dart';

class CouponsPage extends StatefulWidget {
  const CouponsPage({super.key});

  @override
  State<CouponsPage> createState() => _CouponsPage();
}

class _CouponsPage extends State<CouponsPage> {
  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.only(top: 150, bottom: 350),
          child: Row(
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
                      const Icon(
                        Icons.event_available_outlined,
                        size: 150,
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
                      const Icon(
                        Icons.table_view,
                        size: 150,
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
                                        const MyCreatedCouponsPage()));
                          },
                          child: const Text('My Coupons'))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
