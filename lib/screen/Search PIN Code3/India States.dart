// ignore_for_file: unused_field, non_constant_identifier_names, unrelated_type_equality_checks, invalid_use_of_protected_member, sized_box_for_whitespace, prefer_final_fields

import 'package:find_my_phon/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:find_my_phon/Controller_Page/widget_controller/controller.dart';
import 'package:find_my_phon/ads/Google_Ads.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller_Page/Button_controller/Main_Controller.dart';
import '../../Media_qury.dart';
import 'DEB_HELPER.dart';

class Country extends StatefulWidget {
  const Country({Key? key}) : super(key: key);

  @override
  State<Country> createState() => _CountryState();
}

class _CountryState extends State<Country> {
  var _isAlwaysShown = true.obs;

  Rx<Dbhelp> STATE = Dbhelp().obs;

//
  loadData() {
    STATE.value.initdb();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  int index = 0;
  var list = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36
  ].obs;

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);
    return Scaffold(
        backgroundColor: const Color(0xffFAF4F0),
        appBar: controllerAppbar.getappbar('India States', () {
          backbuttoncontroller.showBackbuttonad(context, '/Country', '');
        }),
        body: Stack(
          children: [
            Obx(
              () => data.value != ""
                  ? SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data.value.length,
                            padding: const EdgeInsets.all(5),
                            itemBuilder: (context, indexs) {
                              return Padding(
                                padding: const EdgeInsets.all(7),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.showbuttonad(
                                        context, '/state', '/Country', [
                                      data.value[indexs]['name'],
                                      data.value[indexs]['short_name'],
                                      indexs + 1,
                                      list.value[indexs]
                                    ]);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: const Color(0xff3A1808),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                            height: ScreenSize
                                                    .horizontalBlockSize! *
                                                3),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              // color: Colors.black12,
                                              width: ScreenSize
                                                      .horizontalBlockSize! *
                                                  67,
                                              child: Text(
                                                '${data.value[indexs]['name']}  (${data.value[indexs]['short_name']})',
                                                style: GoogleFonts.anekTamil(
                                                    color: const Color(0xff000000),
                                                    fontSize:
                                                        ScreenSize.fSize_15(),
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            SizedBox(
                                                width: ScreenSize
                                                        .horizontalBlockSize! *
                                                    9),
                                            controllerImage.getImage(
                                                "asset/image/Icons/Arrow - Right.png",
                                                ScreenSize.fSize_25())
                                          ],
                                        ),
                                        SizedBox(
                                            height: ScreenSize
                                                    .horizontalBlockSize! *
                                                3),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: ScreenSize.fSize_80()),
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                      color: Color(0xff3A1808),
                    )),
            ),
            banner.getBN('/Country')
          ],
        ));
  }
}
