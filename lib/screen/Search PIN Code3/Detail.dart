// ignore_for_file: file_names, non_constant_identifier_names, invalid_use_of_protected_member

import 'package:find_my_phon/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:find_my_phon/Controller_Page/widget_controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Media_qury.dart';
import '../../ads/Google_Ads.dart';
import 'DEB_HELPER.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Rx<Dbhelp> STATE = Dbhelp().obs;

  loadData() {
    STATE.value.initdb();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    details();
  }

  var abc = Get.arguments;

  var DETAILS = [].obs;

  details() {
    for (int i = 0; i < data2.value.length; i++) {
      data2.value[i]['taluk'] == abc[1]
          ? DETAILS.value.add([
              data2.value[i]['related_sub'],
              data2.value[i]['related_head'],
              data2.value[i]['phone'],
              data2.value[i]['type'],
              data2.value[i]['is_delivery'],
            ])
          : null;
    }
    DETAILS.value = DETAILS.value.toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    int indexs = 0;
    return Scaffold(
      backgroundColor: const Color(0xffFAF4F0),
      appBar: controllerAppbar.getappbar('${abc[1]} -${abc[0]}', () {
        backbuttoncontroller.showBackbuttonad(context, '/Details', '');
      }),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                controllerblackcontain.getcontain(
                  Obx(
                    () => Column(
                      children: [
                        Hight.gethight(),
                        controllerTEXT.getText(
                            """Post Office ${abc[1]} Details""",
                            ScreenSize.fSize_20(),
                            FontWeight.w600),
                        SizedBox(
                          height: ScreenSize.horizontalBlockSize! * 8,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: ScreenSize.horizontalBlockSize! * 5,
                            ),
                            controllerDISCRIPTEXT2.getText('Pin Code :'),
                            Width2.getwidth(),
                            controllercolortext.getText("${abc[0]}")
                          ],
                        ),
                        H.gethight(),
                        controllerdivider.getdivider(),
                        Row(
                          children: [
                            SizedBox(
                              width: ScreenSize.horizontalBlockSize! * 5,
                            ),
                            controllerDISCRIPTEXT2.getText(
                              'Name :',
                            ),
                            Width2.getwidth(),
                            controllercolortext.getText("${abc[1]}")
                          ],
                        ),
                        H.gethight(),
                        controllerdivider.getdivider(),
                        Row(
                          children: [
                            SizedBox(
                              width: ScreenSize.horizontalBlockSize! * 5,
                            ),
                            controllerDISCRIPTEXT2.getText(
                              'District :',
                            ),
                            Width2.getwidth(),
                            controllercolortext.getText("${abc[2]}")
                          ],
                        ),
                        H.gethight(),
                        controllerdivider.getdivider(),
                        Row(
                          children: [
                            SizedBox(
                              width: ScreenSize.horizontalBlockSize! * 5,
                            ),
                            controllerDISCRIPTEXT2.getText(
                              'State :',
                            ),
                            Width2.getwidth(),
                            controllercolortext.getText("${abc[3]}")
                          ],
                        ),
                        H.gethight(),
                        controllerdivider.getdivider(),
                        Row(
                          children: [
                            SizedBox(
                              width: ScreenSize.horizontalBlockSize! * 5,
                            ),
                            controllerDISCRIPTEXT2.getText(
                              'Office Type :',
                            ),
                            Width2.getwidth(),
                            controllerblackText2.getText(
                                "${DETAILS.value[indexs][3]}",
                                ScreenSize.fSize_16()),
                          ],
                        ),
                        H.gethight(),
                        controllerdivider.getdivider(),
                        H.gethight(),
                        Row(
                          children: [
                            SizedBox(
                              width: ScreenSize.horizontalBlockSize! * 5,
                            ),
                            controllerDISCRIPTEXT2.getText(
                              'Delivery Status :',
                            ),
                            Width2.getwidth(),
                            controllerblackText2.getText(
                                '${DETAILS.value[indexs][4]}',
                                ScreenSize.fSize_16()),
                          ],
                        ),
                        controllerdivider.getdivider(),
                        Row(
                          children: [
                            SizedBox(
                              width: ScreenSize.horizontalBlockSize! * 5,
                            ),
                            controllerDISCRIPTEXT2.getText(
                              'Division :',
                            ),
                            Width2.getwidth(),
                            controllerblackText2
                                .getText("""${abc[1]}""", ScreenSize.fSize_16())
                          ],
                        ),
                        H.gethight(),
                        controllerdivider.getdivider(),
                        Row(
                          children: [
                            SizedBox(
                              width: ScreenSize.horizontalBlockSize! * 5,
                            ),
                            controllerDISCRIPTEXT2.getText(
                              'Region :',
                            ),
                            Width2.getwidth(),
                            controllerblackText2
                                .getText("""${abc[1]}""", ScreenSize.fSize_16())
                          ],
                        ),
                        H.gethight(),
                        controllerdivider.getdivider(),
                        Row(
                          children: [
                            SizedBox(
                              width: ScreenSize.horizontalBlockSize! * 5,
                            ),
                            controllerDISCRIPTEXT2.getText(
                              'Circle :',
                            ),
                            Width2.getwidth(),
                            Center(
                              child: controllerblackText2.getText(
                                  '${abc[2]}', ScreenSize.fSize_16()),
                            )
                          ],
                        ),
                        H.gethight(),
                        controllerdivider.getdivider(),
                        Row(
                          children: [
                            SizedBox(
                              width: ScreenSize.horizontalBlockSize! * 5,
                            ),
                            controllerDISCRIPTEXT2.getText(
                              'Taluka :',
                            ),
                            Width2.getwidth(),
                            controllerblackText2.getText(
                                '${abc[1]}', ScreenSize.fSize_16()),
                          ],
                        ),
                        H.gethight(),
                        controllerdivider.getdivider(),
                        Row(
                          children: [
                            SizedBox(
                              width: ScreenSize.horizontalBlockSize! * 5,
                            ),
                            controllerDISCRIPTEXT2.getText(
                              'Telephone :',
                            ),
                            Width2.getwidth(),
                            controllercolortext
                                .getText("${DETAILS.value[indexs][2]}")
                          ],
                        ),
                        H.gethight(),
                        controllerdivider.getdivider(),
                        Row(
                          children: [
                            SizedBox(
                              width: ScreenSize.horizontalBlockSize! * 5,
                            ),
                            controllerDISCRIPTEXT2.getText(
                              'Head Office :',
                            ),
                            Width2.getwidth(),
                            controllerblackText2.getText(
                                '${DETAILS.value[indexs][1]}',
                                ScreenSize.fSize_16()),
                          ],
                        ),
                        H.gethight(),
                        controllerdivider.getdivider(),
                        Row(
                          children: [
                            SizedBox(
                              width: ScreenSize.horizontalBlockSize! * 5,
                            ),
                            controllerDISCRIPTEXT2.getText(
                              'Sub Office :',
                            ),
                            Width2.getwidth(),
                            controllerblackText2.getText(
                                '${DETAILS.value[indexs][0]}',
                                ScreenSize.fSize_16()),
                          ],
                        ),
                        SizedBox(
                          height: ScreenSize.horizontalBlockSize! * 8,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: ScreenSize.fSize_150()),
              ],
            ),
          ),
          banner.getBN('/Device_Information')
        ],
      ),
    );
  }
}
