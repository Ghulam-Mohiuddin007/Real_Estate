import 'package:flutter/material.dart';
import 'package:project/order.dart';
import 'package:project/thanks.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'home.dart';

class booking extends StatefulWidget {
  String variable;
  String variable2;
  booking({super.key, required this.variable, required this.variable2});

  @override
  State<booking> createState() => _bookingState();
}

class _bookingState extends State<booking> {
  TextEditingController emailPhno = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController remarks = TextEditingController();

  Future validate() async {
    if (name.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: "Enter Your Name ",
        ),
      );
    } else if (emailPhno.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: "Enter Your Mail ",
        ),
      );
    } else if (address.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: "Enter Your Address ",
        ),
      );
    } else if (remarks.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: " Please enter Your Remarks ",
        ),
      );
    } else {
      var res = await http.post(
          Uri.parse("https://myrealhomeapp.000webhostapp.com/booking.php"),
          body: {
            "user_name": name.text.toString(),
            "user_contact": emailPhno.text.toString(),
            "user_address": address.text.toString(),
            "user_remarks": remarks.text.toString(),
            "user_houseid": widget.variable2.toString(),
            "user_date": widget.variable.toString(),
          });
      var response = jsonDecode(res.body);
      if (response["Success"] == 'true') {
        print("Success");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (contex) => order(
                      tableid: widget.variable2,
                    )));
      } else {
        print(response["Success"]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 245, 245),
      appBar: AppBar(
        title: Text("Booking Form",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kindly Enter Your Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Username"),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter name',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Phone/Email"),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      controller: emailPhno,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Mail',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Address"),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          controller: address,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Address',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Remarks"),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          controller: remarks,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Suggestions',
                          ),
                        ),
                      ),
                    ],
                  ),
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
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue),
                    child: Center(
                      child: Text(
                        "Book My Apartment",
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
