import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fistagram/resources/storage_methods.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file.isNotEmpty) {
        //register user
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print("user uid" + credential.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageStorage('profilePics', file, false);

        //add usr to our database
        _firestore.collection('user').doc(credential.user!.uid).set({
          'username': username,
          'uid': credential.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
          'profileUrl': photoUrl,
        });

        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
}