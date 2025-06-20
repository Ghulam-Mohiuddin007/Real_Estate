// ignore: unused_import
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:project/detail.dart';
import 'package:project/feedback.dart';
import 'package:project/order.dart';
import 'package:project/profile.dart';

import 'package:project/sell.dart';
import 'package:project/login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'cart.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  bool positive = false;
  List nearby = [];

  Future grtNearby() async {
    var res = await http.post(
      Uri.parse("https://myrealhomeapp.000webhostapp.com/nearby_places.php"),
    );

    var response = jsonDecode(res.body);
    setState(() {
      nearby.addAll(response);
    });
    print(nearby.length.toString());
  }

  List cat = [];
  Future list() async {
    var res = await http.post(
      Uri.parse("https://myrealhomeapp.000webhostapp.com/catag.php"),
    );

    var response = jsonDecode(res.body);
    setState(() {
      cat.addAll(response);
    });
    print(cat.length.toString());
  }

  @override
  void initState() {
    grtNearby();
    list();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 245, 245),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 247, 245, 245),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 18,
                ),
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 243, 232, 232),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 100,
                              width: 150,
                              child: Image.asset(
                                "assets/images/18132521.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            GestureDetector(
                              onTap: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.rightSlide,
                                  title: 'Logout',
                                  desc: 'Are you sure to logout',
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => Login())));
                                  },
                                )..show();
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Icon(Icons.logout),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Real_Estate",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  width: 300,
                  child: Row(
                    children: [
                      Icon(
                        Icons.home_filled,
                        size: 40,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Dashboard",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => order(tableid: ''))));
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_bag,
                          size: 40,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Bookings",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => feedback())));
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    child: Row(
                      children: [
                        Icon(
                          Icons.feedback,
                          size: 40,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Feedback",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => cart())));
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_basket,
                          size: 40,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Cart",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hi Anarda",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => profile())));
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60",
                          fit: BoxFit.cover,
                          height: 4000,
                          width: MediaQuery.of(context).size.width * 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "Welcome",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                    fontSize: 18),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 210,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cat.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      sell(variable3: cat[index]['listid']))));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 300,
                            width: 150,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(133, 221, 221, 221),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: Offset(
                                      1, 1), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 15),
                                  child: Text(
                                    cat[index]['cat_name'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 0, left: 15),
                                  child: Text(
                                    cat[index]['sub_name'],
                                    style: TextStyle(),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Image.network(
                                  cat[index]['img'],
                                  height: 140,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Nearby places",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: ListView.builder(
                    itemCount: nearby.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => detail(
                                        id: nearby[index]['id'].toString(),
                                      ))));
                        },
                        child: Container(
                          height: 160,
                          width: MediaQuery.of(context).size.width * 0.9,
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 247, 242, 242),
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    nearby[index]['himage'],
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  height: 25,
                                  width: 150,
                                  padding: EdgeInsets.only(left: 10, top: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                    ),
                                    color: Colors.amber,
                                  ),
                                  child: Text(
                                    ("Save 20% now on booking"),
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 15,
                                bottom: 50,
                                child: Container(
                                  height: 56,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(85, 10, 10, 10),
                                        spreadRadius: 5,
                                        blurRadius: 25,
                                        offset: Offset(
                                            1, 1), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 15,
                                bottom: 50,
                                child: Text(nearby[index]['name'],
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Positioned(
                                left: 15,
                                bottom: 20,
                                child: Row(
                                  children: [
                                    Text(nearby[index]['rating'],
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
