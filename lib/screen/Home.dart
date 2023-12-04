// ignore_for_file: deprecated_member_use, invalid_use_of_protected_member, unnecessary_string_interpolations

import 'package:find_my_phon/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:find_my_phon/Controller_Page/widget_controller/controller.dart';
import 'package:find_my_phon/Media_qury.dart';
import 'package:find_my_phon/ads/Google_Ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
    return exitResult ?? false;
  }

  Scaffold _buildExitDialog(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: ScreenSize.horizontalBlockSize! * 83,
                  width: ScreenSize.horizontalBlockSize! * 80,
                  decoration: BoxDecoration(
                    color: const Color(0xffFAF4F0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
                    SizedBox(height: ScreenSize.fSize_16()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: ScreenSize.horizontalBlockSize! * 63),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(false),
                          child: controllerImage.getImage(
                              'asset/image/Icons/close.png',
                              ScreenSize.horizontalBlockSize! * 7.5),
                        )
                      ],
                    ),
                    Container(
                      width: ScreenSize.fSize_50(),
                      height: ScreenSize.fSize_50(),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                              color: const Color(0xff3A1808), width: 1.5)),
                      child: Center(
                          child: controllerImage.getImage(
                              'asset/image/Icons/exit.png',
                              ScreenSize.fSize_28())),
                    ),
                    SizedBox(height: ScreenSize.fSize_25()),
                    Row(
                      children: [
                        SizedBox(width: ScreenSize.fSize_30()),
                        controllerTEXT.getText(
                            'Want to Exit ?',
                            ScreenSize.horizontalBlockSize! * 6,
                            FontWeight.w700)
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_10()),
                    Padding(
                      padding: EdgeInsets.only(
                          right: ScreenSize.horizontalBlockSize! * 14),
                      child: controllerDISCRIPTEXT
                          .getText("""Are you sure want to close this 
application.""", ScreenSize.horizontalBlockSize! * 4),
                    ),
                    SizedBox(height: ScreenSize.fSize_45()),
                    GestureDetector(
                      onTap: () => SystemNavigator.pop(),
                      child: Container(
                        height: ScreenSize.verticalBlockSize! * 11,
                        width: ScreenSize.horizontalBlockSize! * 40,
                        decoration: BoxDecoration(
                            color: const Color(0xffFBDECA),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xffFBDECA), Color(0xffFEEDC4)]),
                            border: Border.all(color: const Color(0xff3A1808)),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0xff3A1808),
                                  blurRadius: 1,
                                  offset: Offset(0, 1.5))
                            ]),
                        child: Center(
                          child: controllerTEXT.getText(
                              'Exit', ScreenSize.fSize_16(), FontWeight.w600),
                        ),
                      ),
                    )
                  ]),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  List<Map> data = List.generate(
      15,
      (index) => {
            'image': '${IMAGES.value[index]}',
            'name': '${NAME.value[index]}',
            'isSelected': false
          });

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        backgroundColor: const Color(0xffFAF4F0),
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: ScreenSize.fSize_15(),
                            top: ScreenSize.fSize_10()),
                        child: controllerDISCRIPTEXT.getText(
                            'Welcome', ScreenSize.fSize_15()),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: ScreenSize.fSize_15()),
                          child: controllerTEXT.getText('Find My Lost Phone',
                              ScreenSize.fSize_20(), FontWeight.w600)),
                      SizedBox(height: ScreenSize.fSize_13()),
                      controllerMAinCOntainer.getcontainer(context, () {
                        controller.showbuttonad(
                            context, '/Clap_to_Find_Phone', '/Home', '');
                      },
                          ScreenSize.horizontalBlockSize! * 28,
                          ScreenSize.fSize_20(),
                          Row(
                            children: [
                              SizedBox(width: ScreenSize.fSize_18()),
                              controllerCircle.getcircle(
                                context,
                                ScreenSize.horizontalBlockSize! * 7,
                                'asset/image/Icons/Clap.png',
                              ),
                              SizedBox(width: ScreenSize.fSize_20()),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  controllerTEXT.getText('Clap to Find Phone',
                                      ScreenSize.fSize_20(), FontWeight.w500),
                                  SizedBox(height: ScreenSize.fSize_6()),
                                  controllerDISCRIPTEXT.getText(
                                      """Find your lost phone by clapping into your
hands!""", ScreenSize.fSize_13()),
                                ],
                              )
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          controllerminicontain.getcontain(context, () {
                            controller.showbuttonad(
                                context, '/Save_Location', '/Home', '');
                          },
                              ScreenSize.horizontalBlockSize! * 50,
                              ScreenSize.horizontalBlockSize! * 45,
                              "asset/image/Icons/Save location.png",
                              "Save Location",
                              """Simple process to save location on the map"""),
                          controllerminicontain.getcontain(context, () {
                            controller.showbuttonad(
                                context, '/Location_Information', '/Home', '');
                          },
                              ScreenSize.horizontalBlockSize! * 50,
                              ScreenSize.horizontalBlockSize! * 45,
                              "asset/image/Icons/Location info.png",
                              "Location Info",
                              """Get current Location with Address and view on Map"""),
                        ],
                      ),
                      native.getNT(context, '/Home', 'listTileMedium'),
                      controllerMAinCOntainer.getcontainer(context, () {
                        controller.showbuttonad(
                            context, '/Mobile_Tools', '/Home', '');
                      },
                          ScreenSize.horizontalBlockSize! * 20,
                          ScreenSize.fSize_20(),
                          Row(
                            children: [
                              SizedBox(width: ScreenSize.fSize_20()),
                              controllerCircle.getcircle(
                                  context,
                                  ScreenSize.horizontalBlockSize! * 6.2,
                                  'asset/image/Icons/Mobile tools.png'),
                              SizedBox(width: ScreenSize.fSize_20()),
                              controllerTEXT.getText('Mobile Tools',
                                  ScreenSize.fSize_18(), FontWeight.w400)
                            ],
                          )),
                      SizedBox(height: ScreenSize.fSize_10()),
                      Container(
                        height: ScreenSize.horizontalBlockSize! * 70,
                        width: double.maxFinite,
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(height: ScreenSize.fSize_15()),
                            controllerhedline.getImage("Near by Place :"),
                            SizedBox(height: ScreenSize.fSize_20()),
                            Container(
                                height: ScreenSize.fSize_170(),
                                width: double.infinity,
                                padding: const EdgeInsets.all(12.0),
                                child: GridView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: IMAGES.value.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1,
                                          mainAxisSpacing:
                                              ScreenSize.fSize_12(),
                                          childAspectRatio:
                                              ScreenSize.horizontalBlockSize! *
                                                  0.35),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return controllerColorcontain
                                        .getcontain(context, () async {
                                      // setState(() {
                                      data[index]['isSelected'] =
                                          !data[index]['isSelected'];
                                      launchATMUrl(nearby[index]);

                                      // });
                                      var prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setBool(
                                          'indexss', data[index]['isSelected']);
                                    },
                                            data[index]['isSelected'] == true
                                                ? [
                                                    const Color(0xFFFCDAC7),
                                                    const Color(0xFFFDEFC5)
                                                  ]
                                                : [
                                                    const Color(0xFFFAF4F0),
                                                    const Color(0xFFFAF4F0)
                                                  ],
                                            data[index]['image'],
                                            data[index]['name']);
                                  },
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: ScreenSize.fSize_25()),
                      controllerhedline.getImage("More Option :"),
                      controllerMAinCOntainer.getcontainer(context, () {
                        controller.showbuttonad(
                            context, '/Address_Finder', '/Home', '');
                      },
                          ScreenSize.horizontalBlockSize! * 20,
                          ScreenSize.fSize_20(),
                          Row(
                            children: [
                              SizedBox(width: ScreenSize.fSize_20()),
                              controllerCircle.getcircle(
                                  context,
                                  ScreenSize.horizontalBlockSize! * 6.2,
                                  'asset/image/Icons/location.png'),
                              SizedBox(width: ScreenSize.fSize_20()),
                              controllerTEXT.getText('Address Finder',
                                  ScreenSize.fSize_18(), FontWeight.w400)
                            ],
                          )),
                      controllerMAinCOntainer.getcontainer(context, () {
                        controller.showbuttonad(
                            context, '/STD_ISD_PIN_Code', '/Home', '');
                      },
                          ScreenSize.horizontalBlockSize! * 20,
                          ScreenSize.fSize_20(),
                          Row(
                            children: [
                              SizedBox(width: ScreenSize.fSize_20()),
                              controllerCircle.getcircle(
                                  context,
                                  ScreenSize.horizontalBlockSize! * 6.2,
                                  'asset/image/Icons/code.png'),
                              SizedBox(width: ScreenSize.fSize_20()),
                              controllerTEXT.getText('STD/ ISD/ PIN Code',
                                  ScreenSize.fSize_18(), FontWeight.w400)
                            ],
                          )),
                      controllerMAinCOntainer.getcontainer(context, () {
                        controller.showbuttonad(
                            context, '/Find_Parking_Area', '/Home', '');
                      },
                          ScreenSize.horizontalBlockSize! * 20,
                          ScreenSize.fSize_20(),
                          Row(
                            children: [
                              SizedBox(width: ScreenSize.fSize_20()),
                              controllerCircle.getcircle(
                                  context,
                                  ScreenSize.horizontalBlockSize! * 6.2,
                                  'asset/image/Icons/Parking.png'),
                              SizedBox(width: ScreenSize.fSize_20()),
                              controllerTEXT.getText('Find Parking Area',
                                  ScreenSize.fSize_18(), FontWeight.w400)
                            ],
                          )),
                      SizedBox(height: ScreenSize.fSize_150()),
                    ],
                  ),
                ),
              ),
              banner.getBN('/Home')
            ],
          ),
        ),
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
