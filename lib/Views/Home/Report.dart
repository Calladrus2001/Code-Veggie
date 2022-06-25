import 'package:codeveggie/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  ImagePicker _picker = new ImagePicker();
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                        "Step 1: Upload an Image",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 8),
                      GestureDetector(
                        child: CircleAvatar(
                          minRadius: 18,
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.upload_rounded,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () async {
                          image = await _picker.pickImage(
                              source: ImageSource.gallery);
                        },
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: clr1,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
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
                        "Step 2: Upload location",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 8),
                      GestureDetector(
                        child: Chip(
                          backgroundColor: Colors.green,
                          label: Text(
                            "Get Location",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        onTap: () {
                          /// pick image
                        },
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: clr1,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
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
                        "Step 3: Push to forum",
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
        ],
      ),
    );
  }
}
