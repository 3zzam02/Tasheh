import 'package:flutter/material.dart';

class Post {
  String? description;
  String? postId;
  DateTime? datePublished;
  DateTimeRange? datetime;
  String? postUrl;
  String? title;
  String? location;
  List<String>? attendeeslist = [];
  String? Userid;
  num? maxattendees;
  num? currentnumber;
  bool? isfinished;

  Post({
    this.description,
    this.postId,
    this.datePublished,
    this.datetime,
    this.postUrl,
    this.title,
    this.location,
    this.attendeeslist,
    this.maxattendees,
    this.currentnumber,
    this.isfinished,
    this.Userid,
  });

  Map<String, dynamic> toJson() => {
        "description": description,
        "postId": postId,
        "datePublished": datePublished,
        'time': datetime,
        "postUrl": postUrl,
        "title": title,
        "location": location,
        'attendeeslist': attendeeslist,
        'maxattendees': maxattendees,
        'currentnumber': 0,
        'isfinished': false,
        'Userid': Userid,
      };
  Post.fromJson(Map<String, dynamic> Json) {
    postId = Json['postId'];
    description = Json['description'];
    postUrl = Json['postUrl'];
    datePublished = Json['datePublished'];
    title = Json['title'];
    location = Json['location'];
    attendeeslist = Json['attendeeslist'];
    maxattendees = Json['maxattendees'];
    currentnumber = Json['currentnumber'];
    Userid = Json['Userid'];
  }
}
