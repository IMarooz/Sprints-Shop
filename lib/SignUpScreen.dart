import 'package:flutter/material.dart';
import 'package:sprints_store/ShoppingScreen.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign up")),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            Text("Create Account"),
            Text("Join Sprints Store today"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(label: Text("Full Name")),
                maxLength: 25,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a vaild Name";
                  }
                  return null;
                },
              ),
            ),

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

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(label: Text("Confirm Password")),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter the password";
                  }
                  if (value != passController.text) {
                    return "Enter the exact password";
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
                  _showDialog(context, "Account Created","Click 'cancel' to Finish.");
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

  void _showDialog(BuildContext context, String title,String content) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) =>
          AlertDialog(title: Text(title), content: Text(content), actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
              Navigator.push(context,MaterialPageRoute(builder: (context) => Shoppingscreen()));}, child: Text("Close"))
          ]),
    ).then((val) {});
  }
}
