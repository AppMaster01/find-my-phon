// ignore_for_file: deprecated_member_use, non_constant_identifier_names, prefer_typing_uninitialized_variables, camel_case_types, constant_identifier_names, invalid_use_of_protected_member, sized_box_for_whitespace, unnecessary_string_interpolations, avoid_unnecessary_containers, use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Controller_Page/Button_controller/Back_Butoon_controller.dart';
import '../../Controller_Page/widget_controller/controller.dart';
import '../../Media_qury.dart';

String CopyText = "https://www.cibil.com/";

RxList<String> namevalue = [""].obs;
RxList<String> adres = [""].obs;
RxList<String> date = [""].obs;
var getname;
var getname2;
var getname3;

class Find_Parking_Area extends StatefulWidget {
  const Find_Parking_Area({Key? key}) : super(key: key);

  @override
  State<Find_Parking_Area> createState() => _Find_Parking_AreaState();
}

class _Find_Parking_AreaState extends State<Find_Parking_Area> {
  var currentAddress = "".obs;
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
      currentAddress.value =
          '${place.name},${place.thoroughfare},${place.subLocality},${place.locality},${place.administrativeArea},${place.postalCode},${place.country}';
    }).catchError((e) {
      debugPrint(e);
    });
  }

  var counter = 0.obs;
  var TITLE = TextEditingController().obs;
  static const String KEYNAME = "name";
  static const String keyname = "NAME";
  static const String TIME = "time";

  getvalue() async {
    var prefs = await SharedPreferences.getInstance();
    getname = prefs.getStringList(KEYNAME);
    getname2 = prefs.getStringList(keyname);
    getname3 = prefs.getStringList(TIME);
    namevalue.value = getname;
    adres.value = getname2;
    date.value = getname3;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getvalue();
    _getCurrentPosition();
    currentAddress.value;
  }

  delete(int index) async {
    var prefs = await SharedPreferences.getInstance();
    namevalue.removeAt(index);
    adres.value.removeAt(index);
    date.value.removeAt(index);
    prefs.setStringList(KEYNAME, namevalue.value);
    prefs.setStringList(keyname, adres.value);
    prefs.setStringList(TIME, date.value);
  }

  delete1() async {
    var prefs = await SharedPreferences.getInstance();
    namevalue.value.clear();
    adres.value.clear();
    date.value.clear();
    prefs.setStringList(KEYNAME, namevalue.value);
    prefs.setStringList(keyname, adres.value);
    prefs.setStringList(TIME, date.value);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    TITLE.value.dispose();
  }

  int index = 0;
  late Timer countdownTimer;

  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) => abc());
  }

  abc() {
    timedate =
        '${DateTime.now().year}:${DateTime.now().month}:${DateTime.now().day}:${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}'
            .obs;
  }

  var timedate =
      '${DateTime.now().year}:${DateTime.now().month}:${DateTime.now().day}:${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}'
          .obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFAF4F0),
      appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              backbuttoncontroller.showBackbuttonad(
                  context, '/Find_Parking_Area', '');
            },
            child: Center(
                child: Image(
              image: const AssetImage('asset/image/Icons/back.png'),
              width: ScreenSize.fSize_30(),
            )),
          ),
          title: Text("Parking Locations",
              style: GoogleFonts.anekTamil(
                  color: const Color(0xff3A1808),
                  fontWeight: FontWeight.w500,
                  fontSize: ScreenSize.horizontalBlockSize! * 5.2)),
          actions: [
            Obx(() => GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Delet(context, () {
                        setState(() {
                          delete1();
                        });
                        Navigator.pop(context);
                      }),
                    );
                  },
                  child: Center(
                    child: Image(
                      image: const AssetImage("asset/image/Icons/Delete.png"),
                      height: ScreenSize.horizontalBlockSize! * 7,
                      color: namevalue.value.length > 1
                          ? const Color(0xff3A1808)
                          : Colors.transparent,
                    ),
                  ),
                )),
            SizedBox(width: ScreenSize.fSize_15()),
          ],
          backgroundColor: const Color(0xffFAF4F0),
          toolbarHeight: ScreenSize.fSize_80(),
          elevation: 0),
      body: Padding(
        padding: EdgeInsets.only(bottom: ScreenSize.fSize_20()),
        child: Obx(
          () => Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    namevalue.value.length > 1
                        ? Column(
                            children: [
                              Container(
                                height: ScreenSize.horizontalBlockSize! * 155,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: namevalue.value.length,
                                  itemBuilder: (context, indexs) {
                                    return indexs != 0
                                        ? controllerparking.gethight(
                                            "${namevalue.value[indexs]}",
                                            "${adres.value[indexs]}",
                                            '${date.value[indexs]}',
                                            () => launchATMUrl(
                                                "${currentAddress.value}"), () {
                                            Clipboard.setData(ClipboardData(
                                                text: currentAddress.value
                                                    .toString()));
                                            Fluttertoast.showToast(
                                              msg: "Copy Address",
                                              toastLength: Toast.LENGTH_LONG,
                                              timeInSecForIosWeb: 3,
                                              textColor:
                                                  const Color(0xffFAF4F0),
                                              gravity: ToastGravity.SNACKBAR,
                                              backgroundColor:
                                                  const Color(0xff523120),
                                              fontSize: 15,
                                            );
                                          }, () {
                                            Share.share(currentAddress.value
                                                .toString());
                                          }, () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  Delet(context, () {
                                                delete(indexs);
                                                Navigator.pop(context);
                                              }),
                                            );
                                          })
                                        : Container();
                                  },
                                ),
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height:
                                            ScreenSize.horizontalBlockSize! *
                                                50),
                                    Center(
                                      child: controllerImage.getImage(
                                          "asset/image/Icons/parking loction vector.png",
                                          ScreenSize.horizontalBlockSize! * 30),
                                    ),
                                    SizedBox(height: ScreenSize.fSize_6()),
                                    controllerTEXT.getText(
                                        "Parking List is Empty!",
                                        ScreenSize.fSize_20(),
                                        FontWeight.w500),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: ScreenSize.horizontalBlockSize! * 60),
                            ],
                          ),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: controllercontainer.getcontainer(context, () async {
                    showDialog(
                      context: context,
                      builder: (context) => location(
                          context, TITLE.value, () => Navigator.pop(context),
                          () async {
                        if (TITLE.value.text.isEmpty) {
                          Fluttertoast.showToast(
                            msg: "PLEASE ENTER TITLE",
                            toastLength: Toast.LENGTH_SHORT,
                            textColor: const Color(0xff3A1808),
                            fontSize: ScreenSize.fSize_15(),
                            gravity: ToastGravity.SNACKBAR,
                            backgroundColor: const Color(0xffFAF4F0),
                          );
                        } else if (TITLE.value.text.isNotEmpty) {
                          var prefs = await SharedPreferences.getInstance();
                          prefs.setStringList(KEYNAME, namevalue.value);
                          prefs.setStringList(keyname, adres.value);
                          prefs.setStringList(TIME, date.value);
                          namevalue.add(TITLE.value.text);
                          adres.value.add(currentAddress.value.toString());
                          date.value.add(timedate.value);
                          prefs.setStringList(KEYNAME, namevalue.value);
                          prefs.setStringList(keyname, adres.value);
                          prefs.setStringList(TIME, date.value);
                          startTimer();
                          Navigator.pop(context);
                        }
                      }, "${currentAddress.value}", "${timedate.value}"),
                    );
                    _getCurrentPosition();
                  },
                      Center(
                          child: controllerTEXT.getText("Add New Parking",
                              ScreenSize.fSize_18(), FontWeight.w500)))),
            ],
          ),
        ),
      ),
    );
  }

  launchATMUrl(String lat) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
