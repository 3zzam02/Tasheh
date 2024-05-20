class Post {
  String? description;
  String? postId;
  DateTime? datePublished;
  DateTime? datetime;
  String? postUrl;
  String? title;
  String? location;
  List<String>? attendeeslist;
  String? Userid;
  num? maxattendees;
  num? currentnumber;
  bool? isfinished;
  num? eventpoints;

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
    this.eventpoints,
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
        'attendeeslist': [],
        'maxattendees': maxattendees,
        'currentnumber': 0,
        'isfinished': false,
        'eventpoints': 0,
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
