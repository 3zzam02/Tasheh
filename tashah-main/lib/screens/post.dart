class Post {
  String? description;
  String? postId;
  DateTime? datePublished;
  String? postUrl;
  String? title;
  String? location;
  dynamic maxattendees;

  Post({
    this.description,
    this.postId,
    this.datePublished,
    this.postUrl,
    this.title,
    this.location,
    this.maxattendees,
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

// Stream<int> _getPendingEventCountStream() {
//     return FirebaseFirestore.instance
//         .collection('eventsCollection')
//         .where('status', isEqualTo: 'pending')
//         .snapshots()
//         .map((snapshot) => snapshot.size);
//   }
