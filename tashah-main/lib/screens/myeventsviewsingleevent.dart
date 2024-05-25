import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasheh/utils/upload.dart';
import 'attendeeslistnames.dart';
import 'editeventpage.dart';

class SingleEventPage1 extends StatefulWidget {
  final String postId;
  const SingleEventPage1({Key? key, required this.postId});

  @override
  State<SingleEventPage1> createState() => _SingleEventPageState();
}

DocumentSnapshot? postData;
DocumentSnapshot postData1 = postData1;

class _SingleEventPageState extends State<SingleEventPage1> {
  // Nullable DocumentSnapshot

  // Future<void> addhostinfo() async {
  //   await FirebaseFirestore.instance
  //       .collection('posts')
  //       .doc(widget.postId)
  //       .update({
  //     'hostnumber': postData1['phone number'],
  //     'hostname': postData1['full name'],
  //   });
  //   // updateUsersBalance;
  //   setState(() {});

  //   // 'attendeeslistname': FieldValue.arrayUnion([userData!['full name']])
  // }

  Future<void> updateUsersBalance(List<String> userIds) async {
    // Initialize Firestore instance

    // Fetch the event points from Firestore (assuming there's a single document storing event points)
    num eventPoints = postData!['eventpoints'];

    // Batch write to perform multiple updates in a single request

    for (String userId in postData!['attendeeslistid']) {
      DocumentSnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      setState(() {
        postData1 = querySnapshot;
      });

      // Reference to the user document

      num currentbalance = postData1['balance'];
      currentbalance += eventPoints;
      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({'balance': currentbalance});
      {
        setState(() {});
      }

      // Update the balance field in Firestore
    }
  }

  @override
  void initState() {
    super.initState();
    getSingleEvent();
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

  finishevent() async {
    bool finsihed = true;
    showSnackBar('Event Finished', context);
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(widget.postId)
        .update({'isfinished': finsihed});
    List<String> List1 =
        List<String>.from(postData!['attendeeslistid'] as List);
    updateUsersBalance(List1);
    // updateUsersBalance;
    setState(() {});
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
                        Text(
                            'Is this event finished ? : ${postData!['isfinished']}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color.fromARGB(255, 0, 0, 0))),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Hosted By : ${postData!['hostname']}',
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Contact : 0${postData!['hostnumber']} (WhatsApp)',
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center),
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
                                  desc: 'Delete this Event ?',
                                  descTextStyle: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  titleTextStyle: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  btnCancelOnPress: () {
                                    print('cancel');
                                  },
                                  btnOkOnPress: () async {
                                    await FirebaseFirestore.instance
                                        .collection('posts')
                                        .doc(widget.postId)
                                        .delete();
                                    Navigator.of(context)
                                        .pop('SingleEventPage1');
                                  },
                                ).show();
                              },
                              child: const Text('Remove',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditEvemtinfo(
                                      postId: widget.postId,
                                      oldtitle: postData!['title'],
                                      olddescription: postData!['description'],
                                      oldlocation: postData!['location'],
                                      oldmaxattendees:
                                          postData!['maxattendees'],
                                      oldhostnumer: postData!['hostnumber'],
                                    ),
                                  ),
                                );
                              },
                              child: const Text('Edit',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            OutlinedButton(
                              onPressed: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.warning,
                                  animType: AnimType.rightSlide,
                                  title: 'Warning',
                                  desc: 'Finish Event ?',
                                  descTextStyle: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  titleTextStyle: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  btnCancelOnPress: () {
                                    print('cancel');
                                  },
                                  btnOkOnPress: () async {
                                    await finishevent();
                                    Navigator.of(context)
                                        .pop('SingleEventPage1');
                                  },
                                ).show();
                              },
                              child: const Text('Finish',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        OutlinedButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Attendeesnameslist(
                                postId: postData!['postId'],
                              ),
                            ),
                          ),
                          child: const Text('View Attendees List',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black)),
                        ),
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
