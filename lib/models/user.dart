import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final userRef = FirebaseFirestore.instance.collection('user');

class Users {
  var userId;
  var username;
  var photoUrl;
  var bio;

  var isTeacher;
  var isAdmin;
  var followerCount;
  var projectCount;

  Users({
    this.userId = '',
    this.username = '',
    this.photoUrl = '',
    this.bio = '',
    this.isTeacher = false,
    this.isAdmin = false,
    this.followerCount = 0,
    this.projectCount = 0,
  });

  getData(d) {
    userRef.doc(FirebaseAuth.instance.currentUser?.email).get(d as GetOptions);
  }

  loginUser() {
    userId = getData('id');
    username = getData('username');
    photoUrl = getData('photo_url');
    bio = getData('bio');
    isTeacher = getData('is_teacher');
    isAdmin = getData('is_admin');
    followerCount = getData('follower_count');
    projectCount = getData('posts');
    print('finsihed');
  }
}
