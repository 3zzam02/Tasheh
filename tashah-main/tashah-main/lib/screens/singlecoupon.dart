import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'myeventspage.dart';

class SingleCouponPage extends StatefulWidget {
  final String couponId;
  const SingleCouponPage({Key? key, required this.couponId});

  @override
  State<SingleCouponPage> createState() => _SingleEventPageState();
}

class _SingleEventPageState extends State<SingleCouponPage> {
  DocumentSnapshot? couponData; // Nullable DocumentSnapshot

  @override
  void initState() {
    super.initState();
    getSingleCoupon();
  }

  void getSingleCoupon() async {
    DocumentSnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('coupon')
        .doc(widget.couponId)
        .get();
    setState(() {
      couponData = querySnapshot;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Coupon Details',
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
              Color.fromARGB(255, 167, 101, 101),
              Color.fromARGB(255, 202, 202, 202)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: couponData != null
            ? SizedBox(
                height: 800,
                width: 415,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Card(
                          color: const Color.fromARGB(255, 102, 19, 19),
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              'assets/images/copoun.jpg',
                              cacheHeight: 300,
                              cacheWidth: 300,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Title : ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black)),
                        const SizedBox(
                          height: 3,
                        ),
                        Card(
                          color: const Color.fromARGB(167, 255, 95, 95),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              couponData!['title'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Price : ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black)),
                        const SizedBox(
                          height: 3,
                        ),
                        Card(
                          color: const Color.fromARGB(167, 255, 95, 95),
                          child: Container(
                            width: 50,
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                couponData!['price'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Location :',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black)),
                            Card(
                              color: const Color.fromARGB(167, 255, 95, 95),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                  child: Text(
                                    couponData!['location'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.warning,
                                  animType: AnimType.rightSlide,
                                  title: 'Warning',
                                  desc: 'Delete this Coupon ?',
                                  descTextStyle: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  titleTextStyle: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  btnCancelOnPress: () {
                                    print('cancel');
                                  },
                                  btnOkOnPress: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MyEventPage(),
                                      ),
                                    );
                                    await FirebaseFirestore.instance
                                        .collection('coupon')
                                        .doc(widget.couponId)
                                        .delete();
                                  },
                                ).show();
                              },
                              child: const Text('Remove',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black)),
                            ),
                            // const SizedBox(
                            //   width: 20,
                            // ),
                            // OutlinedButton(
                            //   onPressed: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => EditEvemtinfo(
                            //           couponId: widget.couponId,
                            //           oldtitle: couponData!['title'],
                            //           olddescription: couponData!['description'],
                            //           oldlocation: couponData!['location'],
                            //           oldmaxattendees:
                            //               couponData!['maxattendees'],
                            //         ),
                            //       ),
                            //     );
                            //   },
                            //   child: const Text('Edit',
                            //       style: TextStyle(
                            //           fontWeight: FontWeight.bold,
                            //           fontSize: 15,
                            //           color: Colors.black)),
                            // ),
                            // const SizedBox(
                            //   width: 20,
                            // ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
