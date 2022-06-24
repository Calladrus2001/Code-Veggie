import 'package:codeveggie/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class YourRecipies extends StatefulWidget {
  const YourRecipies({Key? key}) : super(key: key);

  @override
  State<YourRecipies> createState() => _YourRecipiesState();
}

class _YourRecipiesState extends State<YourRecipies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout_outlined, color: clr1),
        backgroundColor: Colors.white,
        onPressed: () {
          FirebaseAuth.instance.signOut();
        },
      ),
    );
  }
}
