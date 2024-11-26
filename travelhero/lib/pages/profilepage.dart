import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  late String token;
  String name = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    getval();
  }

  Future<void> getval() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? "";
  if (token.isNotEmpty) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      setState(() {
        name = decodedToken['name'] ?? "Unknown Name";
        email = decodedToken['email'] ?? "Unknown Email";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  height: 250,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purple, Colors.blue],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 16,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {},
                ),
              ),
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    name, // Display name from the decoded token
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          Positioned(
            top: 100,
            left: MediaQuery.of(context).size.width / 2 - 40,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300, width: 2),
              ),
              margin: const EdgeInsets.only(bottom: 10.0),
              child: const Icon(
                Icons.person,
                color: Colors.purple,
                size: 40,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Display email
          Text(
            email,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
