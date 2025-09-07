import 'package:flutter/material.dart';
import 'package:sprints_store/SignInScreen.dart';
import 'package:sprints_store/SignUpScreen.dart';

class Welcomescreen extends StatefulWidget {
  const Welcomescreen({super.key});

  @override
  State<Welcomescreen> createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(title: Text("Sprints Store", style: TextStyle(color: Colors.white),), backgroundColor: Colors.blue),

      body: Center(child: Column(children: [
        SizedBox(height: MediaQuery.of(context).size.width * 0.10),
        Padding(padding: const EdgeInsets.all(8.0),
        child: Text("Sprints Store", style: TextStyle(color: Colors.blueGrey, fontSize: 28))),
        Text("Your favorite brands, just a tap away.", style: TextStyle(color: Colors.black, fontSize: 13)),
        SizedBox(height: 20),
        Row(children: [
          Padding(padding: const EdgeInsets.all(8.0),child: ClipRRect(borderRadius: BorderRadiusGeometry.circular(30),child: Image.asset("assets/images/smile-women.png", width: 160, height: 100))),
          Padding(padding: const EdgeInsets.all(8.0),child: ClipRRect(borderRadius: BorderRadiusGeometry.circular(30),child: Image.network("https://od.lk/d/MTlfNzI1MDQwMDNf/business-people-laptop-online-sh.png", width: 160, height:100 )))
          ]),
        SizedBox(height: 40),
        Spacer(),
        Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: const EdgeInsets.all(8.0),child: 
              ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Signupscreen()));}, child: Text("Sign Up"))),
              Padding(padding: const EdgeInsets.all(8.0),child: 
              ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Signinscreen()));}, child: Text("Sign In")))
            ]
          ),
        ),

      ])),
    );
  }
}