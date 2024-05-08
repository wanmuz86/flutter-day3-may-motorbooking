import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  var nameEditingController = TextEditingController();
  var emailEditingController = TextEditingController();
  var addressEditingController = TextEditingController();
  var pickupDateEditingController = TextEditingController();
  var sentDateEditingController = TextEditingController();
  var motorInfoEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Booking page"),),
      body:Column(
        children: [
          TextField(decoration:  InputDecoration(hintText: "Enter your name"), controller: nameEditingController,),
          TextField(decoration:  InputDecoration(hintText: "Enter your email"), controller:  emailEditingController,),
          TextField(decoration:  InputDecoration(hintText: "Enter your address"),controller: addressEditingController,),
          TextField(decoration:  InputDecoration(hintText: "Enter pickup date"), controller: pickupDateEditingController,),
          TextField(decoration:  InputDecoration(hintText: "Enter sent date"), controller: sentDateEditingController,),
          TextField(decoration:  InputDecoration(hintText: "Enter motorcycle info"), controller: motorInfoEditingController,),
          ElevatedButton(onPressed: (){

          }, child: Text("Book Now"))
        ],
      )
    );
  }
  // 1) import http
  Future<http.Response> createBooking(String name, String email,
      String address, String pickup, String sent, String motor) {
    return http.post(
      Uri.parse('https://api.sheety.co/4db58997dd33ab7eaa3d621c48bdea06/booking/sheet1'),
      // If you want to pass header it will be here
      // REMARK: Later you might need to pass token for authentication
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // import dart convert
      body: jsonEncode(<String, Map<String,String>>{
        // This needs to follow the documnetation, eg sheety doc
        // left is the key passed to sheety, right is the argument of the function
        'sheet1': {
          'name':name,
          'email':email,
          'address':address,
          'pickup':pickup,
          'sent':sent,
          'motor':motor
        },
      }),
    );
  }
}


