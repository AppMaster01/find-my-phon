// ignore_for_file: deprecated_member_use, invalid_use_of_protected_member, unnecessary_string_interpolations, sized_box_for_whitespace, non_constant_identifier_names, camel_case_types, annotate_overrides

import 'package:find_my_phon/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:find_my_phon/Controller_Page/widget_controller/controller.dart';
import 'package:find_my_phon/Media_qury.dart';
import 'package:find_my_phon/ads/Google_Ads.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../inapp_web_view/save_location.dart';

var COUNTER = 0.obs;
var index = [].obs;
var now = DateTime.now().obs;

class Saved_Location extends StatefulWidget {
  const Saved_Location({Key? key}) : super(key: key);

  @override
  State<Saved_Location> createState() => _Saved_LocationState();
}

class _Saved_LocationState extends State<Saved_Location> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getvalue();
  }

  getvalue() async {
    var prefs = await SharedPreferences.getInstance();
    var getname = prefs.getStringList('addres').obs;
    Addres.value = getname.value!;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFAF4F0),
        appBar: controllerAppbar.getappbar('Saved Location', () {
          backbuttoncontroller.showBackbuttonad(context, '/Save_Location', '');
        }),
        body: Obx(
          () => Stack(
            children: [
              Addres.value.length > 1
                  ? SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Obx(
                        () => Column(
                          children: [
                            ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: Addres.value.length,
                              itemBuilder: (context, indexs) {
                                return indexs != 0
                                    ? Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: GestureDetector(
                                          onTap: () {
                                            launchATMUrl(
                                                '${Addres.value[indexs]}');
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            decoration: const BoxDecoration(
                                              color: Color(0xffFBDECA),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(22)),
                                              gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Color(0xffFBDECA),
                                                    Color(0xffFEEDC4)
                                                  ]),
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                    height:
                                                        ScreenSize.fSize_17()),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                        width: ScreenSize
                                                            .fSize_20()),
                                                    controllerCircle.getcircle(
                                                        context,
                                                        ScreenSize
                                                                .horizontalBlockSize! *
                                                            6,
                                                        'asset/image/Icons/MapPin.png'),
                                                    SizedBox(
                                                        width: ScreenSize
                                                            .fSize_16()),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: ScreenSize
                                                                  .horizontalBlockSize! *
                                                              65,
                                                          child: Text(
                                                            "${Addres.value[indexs]}",
                                                            // '${index}',
                                                            style: GoogleFonts.anekTamil(
                                                                color: const Color(
                                                                    0xff3A1808),
                                                                fontSize: ScreenSize
                                                                        .horizontalBlockSize! *
                                                                    4.2,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height: ScreenSize
                                                                .fSize_6()),
                                                        controllerDISCRIPTEXT
                                                            .getText(
                                                                "${DateFormat.EEEE().format(now.value)} ${DateFormat.d().format(now.value)}-${DateFormat.yMMMM().format(now.value)}",
                                                                ScreenSize
                                                                    .fSize_12()),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                    height:
                                                        ScreenSize.fSize_17()),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container();
                              },
                            ),
                            SizedBox(height: ScreenSize.fSize_80()),
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          controllerImage.getImage(
                              'asset/image/Icons/Location vector.png',
                              ScreenSize.horizontalBlockSize! * 25),
                          controllerTEXT.getText(
                              'No Location Saved',
                              ScreenSize.horizontalBlockSize! * 5,
                              FontWeight.w500)
                        ],
                      ),
                    ),
              banner.getBN('/Saved_Location')
            ],
          ),
        ));
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
