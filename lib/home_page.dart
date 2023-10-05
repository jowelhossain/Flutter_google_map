import 'package:flutter/material.dart';
import 'package:flutter_google_map/map_screen/current_location.dart';
import 'package:flutter_google_map/map_screen/google_map.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Map Screen"),centerTitle: true,),

      body: Center(
        child: Column(

          children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MapScreen()));
          }, child: Text("Simple Map")),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CurrentLocation()));
          }, child: Text("Current Location")),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CurrentLocation()));
          }, child: Text("Search location")),

        ],),
      ),
    );
  }
}
