import 'package:flutter/material.dart';
import 'package:train1/views/service/user_service.dart';

import 'model/usermodel.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<UserModel> users = [];
  bool isloaing = true;
  getMyUsers() async {
    users = await UserService().getUsers();
    isloaing = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getMyUsers();
  }

  @override
  Widget build(BuildContext context) {
    return isloaing ? 
    const Center(child: CircularProgressIndicator(),)
    : ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(users[index].title ?? "--"),
            trailing: const Icon(Icons.person),
            leading: Text("${index + 1}"),
          );
        });
  }
}
