import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codeveggie/Services/Geolocation.dart';
import 'package:codeveggie/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  bool haveLocation = false;
  bool organise = true;
  var location;
  late Position _pos;
  var path;
  final addressController = new TextEditingController();
  CollectionReference entries = FirebaseFirestore.instance.collection('Chat');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Center(
              child: Container(
                height: 300,
                child: Image(
                  image: AssetImage("assets/images/environment.png"),
                ),
              ),
            ),
            Text(
              "Report Garbage dump",
              style: TextStyle(color: clr1, letterSpacing: 3),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: clr1,
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Step 1: Upload location",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          child: Chip(
                            backgroundColor: Colors.green,
                            label: haveLocation
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Get Location",
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                          onTap: () async {
                            Position pos = await Location().determinePosition();
                            if (pos.latitude != null) {
                              location =
                                  "https://www.google.com/maps/dir/?api=1&destination=" +
                                      Uri.encodeComponent(
                                          "${pos.latitude}, ${pos.longitude}");
                              setState(() {
                                _pos = pos;
                                haveLocation = true;
                                organise = false;
                              });
                            }
                          },
                        )
                      ],
                    ),
                  ),
                )),
            SizedBox(height: 24),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Step 2: Push to forum",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: clr1,
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                  ),
                )),
            SizedBox(height: 24),
            if (haveLocation)
              GestureDetector(
                child: Chip(
                  elevation: 4.0,
                  backgroundColor: Colors.white,
                  label: Text("Report Garbage", style: TextStyle(color: clr1)),
                ),
                onTap: () {
                  Get.snackbar("Code:Veggie", "Added!");
                  setState(() {
                    haveLocation = false;
                    organise = true;
                  });
                  entries.add({
                    "Message": "Garbage dump reported at:",
                    "User": FirebaseAuth.instance.currentUser!.email,
                    "Category": 2,
                    "Timestamp": Timestamp.now(),
                  });
                  entries.add({
                    "Message": "${location}",
                    "User": FirebaseAuth.instance.currentUser!.email,
                    "Category": 2,
                    "Timestamp": Timestamp.now(),
                  });
                },
              ),
            if (organise)
              Column(
                children: [
                  Text("or", style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 24),
                  Text(
                    "Organise Food waste collection day!",
                    style: TextStyle(color: clr1, letterSpacing: 3),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    title: Container(
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Color(0xffF2F4F6),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(
                            hintText: "Enter Landmark, Location, etc",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none),
                        cursorColor: clr1,
                      ),
                    ),
                    trailing: GestureDetector(
                      child: Icon(Icons.add_circle_rounded, color: clr1),
                      onTap: () {
                        Get.snackbar("Code:Veggie", "Added!");
                        entries.add({
                          "Message":
                              "Food waste collection organised at:\n\n${addressController.text}",
                          "User": FirebaseAuth.instance.currentUser!.email,
                          "Category": 3,
                          "Timestamp": Timestamp.now(),
                        });
                        addressController.text = "";
                      },
                    ),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
