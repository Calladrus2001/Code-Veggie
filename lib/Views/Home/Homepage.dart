import 'package:codeveggie/Views/Home/Chat.dart';
import 'package:codeveggie/Views/Home/Discover.dart';
import 'package:codeveggie/Views/Home/Report.dart';
import 'package:codeveggie/Views/Home/YourRecipies.dart';
import 'package:codeveggie/Views/Home/News.dart';
import 'package:codeveggie/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> bodyPages = [
    YourRecipies(),
    Discover(),
    ChatHome(),
    Report(),
    // NewsPage(),
  ];
  int _index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _index,
          selectedItemColor: clr1,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined), label: "Your Recipes"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.globe), label: "Discover"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
            BottomNavigationBarItem(
                icon: Icon(Icons.report_gmailerrorred_outlined),
                label: "Report"),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.newspaper_outlined), label: "News"),
          ],
          onTap: (int index) {
            setState(() {
              _index = index;
            });
          },
        ),
        body: Stack(
          children: [
            IndexedStack(
              index: _index,
              children: bodyPages,
            ),
          ],
        ));
  }
}
