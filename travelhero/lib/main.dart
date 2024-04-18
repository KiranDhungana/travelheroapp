import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _data = 'Fetching data...';
  @override
  void initState() {
    super.initState();
  }

  TextEditingController searchcontroller = TextEditingController();

  List<User> userList = [];

  Future<void> searchreq() async {
    print(searchcontroller.text);
    var url = Uri.parse('http://10.0.2.2:8000/api/searchbyname');
    try {
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'query': searchcontroller.text,
        }),
      );

      if (response.statusCode == 200) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Caught error: $e');
    }
  }

// login reuest code
  Future<void> loginreq() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/login');
    try {
<<<<<<< HEAD
      final response =
          await http.get(Uri.parse("http://10.0.2.2:8000/api/allusers"));
=======
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': 'kirandhungana570@gmail.com',
          'password': 'nepal123',
        }),
      );
>>>>>>> 53353c71d59e06ec3393305e9182310d0bc934ca

      if (response.statusCode == 200) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Caught error: $e');
    }
  }

  // login request code end

  // signup req code
  Future<void> signupreq() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/signup');

    try {
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': "Kiran 2",
          'email': 'kirandhungana69@gmail.com',
          'password': 'nepal123',
        }),
      );

      if (response.statusCode == 200) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Caught error: $e');
    }
  }

// signup req end
  Future<void> handelchange(val) async {
    var url = Uri.parse('http://10.0.2.2:8000/api/searchbyname');
    print(val);
    try {
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'query': val,
        }),
      );

      if (response.statusCode == 200) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        var data = json.decode(response.body) as List;
        setState(() {
          userList = data.map((item) => User.fromJson(item)).toList();
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Caught error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) => handelchange(value),
            controller: searchcontroller,
          ),
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            "ok",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(userList[index].name),
                  subtitle: Text(userList[index].email),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: searchreq,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
