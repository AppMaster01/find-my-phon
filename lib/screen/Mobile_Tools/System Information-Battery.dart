import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:find_my_phon/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:find_my_phon/Controller_Page/widget_controller/controller.dart';
import 'package:find_my_phon/Media_qury.dart';
import 'package:find_my_phon/ads/Google_Ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:async';

import 'package:storage_info/storage_info.dart';
import 'package:system_clock/system_clock.dart';
import 'package:system_info/system_info.dart';
import 'package:system_info_plus/system_info_plus.dart';

DateTime _lastBootDatetime() {
  final bootSinceEpoch = DateTime.now().microsecondsSinceEpoch -
      SystemClock.elapsedRealtime().inMicroseconds;
  return DateTime.fromMicrosecondsSinceEpoch(bootSinceEpoch);
}

class System_Information_Battery extends StatefulWidget {
  const System_Information_Battery({Key? key}) : super(key: key);

  @override
  State<System_Information_Battery> createState() =>
      _System_Information_BatteryState();
}

class _System_Information_BatteryState extends State<System_Information_Battery>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Future<List<double>> internaltotal() async {
    return [
      await StorageInfo.getStorageTotalSpaceInGB,
      await StorageInfo.getStorageFreeSpaceInGB,
      await StorageInfo.getExternalStorageTotalSpaceInGB,
      await StorageInfo.getExternalStorageFreeSpaceInGB,
    ];
  }

  final processors = SysInfo.processors;
  int _deviceMemory = -1;

  Future<void> initPlatformState() async {
    int deviceMemory;

    try {
      deviceMemory = await SystemInfoPlus.physicalMemory ?? -1;
    } on PlatformException {
      deviceMemory = -1;
    }
    if (!mounted) return;

    setState(() {
      _deviceMemory = deviceMemory;
    });
  }

  int MEGABYTE = 1024 * 1024;
  var RAM = SysInfo.processors;

  @override
  Widget build(BuildContext context) {
    double GB = _deviceMemory / 1000;
    double Ram = (SysInfo.getFreePhysicalMemory() ~/ MEGABYTE) - (GB);
    return Scaffold(
      backgroundColor: Color(0xffFAF4F0),
      appBar: controllerAppbar.getappbar('System Information', () {
        backbuttoncontroller.showBackbuttonad(
            context, '/System_Information_Battery', '');
      }),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: ScreenSize.fSize_50(),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xffFBDECA),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xffFBDECA), Color(0xffFEEDC4)])),
                      child: TabBar(
                        isScrollable: false,
                        controller: _tabController,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          color: Color(0xff3A1808),
                        ),
                        labelStyle: GoogleFonts.anekTamil(
                            fontWeight: FontWeight.w600,
                            fontSize: ScreenSize.horizontalBlockSize! * 4.5),
                        indicatorPadding: EdgeInsets.only(
                            top: ScreenSize.horizontalBlockSize! * 13.3,
                            left: ScreenSize.fSize_20(),
                            right: ScreenSize.fSize_20()),
                        labelColor: Color(0xff3A1808),
                        unselectedLabelColor: Color(0xffA48F86),
                        tabs: [
                          Tab(
                            text: "Battery",
                          ),
                          Tab(
                            text: "Storage",
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        height: ScreenSize.fSize_34(),
                        width: ScreenSize.horizontalBlockSize! * 0.4,
                        color: Color(0xffA48F86),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            FutureBuilder<AndroidBatteryInfo?>(
                                future: BatteryInfoPlugin().androidBatteryInfo,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text('');
                                  }
                                  return CircularProgressIndicator();
                                }),
                            StreamBuilder<AndroidBatteryInfo?>(
                                stream: BatteryInfoPlugin()
                                    .androidBatteryInfoStream,
                                builder: (context, snapshot) {
                                  double BATTERY =
                                      snapshot.data!.batteryLevel!.toDouble();
                                  if (snapshot.hasData) {
                                    return Column(
                                      children: [
                                        SizedBox(height: ScreenSize.fSize_23()),
                                        CircularPercentIndicator(
                                          radius:
                                              ScreenSize.horizontalBlockSize! *
                                                  20,
                                          lineWidth:
                                              ScreenSize.horizontalBlockSize! *
                                                  2.2,
                                          percent: BATTERY / 100,
                                          animation: true,
                                          animationDuration: 1000,
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          linearGradient: LinearGradient(
                                              colors: [
                                                Color(0xff523120),
                                                Color(0xff826A5F)
                                              ]),
                                          center: Text(
                                              '${snapshot.data!.batteryLevel}%',
                                              style: GoogleFonts.anekTamil(
                                                  color: Colors.black,
                                                  fontSize:
                                                      ScreenSize.fSize_40(),
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        SizedBox(height: ScreenSize.fSize_20()),
                                        controllerTEXT.getText(
                                            "Battery Information  ${snapshot.data!.batteryLevel}%",
                                            ScreenSize.fSize_23(),
                                            FontWeight.w500),
                                        SizedBox(height: ScreenSize.fSize_17()),
                                        controllerblackcontain
                                            .getcontain(Column(
                                          children: [
                                            SizedBox(
                                                height: ScreenSize.fSize_20()),
                                            Row(
                                              children: [
                                                SizedBox(
                                                    width:
                                                        ScreenSize.fSize_20()),
                                                Container(
                                                  // color: Colors.black12,
                                                  width: ScreenSize
                                                          .horizontalBlockSize! *
                                                      37,
                                                  child: controllerDISCRIPTEXT
                                                      .getText(
                                                          'Battery Status :',
                                                          ScreenSize
                                                              .fSize_15()),
                                                ),
                                                SizedBox(
                                                    width: ScreenSize
                                                            .horizontalBlockSize! *
                                                        5),
                                                controllerblackText.getText(
                                                    '${(snapshot.data!.chargingStatus.toString().split(".")[1])}',
                                                    ScreenSize.fSize_15())
                                              ],
                                            ),
                                            controllerdivider.getdivider(),
                                            Row(
                                              children: [
                                                SizedBox(
                                                    width:
                                                        ScreenSize.fSize_20()),
                                                Container(
                                                  // color: Colors.black12,
                                                  width: ScreenSize
                                                          .horizontalBlockSize! *
                                                      37,
                                                  child: controllerDISCRIPTEXT
                                                      .getText(
                                                          'Battery Health :',
                                                          ScreenSize
                                                              .fSize_15()),
                                                ),
                                                SizedBox(
                                                    width: ScreenSize
                                                            .horizontalBlockSize! *
                                                        5),
                                                controllerblackText.getText(
                                                    '${(snapshot.data!.health.toString().split("_")[1]).toUpperCase()}',
                                                    ScreenSize.fSize_15())
                                              ],
                                            ),
                                            controllerdivider.getdivider(),
                                            Row(
                                              children: [
                                                SizedBox(
                                                    width:
                                                        ScreenSize.fSize_20()),
                                                Container(
                                                  // color: Colors.black12,
                                                  width: ScreenSize
                                                          .horizontalBlockSize! *
                                                      37,
                                                  child: controllerDISCRIPTEXT
                                                      .getText(
                                                          'Battery Temp. :',
                                                          ScreenSize
                                                              .fSize_15()),
                                                ),
                                                SizedBox(
                                                    width: ScreenSize
                                                            .horizontalBlockSize! *
                                                        5),
                                                controllerblackText.getText(
                                                    '${snapshot.data!.temperature}',
                                                    ScreenSize.fSize_15())
                                              ],
                                            ),
                                            controllerdivider.getdivider(),
                                            Row(
                                              children: [
                                                SizedBox(
                                                    width:
                                                        ScreenSize.fSize_20()),
                                                Container(
                                                  // color: Colors.black12,
                                                  width: ScreenSize
                                                          .horizontalBlockSize! *
                                                      37,
                                                  child: controllerDISCRIPTEXT
                                                      .getText(
                                                          'Li-poly :',
                                                          ScreenSize
                                                              .fSize_15()),
                                                ),
                                                SizedBox(
                                                    width: ScreenSize
                                                            .horizontalBlockSize! *
                                                        5),
                                                controllerblackText.getText(
                                                    '${snapshot.data!.batteryCapacity}',
                                                    ScreenSize.fSize_15())
                                              ],
                                            ),
                                            controllerdivider.getdivider(),
                                            Row(
                                              children: [
                                                SizedBox(
                                                    width:
                                                        ScreenSize.fSize_20()),
                                                Container(
                                                  // color: Colors.black12,
                                                  width: ScreenSize
                                                          .horizontalBlockSize! *
                                                      37,
                                                  child: controllerDISCRIPTEXT
                                                      .getText(
                                                          'Battery Voltage :',
                                                          ScreenSize
                                                              .fSize_15()),
                                                ),
                                                SizedBox(
                                                    width: ScreenSize
                                                            .horizontalBlockSize! *
                                                        5),
                                                controllerblackText.getText(
                                                    '${snapshot.data!.voltage}',
                                                    ScreenSize.fSize_15())
                                              ],
                                            ),
                                            controllerdivider.getdivider(),
                                            Row(
                                              children: [
                                                SizedBox(
                                                    width:
                                                        ScreenSize.fSize_20()),
                                                Container(
                                                  width: ScreenSize
                                                          .horizontalBlockSize! *
                                                      37,
                                                  child: controllerDISCRIPTEXT
                                                      .getText(
                                                          'System Uptime :',
                                                          ScreenSize
                                                              .fSize_15()),
                                                ),
                                                SizedBox(
                                                    width: ScreenSize
                                                            .horizontalBlockSize! *
                                                        5),
                                                controllerblackText.getText(
                                                    "${SystemClock.uptime() == "" ? null : SystemClock.uptime()}",
                                                    ScreenSize.fSize_15()),
                                              ],
                                            ),
                                            SizedBox(
                                                height: ScreenSize.fSize_20()),
                                          ],
                                        )),
                                      ],
                                    );
                                  }
                                  return CircularProgressIndicator();
                                }),
                            SizedBox(height: ScreenSize.fSize_80()),
                          ],
                        ),
                      ),
//==============================================================================================================================
                      FutureBuilder(
                          future: internaltotal(),
                          builder: (context, snapshot) {
                            print(snapshot.error);
                            if (snapshot.hasData) {
                              return Stack(
                                children: [
                                  SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Stack(
                                      children: [
                                        Column(
                                          children: [
                                            Column(
                                              children: [
                                                SizedBox(
                                                    height:
                                                        ScreenSize.fSize_28()),
                                                Center(
                                                    child:
                                                        controllerTEXT.getText(
                                                            'RAM Information',
                                                            ScreenSize
                                                                .fSize_25(),
                                                            FontWeight.w600)),
                                                SizedBox(
                                                    height:
                                                        ScreenSize.fSize_18()),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            color: Color(
                                                                0xff3A1808),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                              height: ScreenSize
                                                                  .fSize_20()),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  controllerblackText222.getText(
                                                                      '${(SysInfo.getTotalPhysicalMemory() ~/ MEGABYTE) / 1000}',
                                                                      ScreenSize
                                                                          .fSize_16()),
                                                                  SizedBox(
                                                                      height: ScreenSize
                                                                          .fSize_8()),
                                                                  controllerDISCRIPTEXT.getText(
                                                                      'Total RAM',
                                                                      ScreenSize
                                                                          .fSize_16()),
                                                                ],
                                                              ),
                                                              controllervirtical
                                                                  .getvirtical(),
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  controllerblackText222.getText(
                                                                      '${(SysInfo.getFreeVirtualMemory() ~/ MEGABYTE) / 1000}',
                                                                      ScreenSize
                                                                          .fSize_16()),
                                                                  SizedBox(
                                                                      height: ScreenSize
                                                                          .fSize_8()),
                                                                  controllerDISCRIPTEXT.getText(
                                                                      'Used RAM',
                                                                      ScreenSize
                                                                          .fSize_16()),
                                                                ],
                                                              ),
                                                              controllervirtical
                                                                  .getvirtical(),
                                                              Column(
                                                                children: [
                                                                  controllerblackText222.getText(
                                                                      '${(SysInfo.getFreePhysicalMemory() ~/ MEGABYTE) / 1000}',
                                                                      ScreenSize
                                                                          .fSize_16()),
                                                                  SizedBox(
                                                                      height: ScreenSize
                                                                          .fSize_8()),
                                                                  controllerDISCRIPTEXT.getText(
                                                                      'Free RAM',
                                                                      ScreenSize
                                                                          .fSize_16()),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                              height: ScreenSize
                                                                  .fSize_20()),
                                                        ],
                                                      )),
                                                ),
//=============================================================================================================
                                                SizedBox(
                                                    height:
                                                        ScreenSize.fSize_18()),
                                                Center(
                                                    child: controllerTEXT.getText(
                                                        'Internal Storage Info',
                                                        ScreenSize.fSize_25(),
                                                        FontWeight.w600)),
                                                SizedBox(
                                                    height:
                                                        ScreenSize.fSize_18()),
                                                controllerRAM.gethight(
                                                    "${snapshot.data![0]} GB",
                                                    "Total Space",
                                                    "${snapshot.data![1]} GB",
                                                    "Free Space"),

//=============================================================================================================
                                                SizedBox(
                                                    height:
                                                        ScreenSize.fSize_18()),
                                                Center(
                                                    child: controllerTEXT.getText(
                                                        'External Storage Info',
                                                        ScreenSize.fSize_25(),
                                                        FontWeight.w600)),
                                                SizedBox(
                                                    height:
                                                        ScreenSize.fSize_18()),
                                                controllerRAM.gethight(
                                                    "${snapshot.data![2]} GB",
                                                    "Total Space",
                                                    "${snapshot.data![3]} GB",
                                                    "Free Space"),
                                                SizedBox(
                                                    height:
                                                        ScreenSize.fSize_80()),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Center(child: Text("Loading..."));
                            }
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          banner.getBN('/System_Information_Battery')
        ],
      ),
    );
  }
}
