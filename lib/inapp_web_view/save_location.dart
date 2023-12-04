// ignore_for_file: camel_case_types, sized_box_for_whitespace, prefer_const_constructors, unused_local_variable, prefer_typing_uninitialized_variables, non_constant_identifier_names, unnecessary_string_interpolations, invalid_use_of_protected_member, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Controller_Page/Button_controller/Back_Butoon_controller.dart';
import '../Controller_Page/widget_controller/controller.dart';
import '../Media_qury.dart';

RxList<String> Addres = [""].obs;

class in_app_location extends StatefulWidget {
  const in_app_location({Key? key}) : super(key: key);

  @override
  State<in_app_location> createState() => _in_app_locationState();
}

class _in_app_locationState extends State<in_app_location> {
  var currentAddress = "".obs;
  Position? currentPosition;
  var CurrentAddres;
  var now = DateTime.now().obs;
  final _isVisible = false.obs;

  void showToast() {
    _isVisible.value = !_isVisible.value;
  }

  late GoogleMapController _controller;

  Future onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    String value =
        await DefaultAssetBundle.of(context).loadString('asset/map.json');
    _controller.setMapStyle(value);
  }

  Rx<MapType> currentMapType = MapType.normal.obs;
  var lat = 21.232039147800414.obs;
  var lon = 72.92355172026163.obs;

//================================================================

  Future<bool> _handleLocationPermission(context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission(context);

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
      _getAddressFromLatLng(currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            currentPosition!.latitude, currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      currentAddress.value =
          '${place.name}, ${place.thoroughfare}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}';
    }).catchError((e) {
      debugPrint(e);
    });
  }

  var map;
  var map1;
  var map2;
  var map3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getvalue();
    _getCurrentPosition();
  }

  getvalue() async {
    var prefs = await SharedPreferences.getInstance();
    CurrentAddres = prefs.getStringList('addres');
    map = prefs.getString('map');
    map1 = prefs.getString('map1');
    map2 = prefs.getString('map2');
    map3 = prefs.getString('map3');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF4F0),
      appBar: controllerAppbar.getappbar('Google Map', () {
        backbuttoncontroller.showBackbuttonad(
            context, '/In_App_Privacy', CurrentAddres);
      }),
      body: Obx(
        () => Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(19.018255973653343, 72.84793849278007)),
              // onMapCreated: onMapCreated,
              mapType: currentMapType.value,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: ScreenSize.fSize_10(), right: ScreenSize.fSize_10()),
              child: Container(
                width: double.infinity,
                height: ScreenSize.horizontalBlockSize! * 57,
                decoration: const BoxDecoration(
                  color: Color(0xffFBDECA),
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        blurRadius: 2,
                        offset: Offset(0, 3))
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xffFBDECA), Color(0xffFEEDC4)]),
                ),
                child: Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_28()),
                    Row(
                      children: [
                        SizedBox(width: ScreenSize.horizontalBlockSize! * 21.7),
                        controllerDISCRIPTEXT.getText(
                            "${DateFormat.EEEE().format(now.value)} ${DateFormat.d().format(now.value)}-${DateFormat.yMMMM().format(now.value)}",
                            ScreenSize.fSize_12()),
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_8()),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: ScreenSize.fSize_20()),
                        CircleAvatar(
                          minRadius: ScreenSize.horizontalBlockSize! * 5.8,
                          backgroundColor: Colors.white,
                          child: Center(
                            child: controllerImage.getImage(
                                'asset/image/Icons/location.png',
                                ScreenSize.fSize_25()),
                          ),
                        ),
                        SizedBox(width: ScreenSize.fSize_16()),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: ScreenSize.horizontalBlockSize! * 65,
                              child: currentAddress.value == ""
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          top: ScreenSize.fSize_20(),
                                          left: ScreenSize.fSize_50()),
                                      child: Text(
                                        'Loading...',
                                        style: GoogleFonts.anekTamil(
                                            color: const Color(0xff3A1808),
                                            fontSize: ScreenSize
                                                    .horizontalBlockSize! *
                                                4.5,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  : Text(
                                      '${currentAddress.value}',
                                      style: GoogleFonts.anekTamil(
                                          color: const Color(0xff3A1808),
                                          fontSize:
                                              ScreenSize.horizontalBlockSize! *
                                                  4.5,
                                          fontWeight: FontWeight.w500),
                                    ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_20()),
                    GestureDetector(
                      onTap: () async {
                        var prefs = await SharedPreferences.getInstance();
                        prefs.setStringList('addres', Addres.value);
                        Addres.value.add(currentAddress.value.toString());
                        prefs.setStringList('addres', Addres.value);
                        Fluttertoast.showToast(
                          msg: "Save Location",
                          toastLength: Toast.LENGTH_SHORT,
                          textColor: Color(0xFFFAF4F0),
                          fontSize: ScreenSize.fSize_15(),
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Color(0xFF3A1808),
                        );
                      },
                      child: Container(
                        width: ScreenSize.horizontalBlockSize! * 39,
                        height: ScreenSize.horizontalBlockSize! * 11,
                        decoration: BoxDecoration(
                            color: Color(0xffFAF4F0),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0xffA2866F),
                                  blurRadius: 2,
                                  offset: Offset(0, 2))
                            ],
                            border: Border.all(color: Color(0xffA2866F))),
                        child: Center(
                            child: controllerTEXT.getText('Save Location',
                                ScreenSize.fSize_16(), FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: ScreenSize.fSize_30(),
              bottom: ScreenSize.fSize_60(),
              child: GestureDetector(
                onTap: showToast,
                child: Container(
                  width: ScreenSize.fSize_60(),
                  height: ScreenSize.fSize_60(),
                  decoration: BoxDecoration(
                      color: Color(0xffFBDECA),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black38,
                            blurRadius: 2,
                            offset: Offset(0, 3))
                      ],
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: const [Color(0xffFBDECA), Color(0xffFEEDC4)]),
                      image: DecorationImage(
                          scale: ScreenSize.horizontalBlockSize! * 0.5,
                          image: AssetImage('asset/image/Icons/stack.png'))),
                ),
              ),
            ),
            Positioned(
              right: ScreenSize.fSize_23(),
              bottom: ScreenSize.fSize_130(),
              child: Container(
                child: Visibility(
                  visible: _isVisible.value,
                  child: Container(
                      width: ScreenSize.horizontalBlockSize! * 23,
                      height: ScreenSize.horizontalBlockSize! * 79,
                      decoration: BoxDecoration(
                        color: Color(0xffFBDECA),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: const [
                              Color(0xffFBDECA),
                              Color(0xffFEEDC4)
                            ]),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          controllercirclle.getavtar(() async {
                            var prefs = await SharedPreferences.getInstance();
                            prefs.setString(
                                'map',
                                (currentMapType.value = MapType.normal)
                                    .toString());
                          }, 'Default Map'),
                          controllercirclle.getavtar(() async {
                            var prefs = await SharedPreferences.getInstance();
                            prefs.setString(
                                'map1',
                                (currentMapType.value = MapType.satellite)
                                    .toString());
                          }, 'Satellite Map'),
                          controllercirclle.getavtar(() async {
                            var prefs = await SharedPreferences.getInstance();
                            prefs.setString(
                                'map2',
                                (currentMapType.value = MapType.terrain)
                                    .toString());
                          }, 'Terrain Map'),
                          controllercirclle.getavtar(() async {
                            var prefs = await SharedPreferences.getInstance();
                            prefs.setString(
                                'map3',
                                (currentMapType.value = MapType.hybrid)
                                    .toString());
                          }, 'Hybrid Map'),
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
