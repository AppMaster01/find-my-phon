import 'dart:async';
import 'dart:io';

import 'package:bluetooth_connector/bluetooth_connector.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:find_my_phon/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:find_my_phon/Controller_Page/widget_controller/controller.dart';
import 'package:find_my_phon/ads/Google_Ads.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller_Page/Button_controller/Main_Controller.dart';
import 'Device_Information.dart';


class Mobile_Tools extends StatefulWidget {
  const Mobile_Tools({Key? key}) : super(key: key);

  @override
  State<Mobile_Tools> createState() => _Mobile_ToolsState();
}

class _Mobile_ToolsState extends State<Mobile_Tools> {
  BluetoothConnector flutterbluetoothadapter = BluetoothConnector();
  var ActiveConnection = false.obs;
  RxString T = "".obs;

  Future CheckUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          ActiveConnection.value = true;
          T.value = "connected ";
      }
    } on SocketException catch (_) {
        ActiveConnection.value = false;
        T.value = "disconnect";
    }
  }


  var bluethooth;
  @override
  void initState() {
    flutterbluetoothadapter.checkBluetooth().then((value) {
      bluethooth = value;
      print(value.toString());
    });
    CheckUserConnection();
    super.initState();
    _networkConnectivity.initialise();
    _networkConnectivity.myStream.listen((source) {
      _source = source;
      string.value = _source.values.toList()[0] ? 'Online' : 'Offline';
      print('source $_source');
      // 1.
      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          string.value = _source.values.toList()[0] ? 'Online' : 'Offline';
          break;
        case ConnectivityResult.wifi:
          string.value = _source.values.toList()[0] ? 'Online' : 'Offline';
          break;
        case ConnectivityResult.none:
        default:
          string.value = 'Offline';
      }

    });
  }

  Map _source = {ConnectivityResult.none: false};
  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  var string = ''.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF4F0),
      appBar: controllerAppbar.getappbar('Mobile Tools', () {
        backbuttoncontroller.showBackbuttonad(context, '/Mobile_Tools', '');
      }),
      body: Obx(
        () => Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  controllerimagecontainer.getimage(context, () async {
                    CheckUserConnection();
                    controller.showbuttonad(context, '/Device_Information',
                        '/Mobile_Tools', [T.value, string, bluethooth]);
                  }, 'asset/image/Icons/Device info.png', 'Device Information',
                      """You can choose to save information about 
your phone."""),
                  controllerimagecontainer.getimage(context, () {
                    controller.showbuttonad(context,
                        '/System_Information_Battery', '/Mobile_Tools', '');
                  }, 'asset/image/Icons/Syaytem Info.png', 'System Information',
                      """Easily review the system information for the 
mobile device."""),
                ],
              ),
            ),
            banner.getBN('/Mobile_Tools')
          ],
        ),
      ),
    );
  }
}
