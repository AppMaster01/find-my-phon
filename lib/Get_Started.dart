// ignore_for_file: deprecated_member_use, camel_case_types

import 'package:find_my_phon/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:find_my_phon/Controller_Page/widget_controller/controller.dart';
import 'package:find_my_phon/Media_qury.dart';
import 'package:find_my_phon/ads/Google_Ads.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Get_Started extends StatefulWidget {
  const Get_Started({Key? key}) : super(key: key);

  @override
  State<Get_Started> createState() => _Get_StartedState();
}

class _Get_StartedState extends State<Get_Started> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAF4F0),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: ScreenSize.fSize_80()),
                  controllerImage.getImage('asset/image/Vector img.png',
                      ScreenSize.horizontalBlockSize! * 55),
                  SizedBox(height: ScreenSize.horizontalBlockSize! * 10),
                  controllerTEXT.getText("Find My Lost Phone",
                      ScreenSize.horizontalBlockSize! * 8.5, FontWeight.w700),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: controllerDISCRIPTEXT.getText(
                      """Find My Lost Phone App helps you to keep 
  your phone safe Find your lost phone by
              clapping into your hands!""",
                      ScreenSize.horizontalBlockSize! * 4.2,
                    ),
                  ),
                  controllercontainer.getcontainer(context, () {
                    controller.showbuttonad(
                        context, '/Home', '/Get_Started', '');
                  },
                      Center(
                          child: controllerTEXT.getText(
                              'Get Started',
                              ScreenSize.horizontalBlockSize! * 5,
                              FontWeight.w500))),
                  SizedBox(height: ScreenSize.horizontalBlockSize! * 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      controllergetstart.getgetstart(context, _shareURL,
                          'asset/image/Icons/Rate.png', 'Rate'),
                      controllergetstart.getgetstart(context, () {
                        Share.share('ABC');
                      }, 'asset/image/Icons/Share.png', 'Share'),
                      controllergetstart.getgetstart(context, () {
                        controller.showbuttonad(
                            context, '/In_App_Privacy', '/Get_Started', '');
                      }, 'asset/image/Icons/Privacy.png', 'Privacy'),
                    ],
                  ),
                  SizedBox(height: ScreenSize.fSize_80()),
                ],
              ),
            ),
          ),
          banner.getBN('/Get_Started'),
        ],
      ),
    );
  }
}

_shareURL() async {
  const url = 'https://in.linkedin.com/company/infinitizi?trk=ppro_cprof';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
