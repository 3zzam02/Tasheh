import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasheh/screens/profile_screen.dart';
import '../reusable_widgets/couponform.dart';

const startallignment = Alignment.topLeft;
const endallignment = Alignment.bottomRight;

class Shop_Page extends StatelessWidget {
  const Shop_Page(this.startShop, {super.key});
  final void Function() startShop;

  @override
  Widget build(context) {
    Widget EventBox = SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(
      // FirebaseFirestore.instance.collection('posts').where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(),for own events
      stream: FirebaseFirestore.instance.collection('coupon').snapshots(),
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
                color: const Color.fromARGB(255, 102, 19, 19),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                child: Container(
                  padding:
                      const EdgeInsets.all(10),
                      width: 350,
                      height: 320,
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
                          height: 100,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
                      Text('price : ${data['price']}',
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
                        onPressed: startShop,
                        child: const Text('Get Coupon',style: TextStyle(color: Colors.white),),
                        
                      ),
                      const SizedBox(
                        height: 10,
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

    return EventBox;
  }
}
