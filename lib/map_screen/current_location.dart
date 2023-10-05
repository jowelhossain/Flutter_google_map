
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class CurrentLocation extends StatefulWidget {
  const CurrentLocation({super.key});

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {

  late GoogleMapController googleMapController;
  static const CameraPosition initialCameraPosition= CameraPosition(target: LatLng(23.80, 90.41),zoom: 14);

  Set<Marker> markers={};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Current Location"),),

    body:GoogleMap(initialCameraPosition: initialCameraPosition,
    markers: markers,
      mapType: MapType.normal,
      onMapCreated: (GoogleMapController controller){

      googleMapController=controller;
      },
    ),
      
      floatingActionButton: FloatingActionButton.extended(onPressed: () async{


        Position position =await _determinePosition();
        
        googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude, position.longitude),zoom: 14)));

        markers.clear();
        markers.add(Marker(markerId:MarkerId("Current Location"),position: LatLng(position.latitude, position.longitude)));

        setState(() {

        });
      },
        label: Text("Current Location"),icon: Icon(Icons.my_location),),
floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );

  }

  Future<Position> _determinePosition() async{

  bool serviceEnabled;

  LocationPermission permission;

  serviceEnabled= await Geolocator.isLocationServiceEnabled();

  if(!serviceEnabled){
    return Future.error("Location Service disabled");
  }
   permission = await Geolocator.checkPermission();

  if(permission==LocationPermission.denied){

    permission= await Geolocator.requestPermission();

    if(permission==LocationPermission.denied){

      return Future.error("Location Permission Denied");
    }
  }

  if(permission==LocationPermission.deniedForever){
    return Future.error("Location Permission Permission denied permanently");
  }

  Position position= await Geolocator.getCurrentPosition();
  return position;



  }

}
