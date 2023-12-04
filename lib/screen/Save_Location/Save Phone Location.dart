// ignore_for_file: deprecated_member_use, camel_case_types, prefer_typing_uninitialized_variables

import 'package:find_my_phon/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:find_my_phon/Controller_Page/widget_controller/controller.dart';
import 'package:find_my_phon/ads/Google_Ads.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Controller_Page/Button_controller/Main_Controller.dart';



class Save_Location extends StatefulWidget {
  const Save_Location({Key? key}) : super(key: key);

  @override
  State<Save_Location> createState() => _Save_LocationState();
}

class _Save_LocationState extends State<Save_Location> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     abc = Get.arguments;
  }
var abc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAF4F0),
      appBar: controllerAppbar.getappbar('Save Phone Location', () {
        backbuttoncontroller.showBackbuttonad(context, '/Save_Location', '');
      }),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                native.getNT(context, '/Save_Location', "listTileMedium"),
                controllerimagecontainer.getimage(context, () async {
                  controller.showbuttonad(
                      context, '/in_app_location', '/Save_Location', '');
                }, 'asset/image/Icons/Save location.png', 'Save Location',
                    """Find your lost phone by clapping into your
hands!"""),
                controllerimagecontainer.getimage(context, () {
                  controller.showbuttonad(
                      context, '/Saved_Location', '/Save_Location', '');
                }, 'asset/image/Icons/Saved Location.png', 'Saved Location',
                    """You can save the locations list to use it again 
in future campaigns"""),
              ],
            ),
          ),
          banner.getBN('/Save_Location')
        ],
      ),
    );
  }
}

launchATMUrl(String lat) async {
  final url = 'https://www.google.com/maps/search/?api=1&query=$lat';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
