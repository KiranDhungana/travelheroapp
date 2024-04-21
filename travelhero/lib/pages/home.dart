import 'package:flutter/material.dart';
// import 'routesearch.dart';
import 'package:stroke_text/stroke_text.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';

// void main() {
//   runApp(const Home());
// }
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool passwordVisible = false;
  bool connected = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    // Future<void> _checkConnectivity() async {
    //   final ConnectivityResult connectivityResult =
    //       await Connectivity().checkConnectivity();
    //   print(connectivityResult);
    //   if (connectivityResult == ConnectivityResult.wifi ||
    //       connectivityResult == ConnectivityResult.mobile ||
    //       connectivityResult == ConnectivityResult.ethernet ||
    //       connectivityResult == ConnectivityResult.vpn) {
    //     setState(() {
    //       connected = true;
    //     });
    //   }
    // }

    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("images/bbackg.jpeg"),
            //     fit: BoxFit.cover,
            //     colorFilter: ColorFilter.mode(
            //       Colors.black.withOpacity(
            //           0.35), // Adjust the opacity here (0.0 to 1.0)
            //       BlendMode.dstATop,
            //     ),
            //   ),
            // ),
            decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue,
                Colors.green,
              ],
            ),
          ),
            child: Center(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: (MediaQuery.of(context).size.height) * 0.15,
                  ),

                  // const SizedBox(
                  //   height: 30,
                  // ),
                  //  StrokeText(
                  //    text:'Welcome',
                  //    textStyle: TextStyle(
                  //      fontSize: 40.0,

                  //      fontFamily: 'Pacifico',
                  //    ),
                  //    strokeWidth: 7,
                  //  ),
                  //  StrokeText(
                  //    text:'to',
                  //    textStyle: TextStyle(
                  //      fontSize: 35.0,
                  //      fontFamily: 'Pacifico',
                  //    ),
                  //    strokeWidth: 7,
                  //  ),
                  Center(child: Image.asset('images/room.png', height:200, width: 200),),
                  const SizedBox(
                    height: 20,
                  ),
                  StrokeText(
                    text: 'Room Finder',
                    textStyle: TextStyle(
                      fontSize: 50.0,
                      fontFamily: 'Pacifico',
                      color: Colors.cyanAccent,
                      letterSpacing: 2.5,
                    ),
                    strokeWidth: 5,
                  ),
                  //  CircleAvatar(
                  //    radius: 60.0,
                  //    backgroundImage: AssetImage('images/Designer.png'),
                  //  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Rooms at Your Fingertips'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 0, 0,0),
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                    width: 170,
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: Size(20, 30),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      // shape: const RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.all(Radius.circular(2)),
                      //   side: BorderSide(color: Colors.blue, width: 2),
                      // ),
                    ),
                    onPressed: () async {
                      // await _checkConnectivity();

                      // /// Navigate to the second screen using a named route.
                      // if (connected) {
                      //   Navigator.pushNamed(context, '/search');
                      // } else {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content: Text(
                      //           "No intetnet Connection. Please Connect and try again"),
                      //     ),
                      //   );
                      // }
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 14),
                      height: 45,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.cyanAccent,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 15, 15, 15),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    // child: Text('LOGIN'),
                  ),
                  GestureDetector(
      onTap: () {
        // Handle link click action here
        print('Link clicked!');
        Navigator.pushNamed(context, '/login');
      },
      child: Text(
        'Login',
        style: TextStyle(
          color: Colors.black,
          decoration: TextDecoration.underline,
        ),
      ),
    ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/aboutus');
              },
              child: Icon(
                Icons.people,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
