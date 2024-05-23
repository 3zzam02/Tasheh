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
  num? hostnumber;

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
    this.hostnumber,
  });

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "title": title,
        "description": description,
        "datePublished": datePublished,
        'time': datetime.toString(),
        "location": location,
        "postUrl": postUrl,
        'attendeeslistid': [],
        'attendeeslistnames': [],
        'maxattendees': maxattendees,
        'currentnumber': 0,
        'isfinished': false,
        'eventpoints': 0,
        'Userid': Userid,
        'hostname': 'hidden',
        'sponsorid': 'null',
        'sponsorname': 'Not Sponsored',
        'hostnubmer': hostnumber,
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
