import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_editing_controller/number_editing_controller.dart';

class EditEvemtinfo extends StatefulWidget {
  final String postId;

  const EditEvemtinfo({
    super.key,
    required this.postId,
    required this.oldtitle,
    required this.olddescription,
    required this.oldlocation,
    required this.oldmaxattendees,
  });

  final String oldtitle;
  final String olddescription;
  final String oldlocation;
  final num oldmaxattendees;

  @override
  State<StatefulWidget> createState() => _EditEventinfo();
}

DocumentSnapshot? postData1;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

class _EditEventinfo extends State<EditEvemtinfo> {
  bool isloading = true;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController location = TextEditingController();
  NumberEditingTextController maxattendees =
      NumberEditingTextController.integer();

  CollectionReference posts = FirebaseFirestore.instance.collection('posts');
  void getUserInf() async {
    DocumentSnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      postData1 = querySnapshot;
    });
  }

  Future<void> addhostinfo(
      String collection, String docId, String listField) async {
    try {
      // Get the current user
      User? currentUser = _auth.currentUser;

      if (currentUser != null) {
        String userId = FirebaseAuth.instance.currentUser!.uid;

        DocumentReference docRef =
            _firestore.collection('posts').doc(widget.postId);

        // Add the userId to the list field
        await docRef.update({
          'hostnubmer': postData1!['phone number'],
          'hostname': postData1!['full name'],

          // 'attendeeslistname': FieldValue.arrayUnion([userData!['full name']])
        });

        print("Added UserId: $userId to list");
      } else {
        print("No user is signed in. or event is already Sponsored");
      }
    } catch (e) {
      print("Error adding UserId to list: $e");
    }
  }

  edituserinfo() async {
    addhostinfo('posts', widget.postId, FirebaseAuth.instance.currentUser!.uid);
    posts.doc(widget.postId).update({
      'title': title.text,
      'description': description.text,
      'location': location.text,
      'maxattendees': maxattendees.number,
    });

    isloading = false;
    setState(() {});
    Navigator.of(context).pop('SingleEventPage1');
  }

  @override
  void initState() {
    super.initState();
    title.text = widget.oldtitle;
    description.text = widget.olddescription;
    location.text = widget.oldlocation;
    maxattendees.number = widget.oldmaxattendees;
    getUserInf;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Event Info',
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
                'Edit Event Title :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: title,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Event Title  :',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Edit Event description :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: description,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Event description  :',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Edit Location :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: location,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Location :',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Edit Max Number of Attendees :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: maxattendees,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Max Number of Attendees',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: edituserinfo,
                child: const Text(
                  'Save',
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
