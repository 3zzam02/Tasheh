import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Post {
  String? description;
  String? postId;
  DateTime? datePublished;
  DateTime? datetime;
  String? postUrl;
  String? title;
  String? location;
  List<String>? attendeeslistid;
  List<String>? attendeeslistnames;
  String? Userid;
  String? hostname;
  num? maxattendees;
  num? currentnumber;
  bool? isfinished;
  num? eventpoints;
  String? sponsorid;
  String? sponsorname;

  Post({
    this.description,
    this.postId,
    this.datePublished,
    this.datetime,
    this.postUrl,
    this.title,
    this.location,
    this.attendeeslistid,
    this.attendeeslistnames,
    this.maxattendees,
    this.currentnumber,
    this.isfinished,
    this.eventpoints,
    this.Userid,
    this.hostname,
    this.sponsorid,
    this.sponsorname,
  });

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "title": title,
        "description": description,
        "datePublished": datePublished,
        'time': datetime,
        "location": location,
        "postUrl": postUrl,
        'attendeeslistid': [],
        'attendeeslistnames': [],
        'maxattendees': maxattendees,
        'currentnumber': 0,
        'isfinished': false,
        'eventpoints': 0,
        'Userid': Userid,
        'hostname': hostname,
        'sponsorid': 'null',
        'sponsorname': 'Not Sponsored',
      };
  Post.fromJson(Map<String, dynamic> Json) {
    postId = Json['postId'];
    description = Json['description'];
    postUrl = Json['postUrl'];
    datePublished = Json['datePublished'];
    title = Json['title'];
    location = Json['location'];
    attendeeslistid = Json['attendeeslistid'];
    attendeeslistnames = Json['attendeeslistnames'];
    maxattendees = Json['maxattendees'];
    currentnumber = Json['currentnumber'];
    Userid = Json['Userid'];
  }
}
