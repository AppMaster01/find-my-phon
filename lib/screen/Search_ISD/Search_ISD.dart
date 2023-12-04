// ignore_for_file: deprecated_member_use, camel_case_types, prefer_final_fields, non_constant_identifier_names, invalid_use_of_protected_member, avoid_function_literals_in_foreach_calls, sized_box_for_whitespace

import 'dart:convert';

import 'package:find_my_phon/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:find_my_phon/Controller_Page/widget_controller/controller.dart';
import 'package:find_my_phon/Media_qury.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ads/Google_Ads.dart';
class Search_ISD extends StatefulWidget {
  const Search_ISD({Key? key}) : super(key: key);

  @override
  State<Search_ISD> createState() => _Search_ISDState();
}

class _Search_ISDState extends State<Search_ISD> {
  var _isAlwaysShown = true.obs;

  var fullData = [].obs;
  var searchData = [].obs;
  var ISDcontroller = TextEditingController().obs;

  @override
  initState() {
    super.initState();
    getLocalJsonData();
  }

  getLocalJson() {
    return rootBundle.loadString('asset/ISD-Code.json'); // Read your local Data
  }

  Future getLocalJsonData() async {
    final response = json.decode(await getLocalJson());
    var tempList = [].obs;
    for (var i in response['name']) {
      tempList.value.add(i);
    }

    fullData.value = tempList.value;
  }

  onSearchTextChanged(String text) async {
    searchData.value.clear();
    if (text.isEmpty) {
      return;
    }

    fullData.value.forEach((data) {
      if (data['name']
          .toString()
          .toLowerCase()
          .contains(text.toLowerCase().toString())) {
        searchData.value.add(data);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xffFAF4F0),
      appBar: controllerAppbar.getappbar('Search ISD Code', () {
        backbuttoncontroller.showBackbuttonad(context, '/Search_STD', '');
      }),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: ScreenSize.fSize_40()),
            child: Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Obx(
                  () =>  Column(
                    children: [
                      fullData.value.isNotEmpty
                          ? searchData.value.isEmpty
                              ? Expanded(
                                  child: CupertinoScrollbar(
                                    isAlwaysShown: _isAlwaysShown.value,
                                    radius: const Radius.circular(20),
                                    child: ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: fullData.value.length,
                                      padding: const EdgeInsets.all(5),
                                      itemBuilder: (context, indexs) {
                                        return Padding(
                                          padding: const EdgeInsets.all(7),
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
                                                  children: [
                                                    SizedBox(
                                                        width: ScreenSize.fSize_15()),
                                                    Container(
                                                      width: ScreenSize
                                                          .horizontalBlockSize! *
                                                          14,
                                                      child: Text(
                                                        '${fullData.value[indexs]['dial_code']}',
                                                        style: GoogleFonts.anekTamil(
                                                            color: Colors.black,
                                                            fontSize:
                                                            ScreenSize.fSize_16(),
                                                            fontWeight:
                                                            FontWeight.w500),
                                                      ),
                                                    ),
                                                    Container(
                                                        height: ScreenSize.fSize_25(),
                                                        color: const Color(0xffE2D6D1),
                                                        width: ScreenSize
                                                            .horizontalBlockSize! *
                                                            0.4),
                                                    SizedBox(
                                                        width: ScreenSize.fSize_20()),
                                                    Container(
                                                      // color: Colors.black12,
                                                      width: ScreenSize
                                                          .horizontalBlockSize! *
                                                          50,
                                                      child: Text(
                                                        '${fullData.value[indexs]['name']}',
                                                        style: GoogleFonts.anekTamil(
                                                            color: Colors.black,
                                                            fontSize:
                                                            ScreenSize.fSize_16(),
                                                            fontWeight:
                                                            FontWeight.w500),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                    height: ScreenSize
                                                        .horizontalBlockSize! *
                                                        3),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: searchData.value.length,
                                  padding: const EdgeInsets.all(5),
                                  itemBuilder: (context, indexs) {
                                    return Padding(
                                      padding: const EdgeInsets.all(7),
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
                                              children: [
                                                SizedBox(
                                                    width: ScreenSize.fSize_15()),
                                                Container(
                                                  width: ScreenSize
                                                          .horizontalBlockSize! *
                                                      14,
                                                  child: Text(
                                                    '${searchData.value[indexs]['dial_code']}',
                                                    style: GoogleFonts.anekTamil(
                                                        color: Colors.black,
                                                        fontSize:
                                                            ScreenSize.fSize_16(),
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                Container(
                                                    height: ScreenSize.fSize_25(),
                                                    color: const Color(0xffE2D6D1),
                                                    width: ScreenSize
                                                            .horizontalBlockSize! *
                                                        0.4),
                                                SizedBox(
                                                    width: ScreenSize.fSize_20()),
                                                Container(
                                                  // color: Colors.black12,
                                                  width: ScreenSize
                                                          .horizontalBlockSize! *
                                                      57,
                                                  child: Text(
                                                    '${searchData.value[indexs]['name']}',
                                                    style: GoogleFonts.anekTamil(
                                                        color: Colors.black,
                                                        fontSize:
                                                            ScreenSize.fSize_16(),
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                                height: ScreenSize
                                                        .horizontalBlockSize! *
                                                    3),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )
                          : Padding(
                              padding: EdgeInsets.only(
                                  left: ScreenSize.horizontalBlockSize! * 40,
                                  top: ScreenSize.horizontalBlockSize! * 70),
                              child: const Text("Loading...")),
                      SizedBox(height: ScreenSize.fSize_50()),
                    ],
                  ),
                ),
              ),
            ),
          ),
          controllertextfiled.gettextfiled(
              'Search ISD Code', ISDcontroller.value, onSearchTextChanged),
          banner.getBN('/Search_STD')
        ],
      ),
    );
  }
}
