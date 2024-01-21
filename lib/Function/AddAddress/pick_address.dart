import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:sharejoy/Constants/constatnts.dart';
import 'package:sizer/sizer.dart';

class PickAddressScreen extends StatefulWidget {
  const PickAddressScreen({super.key});

  @override
  State<PickAddressScreen> createState() => _PickAddressScreenState();
}

class _PickAddressScreenState extends State<PickAddressScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  // double mapWidth = MediaQuery.of(context).size.width;
  // double mapHeight = MediaQuery.of(context).size.height - 215;
  double iconSize = 45.sp;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Constants.backgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: GoogleMap(
                indoorViewEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  setPosition();
                },
              ),
            ),
            Positioned(
              top: (MediaQuery.of(context).size.height - 100 - iconSize) / 2,
              right: (MediaQuery.of(context).size.width - iconSize) / 2,
              child: Icon(
                Icons.person_pin_circle,
                size: iconSize,
                color: Constants.primaryColor,
              ),
            ),
            Positioned(
              top: 45,
              right: 10,
              // right: (MediaQuery.of(context).size.width - iconSize) / 2,
              child: SizedBox(
                width: 95.w,
                // height: 15.h,
                child: GooglePlaceAutoCompleteTextField(
                  textEditingController: controller,
                  googleAPIKey: "YOUR_GOOGLE_API_KEY",
                  inputDecoration: InputDecoration(),
                  debounceTime: 800,
                  // default 600 ms,
                  countries: ["in"],
                  // optional by default null is set
                  isLatLngRequired: true,
                  // if you required coordinates from place detail
                  getPlaceDetailWithLatLng: (Prediction prediction) {
                    // this method will return latlng with place detail
                    print("placeDetails" + prediction.lng.toString());
                  },
                  // this callback is called when isLatLngRequired is true
                  itemClick: (Prediction prediction) {
                    controller.text = prediction.description!;
                    controller.selection = TextSelection.fromPosition(
                      TextPosition(
                        offset: prediction.description?.length ?? 0,
                      ),
                    );
                  },
                  // if we want to make custom list item builder
                  itemBuilder: (context, index, Prediction prediction) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(Icons.location_on),
                          SizedBox(
                            width: 7,
                          ),
                          Expanded(
                              child: Text("${prediction.description ?? ""}"))
                        ],
                      ),
                    );
                  },
                  // if you want to add seperator between list items
                  seperatedBuilder: const Divider(),
                  // want to show close icon
                  isCrossBtnShown: true,
                  // optional container padding
                  containerHorizontalPadding: 10,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<String> fetchAddress(double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    return "${placemarks.first.name},${placemarks.first.administrativeArea},${placemarks.first.locality}";
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  void setPosition() async {
    final location = await _determinePosition();
    final GoogleMapController controller = await _controller.future;
    controller.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(location.latitude, location.longitude),
          zoom: 18,
        ),
      ),
    );
  }
}
