import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Storage {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uploadFile(String fileName, String filePath) async {
    File file = File(filePath);
    try {
      await storage
          .ref('Images/${FirebaseAuth.instance.currentUser!.email}/${fileName}')
          .putFile(file);
    } on FirebaseException catch (e) {
      print(e);
    }
  }
}
