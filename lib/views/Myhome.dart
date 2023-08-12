// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';

// ignore: must_be_immutable
class Myhome extends StatefulWidget {
  String email;
  Myhome({super.key, required this.email});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  List<Widget> pages = [
    const Page1(),
    const Page2(),
    const Page3(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
       /*body: Center(
        child: Text(widget.email),
      ),*/
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle:const TextStyle(color: Colors.white, ),
        selectedIconTheme:const IconThemeData(color: Colors.white),
        currentIndex: currentIndex,
        backgroundColor: Colors.purple,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'page1'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'page2'),
          BottomNavigationBarItem(icon: Icon(Icons.security), label: 'page3'),
        ],
        onTap: (value) {
          currentIndex = value;
          setState(() {});
          // ignore: avoid_print
          print(value);
        },
      ),
    );
  }
}
