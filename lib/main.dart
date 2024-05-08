import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
}


