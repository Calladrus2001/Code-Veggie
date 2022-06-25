import 'package:codeveggie/Services/Geolocation.dart';
import 'package:codeveggie/Services/StorageService.dart';
import 'package:codeveggie/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:file_picker/file_picker.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  bool haveImage = false;
  bool haveLocation = false;
  var location;
  late Position _pos;
  var path;
  final Storage storage = Storage();
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
                  decoration: BoxDecoration(
                      color: clr1,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
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
                            haveImage ? Icons.check : Icons.upload_rounded,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () async {
                          final result = await FilePicker.platform.pickFiles(
                              allowMultiple: false,
                              type: FileType.custom,
                              allowedExtensions: ['png', 'jpg', 'jpeg']);
                          if (result != null) {
                            final path = result.files.single.path;
                            final filename = result.files.single.name;
                            storage.uploadFile(filename, path!);
                          }

                          /// upload to firebase storage
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
                  decoration: BoxDecoration(
                      color: clr1,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
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
          SizedBox(height: 16),
          if (haveLocation && haveImage)
            GestureDetector(
              child: Chip(
                elevation: 4.0,
                backgroundColor: Colors.white,
                label: Text("Report Garbage", style: TextStyle(color: clr1)),
              ),
              onTap: () {
                /// add this post to forum
              },
            )
        ],
      ),
    );
  }
}
