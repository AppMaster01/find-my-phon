// ignore_for_file: deprecated_member_use, invalid_use_of_protected_member, sized_box_for_whitespace, camel_case_types, prefer_final_fields, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:find_my_phon/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:find_my_phon/Controller_Page/widget_controller/controller.dart';
import 'package:find_my_phon/ads/Google_Ads.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller_Page/Button_controller/Main_Controller.dart';
import '../../Media_qury.dart';
import 'DEB_HELPER.dart';

class state extends StatefulWidget {
  const state({Key? key}) : super(key: key);

  @override
  State<state> createState() => _stateState();
}

class _stateState extends State<state> {
  var _isAlwaysShown = true.obs;
  Rx<Dbhelp> STATE = Dbhelp().obs;

  loadData() {
    STATE.value.initdb();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    DISTRICT();
  }

  List<String> myList = [];
  var result;
  var abc = Get.arguments;
  var list = [].obs;

  DISTRICT() {
    for (int i = 0; i < data2.value.length; i++) {
      data2.value[i]['state_id'] == abc[2]
          ? list.add(data2.value[i]['district'])
          : null;
    }
    list.value = list.value.toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFAF4F0),
        appBar: controllerAppbar.getappbar('${abc[0]} (${abc[1]})', () {
          backbuttoncontroller.showBackbuttonad(context, '/state', '');
        }),
        body: Stack(
          children: [
            Obx(
              () => data2.value.isEmpty
                  ? const Center(
                      child:
                          CircularProgressIndicator(color: Color(0xff3A1808)))
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
                                itemCount: list.value.length,
                                padding: const EdgeInsets.all(5),
                                itemBuilder: (context, indexs) {
                                  return Padding(
                                    padding: const EdgeInsets.all(7),
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.showbuttonad(
                                            context, '/City', '/Country', [
                                          data2.value[indexs]['district'],
                                          indexs,
                                          list.value[indexs],
                                          abc[0]
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
                                                      list.value[indexs]
                                                          .toString(),
                                                      style: GoogleFonts.anekTamil(
                                                          color: const Color(
                                                              0xff000000),
                                                          fontSize: ScreenSize
                                                              .fSize_15(),
                                                          fontWeight:
                                                              FontWeight.w500)),
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
                            ),
                          ),
                          SizedBox(
                              height: ScreenSize.horizontalBlockSize! * 15),
                        ],
                      ),
                    ),
            ),
            banner.getBN('/state')
          ],
        ));
  }
}
