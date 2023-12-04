// ignore_for_file: camel_case_types

import 'package:find_my_phon/Controller_Page/widget_controller/controller.dart';
import 'package:find_my_phon/Media_qury.dart';
import 'package:find_my_phon/ads/Google_Ads.dart';
import 'package:flutter/material.dart';

import '../Controller_Page/Button_controller/Back_Butoon_controller.dart';
import '../Controller_Page/Button_controller/Main_Controller.dart';

class STD_ISD_PIN_Code extends StatefulWidget {
  const STD_ISD_PIN_Code({Key? key}) : super(key: key);

  @override
  State<STD_ISD_PIN_Code> createState() => _STD_ISD_PIN_CodeState();
}

class _STD_ISD_PIN_CodeState extends State<STD_ISD_PIN_Code> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAF4F0),
      appBar: controllerAppbar.getappbar('STD/ ISD/ PIN Code', () {
        backbuttoncontroller.showBackbuttonad(context, '/STD_ISD_PIN_Code', '');
      }),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                controllerimagecontainer.getimage(context, () {
                  controller.showbuttonad(
                      context, '/Search_STD', '/STD_ISD_PIN_Code', '');
                }, 'asset/image/Icons/STD code.png', 'Search STD Code',
                    'Find STD code for all state'),
                native.getNT(context, '/STD_ISD_PIN_Code', 'listTileMedium'),
                controllerimagecontainer.getimage(context, () {
                  controller.showbuttonad(
                      context, '/Search_ISD', '/STD_ISD_PIN_Code', '');
                }, 'asset/image/Icons/ISD code.png', 'Search ISD Code',
                    'Find ISD code for all countries'),
                controllerimagecontainer.getimage(context, () {
                  controller.showbuttonad(
                      context, '/Country', '/STD_ISD_PIN_Code', '');
                }, 'asset/image/Icons/code.png', 'Search PIN Code',
                    'Find PIN code for all village'),
                SizedBox(height: ScreenSize.fSize_80()),
              ],
            ),
          ),
          banner.getBN('/STD_ISD_PIN_Code')
        ],
      ),
    );
  }
}
