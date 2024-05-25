import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class Attendeesnameslist extends StatefulWidget {
  final String postId;
  const Attendeesnameslist({super.key, required this.postId});

  @override
  State<Attendeesnameslist> createState() => _Attendeesnameslist();
}

DocumentSnapshot postData = postData;
DocumentSnapshot postData1 = postData1;

class _Attendeesnameslist extends State<Attendeesnameslist> {
  bool isloading = true;
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
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> list1 =
        List<String>.from(postData['attendeeslistnames'] as List);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Attendees List',
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
        child: isloading == false
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
                            child: Text('$list1',
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center),
                          ),
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
