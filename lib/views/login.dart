import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Myhome.dart';

void main() {
  runApp((const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController mycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
        backgroundColor: Colors.purple,
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: 300,
                      height: 300,
                      child: Image.network(
                          'https://res.cloudinary.com/pippa/image/fetch/h_750,w_750,f_auto/https://assets.pippa.io/shows/cover/1659162081593-15ca86fae6e69290470793720bfd16a9.jpeg')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: mycontroller,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.contains("@") == false) {
                      return "enter valid email";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: (value) {
                    if (value == null || value.length < 8) {
                      return "enter valid password";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  if (_formkey.currentState!.validate()) {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString('email', mycontroller.text);
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Myhome(
                                  email: mycontroller.text,
                                )));
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('processing data ')),
                    );
                  }
                },
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: Checkbox.width,
                    backgroundColor: Color.fromARGB(0, 24, 150, 234),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text('SIGN UP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
