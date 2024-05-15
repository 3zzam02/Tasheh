import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventsBox extends StatefulWidget {
  EventsBox({super.key});

  @override
  State<StatefulWidget> createState() {
    return _EventsBox();
  }
}

class _EventsBox extends State<EventsBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 50,
      ),
      width: double.maxFinite,
      child: const Column(
        children: [
          Icon(
            Icons.image,
            size: 100,
          ),
          Text(
            'Event Title : ',
          ),
          Text(
            "Event Date : ",
          ),
          Text(
            'Event Description : ',
          ),
        ],
      ),
    );
  }
}
