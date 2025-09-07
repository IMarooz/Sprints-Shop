import 'package:flutter/material.dart';
import 'package:sprints_store/ShoppingScreen.dart';

class Signinscreen extends StatefulWidget {
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In")),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            Text("Welcome Back"),
            Text("Sign in to Sprints Store"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(label: Text("Email")),
                controller: emailController,
                validator: (value) {
                  if (value == null || !(value.contains("@"))) {
                    return "Enter a valid Email";
                  }
                  return null;
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(label: Text("Password")),
                controller: passController,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return "Enter a valid password length of 6";
                  }
                  return null;
                },
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  _formkey.currentState!.save();
                  _showDialog(
                    context,
                    "Account Sign-in successfully",
                    "Click 'cancel' to Finish."
                  );
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Processing Data")));
                }
              },
              child: Text("Create Account"),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(
    BuildContext context,
    String title,
    String content,
  ) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Shoppingscreen()),
              );
            },
            child: Text("Close"),
          ),
        ],
      ),
    ).then((val) {});
  }
}
