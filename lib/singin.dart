import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/home.dart';
import 'package:project/login.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();
  TextEditingController email = TextEditingController();

  Future validate() async {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email.text.toString());
    if (name.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: "Enter Your Name ",
        ),
      );
    } else if (password.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: "Enter Your Password ",
        ),
      );
    } else if (repassword.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: "Please Confirm your Password",
        ),
      );
    } else if (email.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: "Enter Your E-Mail ",
        ),
      );
    } else if (password.text != repassword.text) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: "Password not match ",
        ),
      );
    } else if (!emailValid) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: "Enter valid email  ",
        ),
      );
    } else {
      var res = await http.post(
          Uri.parse("https://myrealhomeapp.000webhostapp.com/Resgister.php"),
          body: {
            "user_name": name.text.toString(),
            "user_email": email.text.toString(),
            "user_pass": password.text.toString(),
          });

      var response = jsonDecode(res.body);
      if (response["Success"] == 'true') {
        print("Success");
        Navigator.push(
            context, MaterialPageRoute(builder: (contex) => homepage()));
      } else {
        print(response["Success"]);
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
            children: [
              Container(
                height: 250,
                width: 2000,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/18132521.jpg",
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 25,
                      left: 10,
                      child: Text(
                        "Signup",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Row(
                        children: [
                          Text(
                            "Already have an account?",
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
                                      builder: ((context) => Login())));
                            },
                            child: Text(
                              "login",
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
                height: 20,
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
                      controller: name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Username",
                          hintStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
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
                      controller: password,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Password",
                          hintStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
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
                      controller: repassword,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Confirm Password",
                          hintStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
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
                      controller: email,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Email",
                          hintStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  validate();
                },
                child: Center(
                  child: Container(
                    height: 40,
                    width: 800,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue),
                    child: Center(
                      child: Text(
                        "Sigup",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
