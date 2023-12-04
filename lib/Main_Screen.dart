
// ignore_for_file: deprecated_member_use, camel_case_types, duplicate_ignore

import 'package:find_my_phon/Controller_Page/widget_controller/controller.dart';
import 'package:find_my_phon/Media_qury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'Controller_Page/My_Controller.dart';

class Main_Screen extends StatefulWidget {
  const Main_Screen({Key? key}) : super(key: key);

  @override
  State<Main_Screen> createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
  MyAppController myAppController = Get.put(MyAppController());

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);
    return Scaffold(
      backgroundColor: const Color(0xffFAF4F0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
              child: Image(
            image: const AssetImage('asset/image/Logo/logo.png'),
            height: ScreenSize.horizontalBlockSize! * 38,
          )),
          SizedBox(height: ScreenSize.horizontalBlockSize! * 45),
          controllerTEXT.getText("Find My Lost Phone",
              ScreenSize.horizontalBlockSize! * 8.5, FontWeight.w700),
          SizedBox(height: ScreenSize.horizontalBlockSize! * 10),
          Padding(
            padding:
                EdgeInsets.only(left: ScreenSize.horizontalBlockSize! * 15),
            child: LinearPercentIndicator(
              width: ScreenSize.horizontalBlockSize! * 67,
              animation: true,
              lineHeight: ScreenSize.fSize_4(),
              animationDuration: 2000,
              percent: 1,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: const Color(0xff3A1808),
              barRadius: const Radius.circular(10),
            ),
          ),
          SizedBox(height: ScreenSize.horizontalBlockSize! * 15),
        ],
      ),
    );
  }
}
