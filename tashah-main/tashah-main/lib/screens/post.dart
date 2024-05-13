class Post {
  String? description;
  String? postId;
  DateTime? datePublished;
  String? postUrl;

  Post({
    this.description,
    this.postId,
    this.datePublished,
    this.postUrl,
  });

  Map<String, dynamic> toJson() => {
        "description": description,
        "postId": postId,
        "datePublished": datePublished,
        "postUrl": postUrl,
      };
  Post.fromJson(Map<String, dynamic> Json) {
    postId = Json['postId'];
    description = Json['description'];
    postUrl = Json['postUrl'];
    datePublished = Json['datePublished'];
  }
}

// Stream<int> _getPendingEventCountStream() {
//     return FirebaseFirestore.instance
//         .collection('eventsCollection')
//         .where('status', isEqualTo: 'pending')
//         .snapshots()
//         .map((snapshot) => snapshot.size);
//   }
