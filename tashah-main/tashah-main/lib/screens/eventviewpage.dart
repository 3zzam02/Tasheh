import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventView extends StatefulWidget {
  const EventView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _EventView();
  }
}

class _EventView extends State<EventView> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    Widget EventBox = SingleChildScrollView(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 20, mainAxisExtent: 50),
                  children: [
                    const Padding(padding: EdgeInsets.all(30)),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Card(
                            color: Color.fromARGB(255, 102, 19, 19),
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: 350,
                              height: 350,
                              child: Image.network(
                                data['postUrl'],
                                cacheHeight: 150,
                                cacheWidth: 150,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(data['title']),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(data['time']),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(data['location']),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              'Current Number of Attendees : ${data['currentnumber']}',
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
                              'Max Number of Attendees : ${data['maxattendees']}'),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Sponsored By : ${data['sponsorname']}',
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
                            onPressed: () {},
                            child: const Text('View'),
                          )
                        ],
                      ),
                    )
                  ]
                  // Add more widgets to display other data as needed
                  );
            }).toList(),
          );
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Events : ',
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
        child: EventBox,
      ),
    );
  }
}
