// ignore_for_file: non_constant_identifier_names, invalid_use_of_protected_member, equal_keys_in_map

import 'dart:async';
import 'dart:convert';
import 'package:find_my_phon/screen/Address_Finder/Address_Finder.dart';
import 'package:find_my_phon/screen/Clap_to_Find_Phone/Clap_to_Find_Phone.dart';
import 'package:find_my_phon/screen/Find_Parking_Area/Find_Parking_Area.dart';
import 'package:find_my_phon/screen/Home.dart';
import 'package:find_my_phon/screen/Mobile_Tools/Device_Information.dart';
import 'package:find_my_phon/screen/Mobile_Tools/Mobile_Tools.dart';
import 'package:find_my_phon/screen/Mobile_Tools/System%20Information-Battery.dart';
import 'package:find_my_phon/screen/STD-ISD-%20PIN%20Code.dart';
import 'package:find_my_phon/screen/Save_Location/Save Phone Location.dart';
import 'package:find_my_phon/screen/Location%20Information/Location%20Information.dart';
import 'package:find_my_phon/screen/Save_Location/Saved_Location.dart';
import 'package:find_my_phon/screen/Search%20PIN%20Code3/City.dart';
import 'package:find_my_phon/screen/Search%20PIN%20Code3/India States.dart';
import 'package:find_my_phon/screen/Search%20PIN%20Code3/Detail.dart';
import 'package:find_my_phon/screen/Search%20PIN%20Code3/Gujarat (GJ).dart';
import 'package:find_my_phon/screen/Search_ISD/Search_ISD.dart';
import 'package:find_my_phon/screen/Search_STD/Search_STD.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:developer' as developer;
import 'package:timezone/data/latest.dart' as tz;
import 'Controller_Page/My_Controller.dart';
import 'Get_Started.dart';
import 'Main_Screen.dart';
import 'inapp_web_view/in_app.dart';
import 'inapp_web_view/save_location.dart';

MyAppController myAppController = Get.put(MyAppController());

final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
RxMap FindPhon = {}.obs;

Future initConfig() async {
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 1),
    minimumFetchInterval: const Duration(seconds: 10),
  ));
  await remoteConfig.fetchAndActivate();
}

AppOpenAd? appOpenAd;

loadAd() {
  AppOpenAd.load(
    adUnitId: FindPhon.value['APPOPEN'],
    orientation: AppOpenAd.orientationPortrait,
    request: const AdManagerAdRequest(),
    adLoadCallback: AppOpenAdLoadCallback(
      onAdLoaded: (ad) {
        appOpenAd = ad;
        ad.show();
      },
      onAdFailedToLoad: (error) {},
    ),
  );
}

AndroidNotificationChannel channel = const AndroidNotificationChannel(
    "Hello ", "Rohan",
    playSound: true, importance: Importance.high);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  tz.initializeTimeZones();
  MobileAds.instance.initialize();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  initConfig().whenComplete(() {
    FindPhon.value = json.decode(remoteConfig.getString('phonfind'));
    loadAd();
  });

  runZonedGuarded(
    () {
      return runApp(GetMaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const Main_Screen(),
          '/Get_Started': (context) => const Get_Started(),
          '/In_App_Privacy': (context) => const In_App_Privacy(),
          '/Home': (context) => const Home(),
          '/Clap_to_Find_Phone': (context) => const Clap_to_Find_Phone(),
          '/Save_Location': (context) => const Save_Location(),
          '/Saved_Location': (context) => const Saved_Location(),
          '/Location_Information': (context) => const Location_Information(),
          '/Mobile_Tools': (context) => const Mobile_Tools(),
          '/Device_Information': (context) => const Device_Information(),
          '/System_Information_Battery': (context) =>
              const System_Information_Battery(),
          '/STD_ISD_PIN_Code': (context) => const STD_ISD_PIN_Code(),
          '/Search_STD': (context) => const Search_STD(),
          '/Search_ISD': (context) => const Search_ISD(),
          '/Country': (context) => const Country(),
          '/state': (context) => const state(),
          '/City': (context) => const City(),
          '/Details': (context) => const Details(),
          '/Find_Parking_Area': (context) => const Find_Parking_Area(),
          '/Address_Finder': (context) => const Address_Finder(),
          '/in_app_location': (context) => const in_app_location(),
        },
        debugShowCheckedModeBanner: false,
      ));
    },
    (dynamic error, dynamic stack) {
      developer.log("Something went wrong!", error: error, stackTrace: stack);
    },
  );
}
