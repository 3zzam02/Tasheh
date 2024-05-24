import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleEventPagesponsor extends StatefulWidget {
  final String postId;
  const SingleEventPagesponsor({Key? key, required this.postId});

  @override
  State<SingleEventPagesponsor> createState() => _SingleEventPagesponsorState();
}

class _SingleEventPagesponsorState extends State<SingleEventPagesponsor> {
  DocumentSnapshot? postData;
  DocumentSnapshot? postData1; // Nullable DocumentSnapshot
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // DocumentSnapshot? userData;
  // void getUserInfp() async {
  //   DocumentSnapshot querySnapshot1 = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();
  //   setState(() {
  //     userData = querySnapshot1;
  //   });
  // }
  void getUserInf() async {
    DocumentSnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      postData1 = querySnapshot;
    });
  }

  Future<void> addsponsor(
      String collection, String docId, String listField) async {
    try {
      // Get the current user
      User? currentUser = _auth.currentUser;

      if (currentUser != null && postData!['sponsorid'] == 'null') {
        String userId = FirebaseAuth.instance.currentUser!.uid;

        DocumentReference docRef =
            _firestore.collection('posts').doc(widget.postId);

        // Add the userId to the list field
        await docRef.update({
          'sponsorid': userId,
          'sponsorname': postData1!['labelname'],

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

  @override
  void initState() {
    super.initState();
    getSingleEvent();
    getUserInf();
  }

  void getSingleEvent() async {
    DocumentSnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('posts')
        .doc(widget.postId)
        .get();
    setState(() {
      postData = querySnapshot;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Event Details',
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
        child: postData != null
            ? Container(
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
                            child: Image.network(
                              postData!['postUrl'],
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
                              postData!['title'],
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
                        const Text('Description : ',
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
                            width: 250,
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                postData!['description'],
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
                                    postData!['location'],
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
                        Text('Date : ${postData!['time']}',
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            'Current Number of Attendees : ${postData!['currentnumber']}',
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            'Max Number of Attendees : ${postData!['maxattendees']}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color.fromARGB(255, 0, 0, 0))),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Sponsored By : ${postData!['sponsorname']}',
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center),
                        const SizedBox(
                          height: 10,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            addsponsor('posts', widget.postId,
                                FirebaseAuth.instance.currentUser!.uid);
                          },
                          child: const Text('Become Sposnor',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black)),
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
