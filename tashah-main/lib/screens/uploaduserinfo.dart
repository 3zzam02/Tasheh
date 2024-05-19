import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_editing_controller/number_editing_controller.dart';
import 'package:tasheh/screens/NavBar.dart';

class Uploaduserinfo extends StatefulWidget {
  const Uploaduserinfo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Uploaduserinfo();
  }
}

class _Uploaduserinfo extends State<Uploaduserinfo> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController address = TextEditingController();
  NumberEditingTextController phoneNumber =
      NumberEditingTextController.integer();
  NumberEditingTextController balance = NumberEditingTextController.integer();

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  adduserinfo() async {
    String uid = FirebaseAuth.instance.currentUser?.uid ?? '';
    users.doc(uid).set({
      'Email': FirebaseAuth.instance.currentUser!.email,
      'Userid': FirebaseAuth.instance.currentUser!.uid,
      'full name': fullName.text,
      'address': address.text,
      'phone number': phoneNumber.number,
      'balance': balance.number = 0,
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) => NavBar()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add User Info',
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
              Color.fromARGB(255, 202, 202, 202),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: fullName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Your Full Name  : (required)',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: address,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Your Address : (required)',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: phoneNumber,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Your Phone Number :+962 (required)',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: adduserinfo,
                child: const Text(
                  'Add User Info',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
