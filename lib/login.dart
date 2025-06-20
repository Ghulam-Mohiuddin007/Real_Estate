// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/forget.dart';
import 'package:project/singin.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool obscurePassword = true;
  Future validate() async {
    if (email.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: "Enter Your E-Mail ",
        ),
      );
    } else if (pass.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: "Enter Your Password ",
        ),
      );
    } else {
      var res = await http.post(
          Uri.parse("https://myrealhomeapp.000webhostapp.com/login.php"),
          body: {
            "user_email": email.text.toString(),
            "user_pass": pass.text.toString(),
          });

      var response = jsonDecode(res.body);
      print(response["Success"]);
      if (response["Success"] == 'true') {
        Navigator.push(
            context, MaterialPageRoute(builder: (contex) => homepage()));
      } else {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: "Failed",
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 245, 245),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 250,
                width: 2000,
                child: Stack(
                  children: [
                    Image.network(
                      "https://img.freepik.com/free-photo/observation-urban-building-business-steel_1127-2397.jpg?w=740&t=st=1695184818~exp=1695185418~hmac=052f59ef5ec5192199d64524850a53169be9f8d14aa74d3130763c6b3bfc78f9",
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 25,
                      left: 10,
                      child: Text(
                        "Welcome Back",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      left: 10,
                      child: Row(
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(fontSize: 13, color: Colors.black),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => signin())));
                            },
                            child: Text(
                              "Signin",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2.5,
                                  decorationColor: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: 50,
                    child: TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: "Email",
                          hintStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold,)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: 50,
                    child: TextFormField(
                      controller: pass,
                      obscureText: obscurePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: "Password",
                        suffix: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  validate();
                },
                child: Center(
                  child: Container(
                    height: 40,
                    width: 650,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Forgrt Password?"),
                  SizedBox(
                    width: 3,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => forget())));
                    },
                    child: Text(
                      "Click Here",
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2.5,
                          decorationColor: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(child: Text("Or")),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.black)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 40,
                          width: 50,
                          child: Image.asset("assets/images/google.png"),
                        ),
                        Text(
                          "Google",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.black)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 40,
                          width: 50,
                          child: Image.asset("assets/images/facebook.png"),
                        ),
                        Text(
                          "facebook",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
