import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:find_my_phon/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:find_my_phon/Controller_Page/widget_controller/controller.dart';
import 'package:find_my_phon/Media_qury.dart';
import 'package:find_my_phon/ads/Google_Ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_device_identifier/flutter_device_identifier.dart';
import 'package:get/get.dart';
import 'package:system_info/system_info.dart';

class Device_Information extends StatefulWidget {
  const Device_Information({Key? key}) : super(key: key);

  @override
  State<Device_Information> createState() => _Device_InformationState();
}

class _Device_InformationState extends State<Device_Information> {
  Rx<DeviceInfoPlugin> deviceInfoPlugin = DeviceInfoPlugin().obs;
  RxMap<String, dynamic> _deviceData = <String, dynamic>{}.obs;

  var processors = SysInfo.processors.obs;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    iniPlatformState();
    abc = Get.arguments;
  }

  var abc;

  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};
    try {
      if (Platform.isAndroid) {
        deviceData =
            _readAndroidBuildData(await deviceInfoPlugin.value.androidInfo)
                .value;
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;
    _deviceData.value = deviceData;
  }

  RxMap<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    print(build.id);
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'systemFeatures': build.systemFeatures,
    }.obs;
  }

  var _platformVersion = 'Unknown'.obs;
  var _serialNumber = "--".obs;

  Future<void> iniPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await FlutterDeviceIdentifier.platformVersion ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    _platformVersion.value = platformVersion;

    await FlutterDeviceIdentifier.requestPermission();
    _serialNumber.value = await FlutterDeviceIdentifier.serialCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF4F0),
      appBar: controllerAppbar.getappbar('Device Information', () {
        backbuttoncontroller.showBackbuttonad(
            context, '/Device_Information', '');
      }),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Obx(
              () => Column(
                children: [
                  controllerblackcontain.getcontain(
                    Column(
                      children: [
                        SizedBox(
                          height: ScreenSize.horizontalBlockSize! * 8,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: ScreenSize.horizontalBlockSize! * 5,
                            ),
                            controllerDISCRIPTEXT2.getText(
                              'Model :',
                            ),
                            Width.getwidth(),
                            controllerblackText2.getText(
                                _deviceData.value['model'].toString(),
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
                              'Device Name :',
                            ),
                            Width.getwidth(),
                            controllerblackText2.getText(
                                _deviceData.value['device'].toString(),
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
                              'Manufacture :',
                            ),
                            Width.getwidth(),
                            controllerblackText2.getText(
                                _deviceData.value['manufacturer'].toString(),
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
                              'Screen :',
                            ),
                            Width.getwidth(),
                            controllerblackText2.getText(
                                '${_deviceData.value['display']}',
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
                              "Version_os :",
                            ),
                            Width.getwidth(),
                            controllerblackText2.getText(
                                _deviceData.value['version.release'].toString(),
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
                              'Serial :',
                            ),
                            Width.getwidth(),
                            controllerblackText2.getText(
                                '${_serialNumber}', ScreenSize.fSize_16()),
                          ],
                        ),
                        controllerdivider.getdivider(),
                        Row(
                          children: [
                            SizedBox(
                              width: ScreenSize.horizontalBlockSize! * 5,
                            ),
                            controllerDISCRIPTEXT2.getText(
                              'Kernal :',
                            ),
                            Width.getwidth(),
                            controllerblackText2.getText(
                                """${SysInfo.kernelVersion.toString()}""",
                                ScreenSize.fSize_16())
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
                              'Baseband :',
                            ),
                            Width.getwidth(),
                            controllerblackText2.getText(
                                """${SysInfo.userName}""",
                                ScreenSize.fSize_16())
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
                              'Build :',
                            ),
                            Width.getwidth(),
                            Center(
                              child: controllerblackText2.getText(
                                  """${_deviceData.value['display'].toString()}""",
                                  ScreenSize.fSize_16()),
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
                              'Wifi_status :',
                            ),
                            Width.getwidth(),
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
                              'Network_status :',
                            ),
                            Width.getwidth(),
                            controllerblackText2.getText(
                                abc[0].toString(), ScreenSize.fSize_16()),
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
                              'Bluetooth :',
                            ),
                            Width.getwidth(),
                            controllerblackText2.getText(
                                '${abc[2] == false ? "Off" : "On"}',
                                ScreenSize.fSize_16()),
                          ],
                        ),
                        SizedBox(
                          height: ScreenSize.horizontalBlockSize! * 8,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenSize.fSize_150()),
                ],
              ),
            ),
          ),
          banner.getBN('/Device_Information')
        ],
      ),
    );
  }
}

class NetworkConnectivity {
  NetworkConnectivity._();

  static final _instance = NetworkConnectivity._();

  static NetworkConnectivity get instance => _instance;
  final _networkConnectivity = Connectivity();
  final _controller = StreamController.broadcast();

  Stream get myStream => _controller.stream;

  void initialise() async {
    ConnectivityResult result = await _networkConnectivity.checkConnectivity();
    _checkStatus(result);
    _networkConnectivity.onConnectivityChanged.listen((result) {
      print(result);
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    _controller.sink.add({result: isOnline});
  }

  void disposeStream() => _controller.close();
}
