class Post {
  String? description;
  String? postId;
  DateTime? datePublished;
  String? postUrl;
  String? title;
  String? location;
  List<String>? attendeeslist = [];
  String? Userid;
  num? maxattendees;

  Post({
    this.description,
    this.postId,
    this.datePublished,
    this.postUrl,
    this.title,
    this.location,
    this.attendeeslist,
    this.maxattendees,
    this.Userid,
  });

  Map<String, dynamic> toJson() => {
        "description": description,
        "postId": postId,
        "datePublished": datePublished,
        "postUrl": postUrl,
        "title": title,
        "location": location,
        'maxattendees': maxattendees,
      };
  Post.fromJson(Map<String, dynamic> Json) {
    postId = Json['postId'];
    description = Json['description'];
    postUrl = Json['postUrl'];
    datePublished = Json['datePublished'];
    title = Json['title'];
    location = Json['location'];
    maxattendees = Json['maxattendees'];
  }
}
