import 'package:flutter/material.dart';
import 'package:project/booking.dart';
import 'package:project/cart.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class detail extends StatefulWidget {
  String id;
  detail({super.key, required this.id});

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  List deaillist = [];
  String date = "";
  String? mainImg;
  Future getDetail() async {
    var res = await http.post(
        Uri.parse("https://myrealhomeapp.000webhostapp.com/Detail.php"),
        body: {
          "hid": widget.id.toString(),
        });

    var response = jsonDecode(res.body);
    setState(() {
      deaillist.addAll(response);
    });
    print(deaillist.length.toString());
  }

  @override
  void initState() {
    DateTime dateToday = new DateTime.now();
    date = dateToday.toString().substring(0, 10);
    print(date); // 2021-06-24
    getDetail();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 245, 245),
      appBar: AppBar(
        title: Text("Detail "),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: ((context) => cart())));
              },
              child: Icon(Icons.shopping_bag))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  deaillist.isNotEmpty ? deaillist[0]['name'] : '',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                if (deaillist.isNotEmpty)
                  Container(
                    height: 250,
                    width: 450,
                    margin: EdgeInsets.only(left: 3, right: 3),
                    child: Image.network(
                      deaillist[0]['himage'],
                      fit: BoxFit.cover,
                    ),
                  ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  deaillist.isNotEmpty ? deaillist[0]['price'] : '',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Description :",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  deaillist.isNotEmpty ? deaillist[0]['description'] : '',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => booking(
                                variable: date, variable2: widget.id))));
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        "Book Now",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => cart())));
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
