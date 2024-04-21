import 'package:flutter/material.dart';
// import 'routesearch.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:connectivity_plus/connectivity_plus.dart';

// void main() {
//   runApp(const Login());
// }

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordVisible = false;
  bool connected = false;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  late var token;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  Future<String?> loginreq(String username, String password) async {
    print(emailcontroller.text);
    print(passwordcontroller.text);
    var url = Uri.parse('http://10.0.2.2:8000/api/login');
    try {
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': emailcontroller.text,
          'password': passwordcontroller.text,
        }),
      );

      if (response.statusCode == 200) {
        print('Response status: ${response.statusCode}');
        var data = jsonDecode(response.body);
        // print('Response body: ${response.body}');
        return data['token'];
      } else {
        // throw Exception('Failed to load data');
        return null;
      }
    } catch (e) {
      print('Caught error: $e');
      return null;
    }
  }

  Future<void> savetoken(token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 110.0),
              child: Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black, // Text color
                    decorationColor:
                        Color.fromARGB(255, 36, 39, 253), // Underline color
                    decorationStyle:
                        TextDecorationStyle.solid, // Solid underline style
                    fontSize: 35.0, // Text size
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  contentPadding: const EdgeInsets.all(13.0),
                  labelText: 'Email/Username',
                  hintText: 'Enter email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 20, bottom: 20),
              // padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordcontroller,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding: const EdgeInsets.all(13.0),
                    labelText: 'Password',
                    hintText: 'Enter password'),
              ),
            ),
            SizedBox(
              height: 65,
              width: 360,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  onPressed: () async {
                    String? token = await loginreq(
                      emailcontroller.text,
                      passwordcontroller.text,
                    );
                    if (token != null) {
                      await savetoken(token);
                      print('login req successful');
                      // Navigator.pushReplacementNamed(context, '/home');
                    } else {
                      // Handle login failure
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login Failed')));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // Set the background color here
                  ),
                  child: const Text(
                    'Log in ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 252, 252, 252),
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 62),
                    child: Text('New Member ? '),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 1.0),
                    child: InkWell(
                        onTap: () {
                          print('hello');
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 14, color: Colors.blue),
                        )),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
