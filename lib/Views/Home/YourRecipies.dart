import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codeveggie/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class YourRecipies extends StatefulWidget {
  const YourRecipies({Key? key}) : super(key: key);

  @override
  State<YourRecipies> createState() => _YourRecipiesState();
}

class _YourRecipiesState extends State<YourRecipies> {
  late FirebaseFirestore firestore;
  final Stream<QuerySnapshot> journalStream = FirebaseFirestore.instance
      .collection('Users')
      .doc("${FirebaseAuth.instance.currentUser!.email}")
      .collection("Recipes")
      .snapshots();

  CollectionReference entries = FirebaseFirestore.instance
      .collection('Users')
      .doc("${FirebaseAuth.instance.currentUser!.email}")
      .collection("Recipes");

  @override
  void initState() {
    super.initState();
    firestore = FirebaseFirestore.instance;
  }

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
      body: StreamBuilder(
        stream: journalStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.hasError) {
            return Center(child: CircularProgressIndicator(color: clr1));
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Card(
                  elevation: 4.0,
                  child: ListTile(
                    title: Text(data["Name"]),
                    subtitle: Text(data['Recipe']),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
