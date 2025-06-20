import 'package:flutter/material.dart';

class thanks extends StatefulWidget {
  const thanks({super.key});

  @override
  State<thanks> createState() => _thanksState();
}

class _thanksState extends State<thanks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 245, 245),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your Apartement Has been Booked",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 40,
              ),
              Text(
                "Thanks For Boooking",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.verified,
                color: Colors.green,
                size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
