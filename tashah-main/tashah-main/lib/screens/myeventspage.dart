import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'attendingevents.dart';
import 'mycreatedevents.dart';

class MyEventPage extends StatefulWidget {
  const MyEventPage({super.key});

  @override
  State<MyEventPage> createState() => _MyEventPage();
}

class _MyEventPage extends State<MyEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Events : ',
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
              Color.fromARGB(255, 202, 202, 202)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 150, bottom: 350),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Card(
                  color: const Color.fromARGB(255, 102, 19, 19),
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.event_available_outlined,
                        size: 150,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MyAttendedEventPage()));
                          },
                          child: const Text('Attending Events'))
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Card(
                  color: const Color.fromARGB(255, 102, 19, 19),
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.table_view,
                        size: 150,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MyCreatedEventPage()));
                          },
                          child: const Text('Created Events'))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
