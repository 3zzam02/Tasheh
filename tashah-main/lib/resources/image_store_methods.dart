import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tasheh/screens/post.dart';
import 'package:uuid/uuid.dart';

class ImageStoreMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> imageToStorage(Uint8List file) async {
    String id = const Uuid().v1();
    Reference ref = _storage.ref().child('posts').child(id);

    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> uploadPost(
      String title,
      String description,
      String location,
      dynamic maxattendees,
      String time,
      String hostname,
      dynamic hostnumber,
      Uint8List file) async {
    String res = 'Some Error Occurred';
    try {
      String photoUrl = await imageToStorage(file);
      String postId = const Uuid().v1();

      Post post = Post(
          description: description,
          postId: postId,
          datePublished: DateTime.now(),
          datetime: time,
          postUrl: photoUrl,
          title: title,
          location: location,
          maxattendees: maxattendees,
          Userid: FirebaseAuth.instance.currentUser!.uid,
          hostname: hostname,
          hostnumber: hostnumber);
      _firestore.collection('posts').doc(postId).set(
            post.toJson(),
          );
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
