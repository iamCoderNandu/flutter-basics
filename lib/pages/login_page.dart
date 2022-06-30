// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            "assets/images/login_image.png",
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Welcome, $name",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "Enter your username",
                  ),
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () async {
                    setState(() {
                      changeButton = true;
                    });
                    await Future.delayed(Duration(seconds: 1));
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: changeButton ? 40 : 110,
                    height: 40,
                    alignment: Alignment.center,
                    child: changeButton
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(changeButton ? 40 : 8),
                      color: Colors.deepPurple,
                    ),
                  ),
                )
                // ElevatedButton(
                //   onPressed: (() {
                //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                //   }),
                //   child: Text("Login"),
                //   style: TextButton.styleFrom(
                //       backgroundColor: Colors.deepPurple,
                //       minimumSize: Size(110, 40)),
                // )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
