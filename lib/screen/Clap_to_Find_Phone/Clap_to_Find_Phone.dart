// ignore_for_file: non_constant_identifier_names, camel_case_types, prefer_final_fields, sized_box_for_whitespace

import 'package:find_my_phon/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:find_my_phon/Controller_Page/widget_controller/controller.dart';
import 'package:find_my_phon/ads/Google_Ads.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:torch_light/torch_light.dart';
import 'package:vibration/vibration.dart';
import 'package:volume_controller/volume_controller.dart';

import '../../Media_qury.dart';

var isSwitched = false.obs;
var Slidervalue3 = 0.0.obs;
var flashlight = false.obs;
var Vibrate = false.obs;
var Active = false.obs;
var click = false.obs;

class Clap_to_Find_Phone extends StatefulWidget {
  const Clap_to_Find_Phone({Key? key}) : super(key: key);

  @override
  State<Clap_to_Find_Phone> createState() => _Clap_to_Find_PhoneState();
}

class _Clap_to_Find_PhoneState extends State<Clap_to_Find_Phone> {
  var _volumeListenerValue = 0.0.obs;
  var _setVolumeValue = 0.0.obs;

  @override
  void initState() {
    super.initState();
    VolumeController().listener((volume) {
      _volumeListenerValue.value = volume;
    });
    VolumeController()
        .getVolume()
        .then((volume) => _setVolumeValue.value = volume);
  }

  @override
  void dispose() {
    VolumeController().removeListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFAF4F0),
        appBar: controllerAppbar.getappbar('Clap to Find Phone', () {
          backbuttoncontroller.showBackbuttonad(
              context, '/Clap_to_Find_Phone', '');
        }),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Obx(
                () => Column(
                  children: [
                    controllerMAinCOntainer.getcontainer(
                        context,
                        () {},
                        ScreenSize.horizontalBlockSize! * 28,
                        ScreenSize.fSize_20(),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: controllerTEXT.getText(
                                      'Volume Setting',
                                      ScreenSize.fSize_18(),
                                      FontWeight.w500),
                                ),
                                SizedBox(width: ScreenSize.fSize_70()),
                                Transform.scale(
                                  scale: 0.7,
                                  child: CupertinoSwitch(
                                    activeColor: const Color(0xff886c54),
                                    thumbColor: Colors.white,
                                    trackColor: const Color(0xff886c54),
                                    value: isSwitched.value,
                                    onChanged: (value) {
                                      isSwitched.value = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: ScreenSize.fSize_25()),
                                controllerImage.getImage(
                                    'asset/image/Icons/Volume.png',
                                    ScreenSize.fSize_25()),
                                Container(
                                  width: ScreenSize.horizontalBlockSize! * 80,
                                  height: ScreenSize.fSize_30(),
                                  child: SliderTheme(
                                    data: SliderThemeData(
                                      trackHeight: ScreenSize.fSize_3(),
                                      thumbShape: RoundSliderThumbShape(
                                          enabledThumbRadius:
                                              ScreenSize.horizontalBlockSize! *
                                                  1.2),
                                      thumbColor: const Color(0xff3A1808),
                                      activeTrackColor: const Color(0xff3A1808),
                                      inactiveTrackColor:
                                          const Color(0xffC9C0C0),
                                    ),
                                    child: Slider(
                                      min: 0,
                                      max: 1,
                                      onChanged: (double value) {
                                        _setVolumeValue.value = value;
                                        VolumeController()
                                            .setVolume(_setVolumeValue.value);
                                      },
                                      value: _setVolumeValue.value,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                    native.getNT(context, '/Clap_to_Find_Phone', "listTile"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        controllerminicontain2.getcontain(
                            context,
                            ScreenSize.horizontalBlockSize! * 50,
                            ScreenSize.horizontalBlockSize! * 42,
                            'asset/image/Icons/Flash Light.png',
                            'Flash Light',
                            flashlight.value, (value) async {
                          if (flashlight.value) {
                            flashlight.value = false;
                            TorchLight.disableTorch();
                          } else {
                            flashlight.value = true;
                            TorchLight.enableTorch();
                          }
                        }),
                        controllerminicontain2.getcontain(
                            context,
                            ScreenSize.horizontalBlockSize! * 50,
                            ScreenSize.horizontalBlockSize! * 42,
                            'asset/image/Icons/Vibrate.png',
                            'Vibrate',
                            Vibrate.value, (value) {
                          if (Vibrate.value) {
                            Vibrate.value = false;
                            Vibration.cancel();
                          } else {
                            Vibrate.value = true;
                            Vibration.vibrate();
                          }
                        }),
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_25()),
                    Container(
                      height: ScreenSize.verticalBlockSize! * 14,
                      width: ScreenSize.horizontalBlockSize! * 50,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          controllerTEXT.getText(
                              'Active', ScreenSize.fSize_17(), FontWeight.w500),
                          Transform.scale(
                            scale: 0.7,
                            child: CupertinoSwitch(
                              activeColor: const Color(0xff3A1808),
                              thumbColor: Colors.white,
                              trackColor: const Color(0xff3A1808),
                              value: Active.value,
                              onChanged: (value) {
                                Active.value = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ScreenSize.fSize_80()),
                  ],
                ),
              ),
            ),
            banner.getBN('/Clap_to_Find_Phone')
          ],
        ));
  }
}
