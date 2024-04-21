import 'package:flutter/material.dart';
// import 'routesearch.dart';
import 'package:stroke_text/stroke_text.dart';
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
        child: Column( 
		children: <Widget>[ 
			Padding( 
			padding: const EdgeInsets.only(top: 110.0), 
			child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text('Login',style: TextStyle(
                        color: Colors.black, // Text color
                        decorationColor: Color.fromARGB(255, 36, 39, 253), // Underline color
                        decorationStyle: TextDecorationStyle.solid, // Solid underline style
                        fontSize: 35.0, // Text size
                        fontWeight: FontWeight.bold, 
                      ),),
            ), 
			),
      const SizedBox(height:20), 
			Padding( 
			//padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0), 
			padding: EdgeInsets.symmetric(horizontal: 15), 
			child: TextField( 
				decoration: InputDecoration( 
					border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0),), 
          contentPadding: EdgeInsets.all(13.0),
					labelText: 'Email/Username', 
					hintText: 'Enter email',), 
			), ),
			Padding( 
			padding: const EdgeInsets.only( 
				left: 15.0, right: 15.0, top: 20, bottom: 20), 
			// padding: EdgeInsets.symmetric(horizontal: 15), 
			child: TextField( 
				obscureText: true, 
				decoration: InputDecoration( 
					border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0),), 
          contentPadding: EdgeInsets.all(13.0),
					labelText: 'Password', 
					hintText: 'Enter password'), 
			), 
			), 

		SizedBox( 
			height: 65, 
			width: 360, 
			child: Container( 
				child: Padding( 
				padding: const EdgeInsets.only(top: 20.0), 
				child: ElevatedButton( 
					child: Text( 'Log in ', style: TextStyle(color: Color.fromARGB(255, 252, 252, 252), fontSize: 20), 
					), 
					onPressed: (){ 
					print('Successfully log in '); 
					}, 
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue, // Set the background color here
  ),
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
						padding: const EdgeInsets.only(left:1.0), 
						child: InkWell( 
						onTap: (){ 
							print('hello'); 
						}, 
							child: Text('Sign Up', style: TextStyle(fontSize: 14, color: Colors.blue),)), 
					) 
					], 
				), 
				) 
			) 
		], 
		),
      ),
    );
  }
}
