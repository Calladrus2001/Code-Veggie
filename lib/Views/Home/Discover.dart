import 'package:codeveggie/Views/Home/FoodResult.dart';
import 'package:codeveggie/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  final searchController = new TextEditingController();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                  height: 250,
                  child: Image(image: AssetImage("assets/images/recipe.png"))),
            ),
            SizedBox(height: 16),
            Container(
              child: ListTile(
                title: Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Color(0xffF2F4F6),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                        hintText: "What's cooking today?",
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none),
                    cursorColor: clr1,
                  ),
                ),
                trailing: GestureDetector(
                  child: Icon(Icons.search_rounded, color: clr1),
                  onTap: () {
                    box.write("query", searchController.text);
                    Get.to(() => FoodResult());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
