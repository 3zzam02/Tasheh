import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_editing_controller/number_editing_controller.dart';

class Edituserinfo extends StatefulWidget {
  const Edituserinfo(
      {super.key,
      required this.docid,
      required this.oldname,
      required this.address,
      required this.phonenumber});
  final String docid;
  final String oldname;
  final String address;
  final num phonenumber;

  @override
  State<StatefulWidget> createState() => _Edituserinfo();
}

class _Edituserinfo extends State<Edituserinfo> {
  bool isloading = true;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController address = TextEditingController();
  NumberEditingTextController phoneNumber =
      NumberEditingTextController.integer();
  NumberEditingTextController balance = NumberEditingTextController.integer();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  edituserinfo() async {
    String uid = FirebaseAuth.instance.currentUser?.uid ?? '';
    users.doc(uid).update({
      'full name': fullName.text,
      'address': address.text,
      'phone number': phoneNumber.number,
    });

    isloading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fullName.text = widget.oldname;
    address.text = widget.address;
    phoneNumber.number = widget.phonenumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit User Info',
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
              const Text(
                'Edit Full Name  :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
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
                  hintText: 'Full Name  :',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Edit Address :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
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
                  hintText: 'Address :',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Edit Phone Number :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
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
                  hintText: 'Phone Number :+962',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: edituserinfo,
                child: const Text(
                  'Edit',
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
