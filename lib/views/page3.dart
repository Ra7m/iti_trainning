import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('page3'),
      ),
      body:const Center(
        child: Text('page3'),
      ),
    );
  }
}
