import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/detail.dart';

class order extends StatefulWidget {
  String tableid = '';
  order({Key? key, required this.tableid}) : super(key: key);

  @override
  State<order> createState() => _orderState();
}

class _orderState extends State<order> {
  List get = [];

  Future getDetail() async {
    setState(() {
      get.clear();
    });
    var res = await http.post(
        Uri.parse(
            "https://myrealhomeapp.000webhostapp.com/join%20for%20order.php"),
        body: {"variable2": (widget.tableid.toString())});

    var response = jsonDecode(res.body);
    setState(() {
      get.addAll(response);
    });
    print(get.length.toString());
  }

  Future delete(String id) async {
    var res = await http.post(
        Uri.parse("https://myrealhomeapp.000webhostapp.com/.php"),
        body: {"hid": id});

    var response = jsonDecode(res.body);

    print(get.length.toString());
  }

  @override
  void initState() {
    getDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookings"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => detail(
                            id: get[0]["houseid"].toString(),
                          ))));
            },
            child: Container(
              child: ListView.builder(
                itemCount: get.length, // Use the actual data length
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    height: 99,
                    width: MediaQuery.of(context).size.width * 0.88,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 201, 207, 211),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                              child: Image.network(
                                get[index]['himage'],
                                fit: BoxFit.cover,
                                width: 100,
                                height: 99,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start, // Adjust alignment
                              children: [
                                SizedBox(height: 10),
                                Text(get[index]['name'] +
                                    "-" +
                                    get[index]['order_number']),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(get[index]['rating']),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 17,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(get[index]['date']),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("Your Booking ID is "),
                                Text(get[index]['order_number']),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                            onTap: () {
                              delete(get[index]['order_number'].toString());
                            },
                            child: Icon(Icons.delete))
                      ],
                    ),
                  );
                },
              ),
            ),
          )),
    );
  }
}
