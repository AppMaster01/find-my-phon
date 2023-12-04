// ignore_for_file: unused_local_variable, camel_case_types, override_on_non_overriding_member, sized_box_for_whitespace, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_unnecessary_containers

import 'package:find_my_phon/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:find_my_phon/Controller_Page/widget_controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Media_qury.dart';
import '../Save_Location/Saved_Location.dart';

class Address_Finder extends StatefulWidget {
  const Address_Finder({Key? key}) : super(key: key);

  @override
  State<Address_Finder> createState() => _Address_FinderState();
}

class _Address_FinderState extends State<Address_Finder> {
  DateTime now = DateTime.now();
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
  double lat = 21.232039147800414;
  double lon = 72.92355172026163;
  var map;
  var map1;
  var map2;
  var map3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getvalue();
  }

  getvalue() async {
    var prefs = await SharedPreferences.getInstance();
    map = prefs.getString('map');
    map1 = prefs.getString('map1');
    map2 = prefs.getString('map2');
    map3 = prefs.getString('map3');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAF4F0),
      appBar: controllerAppbar.getappbar('Google Map', () {
        backbuttoncontroller.showBackbuttonad(context, '/Address_Finder', '');
      }),
      body: Obx(
        () => Stack(
          children: [
            GoogleMap(
              initialCameraPosition: const CameraPosition(
                  target: LatLng(21.22510259538191, 72.80740470354588),
                  zoom: 12.6),
              onMapCreated: onMapCreated,
              compassEnabled: true,
              buildingsEnabled: true,
              indoorViewEnabled: true,
              mapToolbarEnabled: true,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              trafficEnabled: true,
              tiltGesturesEnabled: true,
              scrollGesturesEnabled: true,
              rotateGesturesEnabled: true,
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
                            "${DateFormat.EEEE().format(now)} ${DateFormat.d().format(now)}-${DateFormat.yMMMM().format(now)}",
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
                              child: Text(
                                """Silverstone Arcade, Causeway Rd, River Park Society, Singanpor, Surat, Gujarat 395004, India""",
                                style: GoogleFonts.anekTamil(
                                    color: const Color(0xff3A1808),
                                    fontSize:
                                        ScreenSize.horizontalBlockSize! * 4.5,
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
                        COUNTER.value++;
                        index.add(COUNTER.value);
                        var prefs = await SharedPreferences.getInstance();
                        Clipboard.setData(const ClipboardData(
                            text:
                                'Silverstone Arcade, Causeway Rd, River Park Society, Singanpor, Surat, Gujarat 395004, India'));
                        Fluttertoast.showToast(
                          msg: "Copy Address",
                          toastLength: Toast.LENGTH_SHORT,
                          textColor: const Color(0xFFFAF4F0),
                          fontSize: ScreenSize.fSize_15(),
                          gravity: ToastGravity.CENTER,
                          backgroundColor: const Color(0xFF3A1808),
                        );
                      },
                      child: Container(
                        width: ScreenSize.horizontalBlockSize! * 39,
                        height: ScreenSize.horizontalBlockSize! * 11,
                        decoration: BoxDecoration(
                            color: const Color(0xffFAF4F0),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0xffA2866F),
                                  blurRadius: 2,
                                  offset: Offset(0, 2))
                            ],
                            border: Border.all(color: const Color(0xffA2866F))),
                        child: Center(
                            child: controllerTEXT.getText('Copy Address',
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
                      color: const Color(0xffFBDECA),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black38,
                            blurRadius: 2,
                            offset: Offset(0, 3))
                      ],
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xffFBDECA), Color(0xffFEEDC4)]),
                      image: DecorationImage(
                          scale: ScreenSize.horizontalBlockSize! * 0.5,
                          image:
                              const AssetImage('asset/image/Icons/stack.png'))),
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
                      decoration: const BoxDecoration(
                        color: Color(0xffFBDECA),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xffFBDECA), Color(0xffFEEDC4)]),
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
