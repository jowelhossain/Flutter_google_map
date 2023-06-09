import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  void addCustomIcon(){

    BitmapDescriptor.fromAssetImage(ImageConfiguration(size:Size(2, 2),), "images/Marker_icon.png",).then((icon){
     setState(() {
       markerIcon= icon;
     });

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    addCustomIcon();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: Text("Google Map"), centerTitle: true,),

    body: Container(
      child: GoogleMap(
          initialCameraPosition: CameraPosition(

        target: LatLng(23.8103,90.4125),
            zoom: 5.222,

      ),
        markers: {

            Marker(markerId:MarkerId("Dhaka"),
              position: LatLng(23.8103, 90.4125),
              draggable: true,
              onDragEnd: (value){

              },
              //icon: markerIcon,
              infoWindow: InfoWindow(
                title: "Dhaka"
              )

            )
        }

      ),
    )
    );
  }
}
