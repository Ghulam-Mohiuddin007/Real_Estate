import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/detail.dart';

import 'package:http/http.dart' as http;

class sell extends StatefulWidget {
  String variable3;
  sell({super.key, required this.variable3});

  @override
  State<sell> createState() => _sellState();
}

class _sellState extends State<sell> {
  List get3 = [];
  Future list2() async {
    var res = await http.post(
        Uri.parse("https://myrealhomeapp.000webhostapp.com/list2.php"),
        body: {
          'variable3': widget.variable3.toString(),
        });

    var response = jsonDecode(res.body);
    setState(() {
      get3.addAll(response);
    });
    print(get3.length.toString());
  }

  void initState() {
    list2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 245, 245),
      appBar: AppBar(
        title: get3.isNotEmpty ? Text(get3[0]['cat_name']) : Text(''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(133, 221, 221, 221),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(1, 1), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Search...',
                                border: InputBorder.none),
                          ),
                        ),
                        Icon(
                          Icons.search,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(133, 221, 221, 221),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(1, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(Icons.filter),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                    itemCount: get3.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => detail(id: ''))));
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          height: 80,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20)),
                                  child: Image.network(
                                    get3[index]['himage'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    get3[index]['name'],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("price = 5000 USD"),
                                  Row(
                                    children: [
                                      Text("4.5"),
                                      Icon(
                                        Icons.star_half,
                                        color: Colors.amber,
                                      )
                                    ],
                                  ),
                                ],
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
