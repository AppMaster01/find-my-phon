// ignore_for_file: deprecated_member_use, invalid_use_of_protected_member, sized_box_for_whitespace, prefer_final_fields, non_constant_identifier_names

import 'package:find_my_phon/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:find_my_phon/Controller_Page/widget_controller/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller_Page/Button_controller/Main_Controller.dart';
import '../../Media_qury.dart';
import '../../ads/Google_Ads.dart';
import 'DEB_HELPER.dart';

class City extends StatefulWidget {
  const City({Key? key}) : super(key: key);

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  var _isAlwaysShown = true.obs;
  Rx<Dbhelp> STATE = Dbhelp().obs;

  loadData() {
    STATE.value.initdb();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    TALUKKO();
    loadData();
    PINCODE();
  }

  var abc = Get.arguments;

  var taluko = [].obs;

  TALUKKO() {
    for (int i = 0; i < data2.value.length; i++) {
      data2.value[i]['district'] == abc[2]
          ? taluko.value.add(data2.value[i]['taluk'])
          : null;
    }
    taluko.value = taluko.value.toSet().toList();
  }

  var pincode = [].obs;

  PINCODE() {
    // print('WWWWWWWWWWWWWW${data2.value.length}');
    for (int i = 0; i < data2.value.length; i++) {
      // print('KKKKKKKKKK${i}');
      data2.value[i]['pincode'] == data2.value[i]['pincode']
          ? pincode.value.add(data2.value[i]['pincode'])
          : null;
    }
    pincode.value = pincode.value.toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAF4F0),
      appBar: controllerAppbar.getappbar(abc[2].toString(), () {
        backbuttoncontroller.showBackbuttonad(context, '/City', '');
      }),
      body: Stack(
        children: [
          Obx(
            () => data2.value.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Center(
                          child: CupertinoScrollbar(
                            isAlwaysShown: _isAlwaysShown.value,
                            radius: const Radius.circular(20),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: taluko.value.length,
                              padding: const EdgeInsets.all(5),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(7),
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.showbuttonad(
                                          context,
                                          '/Details'
                                              '',
                                          '/Search_ISD',
                                          [
                                            pincode.value[index],
                                            taluko.value[index],
                                            abc[2],
                                            abc[3]
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
                                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                  width: ScreenSize.fSize_15()),
                                              Container(
                                                width: ScreenSize
                                                        .horizontalBlockSize! *
                                                    15,
                                                child: Text(
                                                  '${pincode.value[index]}',
                                                  style: GoogleFonts.anekTamil(
                                                      color: Colors.black,
                                                      fontSize:
                                                          ScreenSize.fSize_16(),
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              SizedBox(
                                                  width: ScreenSize.fSize_8()),
                                              Container(
                                                  height: ScreenSize.fSize_25(),
                                                  color: const Color(0xffE2D6D1),
                                                  width: ScreenSize
                                                          .horizontalBlockSize! *
                                                      0.4),
                                              SizedBox(
                                                  width: ScreenSize.fSize_15()),
                                              Container(
                                                // color: Colors.black12,
                                                width: ScreenSize
                                                        .horizontalBlockSize! *
                                                    48,
                                                child: Text(
                                                  taluko.value[index]
                                                      .toString(),
                                                  style: GoogleFonts.anekTamil(
                                                      color: Colors.black,
                                                      fontSize:
                                                          ScreenSize.fSize_16(),
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              SizedBox(
                                                  width: ScreenSize.fSize_30()),
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
                          ),
                        ),
                        SizedBox(height: ScreenSize.horizontalBlockSize! * 20),
                      ],
                    ),
                  ),
          ),
          banner.getBN('/City')
        ],
      ),
    );
  }
}
