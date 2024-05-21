// ignore_for_file: must_call_super

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasheh/screens/editprofilescreen.dart';

class profile_screen extends StatefulWidget {
  const profile_screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreen();
  }
}

List<QueryDocumentSnapshot> data = [];

class _ProfileScreen extends State<profile_screen> {
  int i = data.length;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile : ',
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 226, 205, 255),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 0, 0),
      ),
      body: isloading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
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
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const CircleAvatar(
                        radius: 70,
                        backgroundImage:
                            AssetImage('assets/images/prof_img.jpg'),
                      ),
                      const SizedBox(height: 20),
                      itemProfile('Name : ', '${data[i]['full name']}',
                          CupertinoIcons.person),
                      const SizedBox(height: 10),
                      itemProfile('Phone : ', '0${data[i]['phone number']}',
                          CupertinoIcons.phone),
                      const SizedBox(height: 10),
                      itemProfile('Address : ', '${data[i]['address']}',
                          CupertinoIcons.location),
                      const SizedBox(height: 10),
                      itemProfile('Email: ', '${data[i]['Email']}',
                          CupertinoIcons.mail),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 155, 75, 69),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Edituserinfo(
                                docid: data[i]['Userid'],
                                oldname: data[i]['full name'],
                                address: data[i]['address'],
                                phonenumber: data[i]['phone number'],
                              ),
                            ));
                          },
                          child: const Text(
                            'Edit Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 5),
            color: Color.fromRGBO(72, 6, 7, 0.8),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}
