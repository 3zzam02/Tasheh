import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_editing_controller/number_editing_controller.dart';
import 'package:tasheh/screens/firebaseeventslist.dart';

class Uploaduserinfo extends StatefulWidget {
  const Uploaduserinfo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Uploaduserinfo();
  }
}

class _Uploaduserinfo extends State<Uploaduserinfo> {
  TextEditingController fullName = TextEditingController();
  TextEditingController address = TextEditingController();
  NumberEditingTextController phoneNumber =
      NumberEditingTextController.integer();
  NumberEditingTextController balance = NumberEditingTextController.integer();

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> adduserinfo() {
    return users
        .add({
          'full name': fullName.text,
          'address': address.text,
          'phone number': phoneNumber.number,
          'balance': balance.number = 0,
        })
        .then((value) => print('user added'))
        .catchError((error) => print('Failed to add User'));
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
              Color.fromARGB(255, 141, 23, 14),
              Color.fromARGB(255, 223, 161, 153)
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
                  hintText: 'Your Full Name  :',
                ),
              ),
              const SizedBox(
                height: 10,
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
                  hintText: 'Your Address :',
                ),
              ),
              const SizedBox(
                height: 10,
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
                  hintText: 'Your Phone Number :+962',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton(
                onPressed: adduserinfo,
                child: const Text('Add User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
