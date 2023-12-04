// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables, unnecessary_string_interpolations, unrelated_type_equality_checks

import 'package:find_my_phon/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:find_my_phon/Controller_Page/widget_controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';

import '../../Media_qury.dart';
import '../../ads/Google_Ads.dart';

class Location_Information extends StatefulWidget {
  const Location_Information({Key? key}) : super(key: key);

  @override
  State<Location_Information> createState() => _Location_InformationState();
}

class _Location_InformationState extends State<Location_Information> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentPosition();
  }

  var City = "".obs;
  var State = "".obs;
  var Country = "".obs;
  var currentAddress = "".obs;
  var log = "".obs;
  var lat = "".obs;
  Position? currentPosition;

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
      log.value = currentPosition!.longitude.toString();
      lat.value = currentPosition!.latitude.toString();
      City.value = '${place.locality}';
      State.value = '${place.administrativeArea}';
      Country.value = '${place.country}';
      currentAddress.value = '${place.name}, ${place.subLocality}';
    }).catchError((e) {
      debugPrint(e);
    });
  }

  var map;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAF4F0),
      appBar: controllerAppbar.getappbar('Location Information', () {
        backbuttoncontroller.showBackbuttonad(context, '/Save_Location', '');
      }),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Obx(
              () => Column(
                children: [
                  Container(
                    height: ScreenSize.horizontalBlockSize! * 60,
                    width: double.maxFinite,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: ScreenSize.fSize_15()),
                        controllerhedline.getImage("Current GPS Location"),
                        SizedBox(height: ScreenSize.horizontalBlockSize! * 6.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: ScreenSize.horizontalBlockSize! * 36,
                              width: ScreenSize.horizontalBlockSize! * 46,
                              decoration: const BoxDecoration(
                                color: Color(0xffFBDECA),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xffFBDECA),
                                      Color(0xffFEEDC4)
                                    ]),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: ScreenSize.fSize_18()),
                                  Row(
                                    children: [
                                      SizedBox(width: ScreenSize.fSize_12()),
                                      Container(
                                        width: ScreenSize.horizontalBlockSize! *
                                            11,
                                        height:
                                            ScreenSize.horizontalBlockSize! *
                                                11,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            border: Border.all(
                                                color: const Color(0xff3A1808),
                                                width: 1)),
                                        child: Center(
                                            child: controllerImage.getImage(
                                                'asset/image/Icons/Latitude.png',
                                                ScreenSize.fSize_23())),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: ScreenSize.fSize_10()),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: ScreenSize.fSize_12()),
                                      child: controllerTEXT.getText(
                                          'Latitude',
                                          ScreenSize.fSize_20(),
                                          FontWeight.w500)),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: ScreenSize.fSize_12()),
                                    child: controllerDISCRIPTEXT.getText(
                                        '${lat.value == "" ? "Loading..." : lat.value}',
                                        ScreenSize.fSize_12()),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: ScreenSize.horizontalBlockSize! * 36,
                              width: ScreenSize.horizontalBlockSize! * 46,
                              decoration: const BoxDecoration(
                                color: Color(0xffFBDECA),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xffFBDECA),
                                      Color(0xffFEEDC4)
                                    ]),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: ScreenSize.fSize_18()),
                                  Row(
                                    children: [
                                      SizedBox(width: ScreenSize.fSize_12()),
                                      Container(
                                        width: ScreenSize.horizontalBlockSize! *
                                            11,
                                        height:
                                            ScreenSize.horizontalBlockSize! *
                                                11,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            border: Border.all(
                                                color: const Color(0xff3A1808),
                                                width: 1)),
                                        child: Center(
                                            child: controllerImage.getImage(
                                                'asset/image/Icons/Longitude.png',
                                                ScreenSize.fSize_23())),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: ScreenSize.fSize_10()),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: ScreenSize.fSize_12()),
                                      child: controllerTEXT.getText(
                                          'Longitude',
                                          ScreenSize.fSize_20(),
                                          FontWeight.w500)),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: ScreenSize.fSize_12()),
                                    child: controllerDISCRIPTEXT.getText(
                                        '${log == "" ? "Loading..." : log.value}',
                                        ScreenSize.fSize_12()),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenSize.fSize_20()),
                  controllerhedline.getImage("Current Postal Address"),
                  SizedBox(height: ScreenSize.fSize_10()),
                  controllerimagecontainer.getimage(
                      context,
                      () {},
                      'asset/image/Icons/location.png',
                      'Current City',
                      """${City.value == "" ? "Loading..." : City.value}"""),
                  controllerimagecontainer.getimage(
                      context,
                      () {},
                      'asset/image/Icons/location.png',
                      'Current State',
                      """${State.value == "" ? "Loading..." : State.value}"""),
                  controllerimagecontainer.getimage(
                      context,
                      () {},
                      'asset/image/Icons/location.png',
                      'Current Country',
                      """${Country.value == "" ? "Loading..." : Country.value}"""),
                  SizedBox(height: ScreenSize.fSize_25()),
                  controllercontainer.getcontainer(context, () async {
                    final availableMaps = await MapLauncher.installedMaps;
                    await availableMaps.first.showMarker(
                        coords: Coords(currentPosition!.latitude,
                            currentPosition!.longitude),
                        title: currentAddress.value.toString(),
                        zoom: 18);
                  },
                      Center(
                        child: controllerTEXT.getText('View Location',
                            ScreenSize.fSize_15(), FontWeight.w500),
                      )),
                  SizedBox(height: ScreenSize.fSize_120()),
                ],
              ),
            ),
          ),
          banner.getBN('/Location_Information')
        ],
      ),
    );
  }
}
