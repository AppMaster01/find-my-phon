// ignore_for_file: deprecated_member_use, camel_case_types, non_constant_identifier_names, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_types_as_parameter_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Media_qury.dart';

// int index = 0;

final controllerImage = Get.put(Imagecontroller());
final controllerTEXT = Get.put(Textcontroller());
final controllerDISCRIPTEXT = Get.put(TextDcontroller());
final controllerDISCRIPTEXT2 = Get.put(TextD2controller());
final controllercontainer = Get.put(ContainerController());
final controllergetstart = Get.put(getstartController());
final controllerAppbar = Get.put(AppbarController());
final controllerMAinCOntainer = Get.put(MContainerController());
final controllerCircle = Get.put(circleController());
final controllerminicontain = Get.put(minicontainController());
final controllerminicontain2 = Get.put(minicontain2Controller());
final controllerColorcontain = Get.put(ColorContainController());
final controllerhedline = Get.put(hedlinecontroller());
final controllerblackcontain = Get.put(blackContaincontroller());
final H = Get.put(h());
final Hight = Get.put(hight());
final Width = Get.put(width());
final Width2 = Get.put(width2());
final controllerblackText = Get.put(blackTextDcontroller());
final controllerblackText2 = Get.put(blackText2Dcontroller());
final controllerblackText222 = Get.put(blackTextD222controller());
final controllerdivider = Get.put(divider());
final controllerdivider22 = Get.put(divider22());
final controllerRAM = Get.put(ramcontainer());
final controllervirtical = Get.put(virticalcontroller());
final controllerimagecontainer = Get.put(imagecontainercontroller());
final controllertextfiled = Get.put(textfiledcontroller());
final controllercolortext = Get.put(Textcolorcontroller());
final controllerIMAGETEXT = Get.put(IMAGETEXT());
final controllerWIDGHT = Get.put(WIDGHT());
final controllerparking = Get.put(parking());
final controllercirclle = Get.put(circleavtar());

class circleavtar extends GetxController {
  getavtar(ontap, text) {
    return GestureDetector  (
      onTap: ontap,
      child: Column(
        children: [
          CircleAvatar(
            minRadius: ScreenSize.horizontalBlockSize! * 5,
            backgroundColor: Colors.white,
            child: Center(
              child: controllerImage.getImage(
                  'asset/image/Icons/location (1) 1 (1).png', ScreenSize.fSize_20()),
            ),
          ),
          SizedBox(height: ScreenSize.fSize_6()),
          controllerTEXT.getText(
              text, ScreenSize.horizontalBlockSize! * 3.2, FontWeight.w500)
        ],
      ),
    );
  }
}

class parking extends GetxController {
  gethight(name, add, date, navigation, copy, share, delet) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xff3A1808),
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.only(left: ScreenSize.fSize_20()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ScreenSize.fSize_15()),
              Container(
                width: ScreenSize.horizontalBlockSize! * 75,
                child: controllerTEXT.getText(
                    name, ScreenSize.fSize_18(), FontWeight.w500),
              ),
              SizedBox(height: ScreenSize.fSize_10()),
              Container(
                width: ScreenSize.horizontalBlockSize! * 80,
                child:
                    controllerDISCRIPTEXT.getText(add, ScreenSize.fSize_15()),
              ),
              SizedBox(height: ScreenSize.fSize_6()),

              Container(
                child: Text(
                  date,
                  style: GoogleFonts.anekTamil(
                      color: const Color(0xffA2866F),
                      fontSize: ScreenSize.fSize_14(),
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: ScreenSize.fSize_6()),
              Divider(
                color: const Color(0xffA48F86),
                thickness: 1,
                endIndent: ScreenSize.fSize_20(),
              ),
              SizedBox(height: ScreenSize.fSize_6()),
              Row(
                children: [
                  SizedBox(width: ScreenSize.fSize_15()),
                  GestureDetector(
                    onTap: navigation,
                    child:   controllerIMAGETEXT.gethight(
                        "asset/image/Icons/Navigation.png", "Navigation"),
                  ),

                  controllerWIDGHT.gethight(),
                  Container(
                      height: ScreenSize.fSize_30(),
                      color: const Color(0xffA48F86),
                      width: ScreenSize.horizontalBlockSize! * 0.4),
                  controllerWIDGHT.gethight(),
                  GestureDetector(
                    onTap: copy,
                    child: controllerIMAGETEXT.gethight(
                        "asset/image/Icons/Copy.png", "Copy"),
                  ),
                  controllerWIDGHT.gethight(),
                  Container(
                      height: ScreenSize.fSize_30(),
                      color: const Color(0xffA48F86),
                      width: ScreenSize.horizontalBlockSize! * 0.4),
                  controllerWIDGHT.gethight(),
                  GestureDetector(
                    onTap: share,
                    child: controllerIMAGETEXT.gethight(
                        "asset/image/Icons/Share.png", "Share"),
                  ),
                  controllerWIDGHT.gethight(),
                  Container(
                      height: ScreenSize.fSize_30(),
                      color: const Color(0xffA48F86),
                      width: ScreenSize.horizontalBlockSize! * 0.4),
                  controllerWIDGHT.gethight(),
                  GestureDetector(
                    onTap: delet,
                    child: controllerIMAGETEXT.gethight(
                        "asset/image/Icons/Delete.png", "Delete"),
                  )
                ],
              ),
              SizedBox(height: ScreenSize.fSize_15()),
            ],
          ),
        ),
      ),
    );
  }
}

class WIDGHT extends GetxController {
  gethight() {
    return SizedBox(width: ScreenSize.fSize_23());
  }
}

class IMAGETEXT extends GetxController {
  gethight(image, text) {
    return Container(
      child: Column(
        children: [
          controllerImage.getImage(image, ScreenSize.fSize_18()),
          SizedBox(height: ScreenSize.fSize_6()),
          controllerTEXT.getText(text, ScreenSize.fSize_10(), FontWeight.w400)
        ],
      ),
    );
  }
}

class hight extends GetxController {
  gethight() {
    return SizedBox(
      height: ScreenSize.horizontalBlockSize! * 5,
    );
  }
}

class width extends GetxController {
  getwidth() {
    return SizedBox(
      width: ScreenSize.horizontalBlockSize! * 4,
    );
  }
}

class width2 extends GetxController {
  getwidth() {
    return SizedBox(
      width: ScreenSize.horizontalBlockSize! * 9,
    );
  }
}

class textfiledcontroller extends GetxController {
  gettextfiled(text, controller, onchange) {
    return Padding(
      padding: EdgeInsets.only(
          left: ScreenSize.fSize_23(), right: ScreenSize.fSize_23()),
      child: Container(
        height: ScreenSize.horizontalBlockSize! * 12,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xff3A1808),
            ),
            borderRadius: BorderRadius.circular(50)),
        child: Stack(
          children: [
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: ScreenSize.horizontalBlockSize! * 16),
                      child: TextField(
                        controller: controller,
                        onChanged: onchange,
                        decoration: InputDecoration.collapsed(
                            hintText: text,
                            hintStyle: GoogleFonts.anekTamil(
                                fontSize: ScreenSize.fSize_16(),
                                color: const Color(0xffA48F86),
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ]),
            ),
            Row(
              children: [
                SizedBox(width: ScreenSize.fSize_20()),
                controllerImage.getImage(
                    'asset/image/Icons/Search.png', ScreenSize.fSize_28())
              ],
            )
          ],
        ),
      ),
    );
  }
}

class virticalcontroller extends GetxController {
  getvirtical() {
    return Container(
        height: ScreenSize.fSize_50(),
        color: const Color(0xffE2D6D1),
        width: ScreenSize.horizontalBlockSize! * 0.2);
  }
}

class imagecontainercontroller extends GetxController {
  getimage(context, onTap, image, text, distext) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          // height: ScreenSize.horizontalBlockSize! * 26,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xffFBDECA),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xffFBDECA), Color(0xffFEEDC4)]),
          ),
          child: Column(
            children: [
              SizedBox(height: ScreenSize.fSize_13()),
              Row(
                children: [
                  SizedBox(width: ScreenSize.fSize_20()),
                  controllerCircle.getcircle(
                      context, ScreenSize.horizontalBlockSize! * 6, image),
                  SizedBox(width: ScreenSize.fSize_16()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: ScreenSize.fSize_20()),
                      controllerTEXT.getText(
                          text,
                          ScreenSize.horizontalBlockSize! * 5.6,
                          FontWeight.w500),
                      SizedBox(height: ScreenSize.fSize_6()),
                      controllerDISCRIPTEXT.getText(
                          distext, ScreenSize.fSize_13()),
                    ],
                  )
                ],
              ),
              SizedBox(height: ScreenSize.fSize_13()),
            ],
          ),
        ),
      ),
    );
  }
}

class ramcontainer extends GetxController {
  gethight(text1, text2, text3, text4) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color(0xff3A1808),
              ),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              SizedBox(height: ScreenSize.fSize_20()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      controllerblackText222.getText(
                          text1, ScreenSize.fSize_16()),
                      SizedBox(height: ScreenSize.fSize_8()),
                      controllerDISCRIPTEXT.getText(
                          text2, ScreenSize.fSize_16()),
                    ],
                  ),
                  controllervirtical.getvirtical(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      controllerblackText222.getText(
                          text3, ScreenSize.fSize_16()),
                      SizedBox(height: ScreenSize.fSize_8()),
                      controllerDISCRIPTEXT.getText(
                          text4, ScreenSize.fSize_16()),
                    ],
                  ),
                ],
              ),
              SizedBox(height: ScreenSize.fSize_20()),
            ],
          )),
    );
  }
}

class divider22 extends GetxController {
  gethight() {
    return Divider(
      color: const Color(0xffE2D6D1),
      thickness: 1.5,
      indent: ScreenSize.fSize_20(),
      endIndent: ScreenSize.fSize_16(),
    );
  }
}

class h extends GetxController {
  gethight() {
    return SizedBox(
      height: ScreenSize.horizontalBlockSize! * 0.2,
    );
  }
}

class divider extends GetxController {
  getdivider() {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Divider(
        color: const Color(0xffE2D6D1),
        thickness: 1,
        indent: ScreenSize.fSize_16(),
        endIndent: ScreenSize.fSize_16(),
      ),
    );
  }
}

class blackContaincontroller extends GetxController {
  getcontain(child) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xff3A1808),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: child,
      ),
    );
  }
}

class Imagecontroller extends GetxController {
  getImage(image, size) {
    return Center(
      child: Image(
        image: AssetImage(image),
        height: size,
      ),
    );
  }
}

class hedlinecontroller extends GetxController {
  getImage(text) {
    return Row(
      children: [
        SizedBox(width: ScreenSize.fSize_15()),
        Container(
          width: ScreenSize.horizontalBlockSize! * 1.3,
          height: ScreenSize.fSize_30(),
          decoration: BoxDecoration(
              color: const Color(0xff3A1808),
              borderRadius: BorderRadius.circular(20)),
        ),
        SizedBox(width: ScreenSize.fSize_15()),
        controllerTEXT.getText(text, ScreenSize.fSize_20(), FontWeight.w600)
      ],
    );
  }
}

class Textcontroller extends GetxController {
  getText(text, size, wight) {
    return Text(
      text,
      style: GoogleFonts.anekTamil(
          color: const Color(0xff3A1808), fontSize: size, fontWeight: wight),
    );
  }
}

class TextDcontroller extends GetxController {
  getText(text, size) {
    return Container(
      child: Text(
        text,
        style: GoogleFonts.anekTamil(
            color: const Color(0xffA2866F),
            fontSize: size,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}

class TextD2controller extends GetxController {
  getText(text) {
    return Container(
      // color: Colors.black12,
      width: ScreenSize.horizontalBlockSize! * 34,
      child: Text(
        text,
        style: GoogleFonts.anekTamil(
            color: const Color(0xffA2866F),
            fontSize: ScreenSize.fSize_15(),
            fontWeight: FontWeight.w500),
      ),
    );
  }
}

class Textcolorcontroller extends GetxController {
  getText(text) {
    return Container(
      child: Text(
        text,
        style: GoogleFonts.anekTamil(
            color: const Color(0xffD14808),
            fontSize: ScreenSize.fSize_16(),
            fontWeight: FontWeight.w500),
      ),
    );
  }
}

class blackTextDcontroller extends GetxController {
  getText(text, size) {
    return Container(
      // color: Colors.black12,
      width: ScreenSize.fSize_120(),
      child: Text(
        text,
        style: GoogleFonts.anekTamil(
            color: Colors.black, fontSize: size, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class blackText2Dcontroller extends GetxController {
  getText(text, size) {
    return Container(
      // color: Colors.black12,
      width: ScreenSize.horizontalBlockSize! * 44,
      child: Text(
        text,
        style: GoogleFonts.anekTamil(
            color: Colors.black, fontSize: size, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class blackTextD222controller extends GetxController {
  getText(text, size) {
    return Container(
      child: Text(
        text,
        style: GoogleFonts.anekTamil(
            color: Colors.black, fontSize: size, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class ContainerController extends GetxController {
  getcontainer(context, onTap, child) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: ScreenSize.verticalBlockSize! * 15.5,
          width: ScreenSize.horizontalBlockSize! * 65,
          decoration: BoxDecoration(
              color: const Color(0xffFBDECA),
              borderRadius: const BorderRadius.all(Radius.circular(100)),
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
          child: child),
    );
  }
}

class getstartController extends GetxController {
  getgetstart(context, ontap, image, text) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          CircleAvatar(
            minRadius: ScreenSize.horizontalBlockSize! * 7.3,
            backgroundColor: Colors.white,
            child: Center(
              child: controllerImage.getImage(image, ScreenSize.fSize_28()),
            ),
            // backgroundImage: AssetImage('asset/image/Icons/Rate.png'),
          ),
          SizedBox(height: ScreenSize.fSize_10()),
          controllerTEXT.getText(text, ScreenSize.fSize_15(), FontWeight.w400)
        ],
      ),
    );
  }
}

class AppbarController extends GetxController {
  getappbar(text, ontap) {
    return AppBar(
        leading: GestureDetector(
          onTap: ontap,
          child: Center(
              child: Image(
            image: const AssetImage('asset/image/Icons/back.png'),
            width: ScreenSize.fSize_30(),
          )),
        ),
        title: Text(text,
            style: GoogleFonts.anekTamil(
                color: const Color(0xff3A1808),
                fontWeight: FontWeight.w500,
                fontSize: ScreenSize.horizontalBlockSize! * 5.2)),
        backgroundColor: const Color(0xffFAF4F0),
        toolbarHeight: ScreenSize.fSize_80(),
        elevation: 0);
  }
}

class MContainerController extends GetxController {
  getcontainer(context, onTap, hight, redius, child) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: hight,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xffFBDECA),
            borderRadius: BorderRadius.all(Radius.circular(redius)),
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xffFBDECA), Color(0xffFEEDC4)]),
          ),
          child: child,
        ),
      ),
    );
  }
}

class circleController extends GetxController {
  getcircle(context, csize, image) {
    return CircleAvatar(
      minRadius: csize,
      backgroundColor: Colors.white,
      child: Center(
        child: controllerImage.getImage(image, ScreenSize.fSize_25()),
      ),
    );
  }
}

class minicontainController extends GetxController {
  getcontain(context, ontap, hight, wight, image, text, text2) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: hight,
        width: wight,
        decoration: const BoxDecoration(
          color: Color(0xffFBDECA),
          borderRadius: BorderRadius.all(Radius.circular(25)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xffFBDECA), Color(0xffFEEDC4)]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  controllerCircle.getcircle(
                      context, ScreenSize.horizontalBlockSize! * 7, image),
                ],
              ),
            ),
            SizedBox(height: ScreenSize.fSize_10()),
            Padding(
                padding: EdgeInsets.only(left: ScreenSize.fSize_10()),
                child: controllerTEXT.getText(
                    text, ScreenSize.fSize_20(), FontWeight.w500)),
            SizedBox(height: ScreenSize.fSize_8()),
            Padding(
              padding: EdgeInsets.only(left: ScreenSize.fSize_10()),
              child:
                  controllerDISCRIPTEXT.getText(text2, ScreenSize.fSize_12()),
            )
          ],
        ),
      ),
    );
  }
}

class minicontain2Controller extends GetxController {
  getcontain(context, hight, wight, image, text, value, onChanged) {
    return Container(
      height: hight,
      width: wight,
      decoration: const BoxDecoration(
        color: Color(0xffFBDECA),
        borderRadius: BorderRadius.all(Radius.circular(25)),
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xffFBDECA), Color(0xffFEEDC4)]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: ScreenSize.fSize_10()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                controllerCircle.getcircle(
                    context, ScreenSize.horizontalBlockSize! * 7, image),
              ],
            ),
          ),
          SizedBox(height: ScreenSize.fSize_10()),
          Padding(
              padding: EdgeInsets.only(left: ScreenSize.fSize_10()),
              child: controllerTEXT.getText(
                  text, ScreenSize.fSize_20(), FontWeight.w500)),
          SizedBox(height: ScreenSize.fSize_8()),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
                activeColor: const Color(0xff886c54),
                thumbColor: Colors.white,
                trackColor: const Color(0xff886c54),
                value: value,
                onChanged: onChanged),
          ),
        ],
      ),
    );
  }
}

class ColorContainController extends GetxController {
  getcontain(context, onTap, color, image, text) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: ScreenSize.horizontalBlockSize! * 39,
        width: ScreenSize.fSize_110(),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: color),
        ),
        child: Column(
          children: [
            SizedBox(height: ScreenSize.fSize_18()),
            Row(
              children: [
                SizedBox(width: ScreenSize.fSize_12()),
                Container(
                  width: ScreenSize.horizontalBlockSize! * 14,
                  height: ScreenSize.horizontalBlockSize! * 14,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
                      border:
                          Border.all(color: const Color(0xff3A1808), width: 1)),
                  child: Center(
                      child: controllerImage.getImage(
                          image, ScreenSize.fSize_28())),
                ),
              ],
            ),
            SizedBox(height: ScreenSize.fSize_10()),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: ScreenSize.fSize_15()),
                controllerTEXT.getText(
                    text, ScreenSize.fSize_15(), FontWeight.w500)
              ],
            )
          ],
        ),
      ),
    );
  }
}

Scaffold Delet(BuildContext context, ontap) {
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
                  SizedBox(height: ScreenSize.fSize_13()),
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
                        border:
                            Border.all(color: const Color(0xff3A1808), width: 1.5)),
                    child: Center(
                        child: controllerImage.getImage(
                            'asset/image/Icons/Delete.png',
                            ScreenSize.fSize_28())),
                  ),
                  SizedBox(height: ScreenSize.fSize_25()),
                  Padding(
                    padding: EdgeInsets.only(
                        left: ScreenSize.horizontalBlockSize! * 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controllerTEXT.getText(
                            'Want to Delete ?',
                            ScreenSize.horizontalBlockSize! * 6,
                            FontWeight.w700)
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenSize.fSize_6()),
                  Padding(
                    padding: EdgeInsets.only(
                        right: ScreenSize.horizontalBlockSize! * 14,
                        left: ScreenSize.horizontalBlockSize! * 6),
                    child: controllerDISCRIPTEXT.getText(
                        """Are you sure want to delete this content ? you will not able to recover them.""",
                        ScreenSize.horizontalBlockSize! * 3.8),
                  ),
                  SizedBox(height: ScreenSize.fSize_30()),
                  GestureDetector(
                    onTap: ontap,
                    child: Container(
                      height: ScreenSize.verticalBlockSize! * 11,
                      width: ScreenSize.horizontalBlockSize! * 40,
                      decoration: BoxDecoration(
                          color: const Color(0xffFBDECA),
                          borderRadius: const BorderRadius.all(Radius.circular(100)),
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
                        child: controllerTEXT.getText('Delete Item',
                            ScreenSize.fSize_16(), FontWeight.w600),
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Scaffold location(
    BuildContext context, controller, onTap, ontap2, addres, date) {
  return Scaffold(
    backgroundColor: Colors.transparent,
    body: Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(23),
              child: Center(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffFAF4F0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: ScreenSize.fSize_30()),
                          controllerTEXT.getText("Parking Location",
                              ScreenSize.fSize_23(), FontWeight.w600),
                          SizedBox(height: ScreenSize.fSize_28()),
                          Padding(
                            padding: EdgeInsets.only(
                                left: ScreenSize.fSize_20(),
                                right: ScreenSize.fSize_20()),
                            child: Container(
                              height: ScreenSize.horizontalBlockSize! * 14,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Color(0xffFAF4F0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(11)),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xffFBDECA),
                                      Color(0xffFEEDC4)
                                    ]),
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: ScreenSize
                                                        .horizontalBlockSize! *
                                                    4),
                                            child: TextField(
                                              controller: controller,
                                              onChanged: (value) {},
                                              decoration: InputDecoration
                                                  .collapsed(
                                                      hintText:
                                                          "Enter Parking Title",
                                                      hintStyle: GoogleFonts
                                                          .anekTamil(
                                                              fontSize: ScreenSize
                                                                  .fSize_15(),
                                                              color: const Color(
                                                                  0xffA48F86),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                            ),
                                          ),
                                        ]),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: ScreenSize.fSize_200()),
                                      Container(
                                          height:
                                              ScreenSize.horizontalBlockSize! *
                                                  9,
                                          width:
                                              ScreenSize.horizontalBlockSize! *
                                                  0.3,
                                          color: const Color(0xffA48F86)),
                                      SizedBox(width: ScreenSize.fSize_17()),
                                      controllerImage.getImage(
                                          'asset/image/Icons/parking location.png',
                                          ScreenSize.fSize_34())
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: ScreenSize.fSize_17()),
                                Row(
                                  children: [
                                    SizedBox(width: ScreenSize.fSize_20()),
                                    controllerImage.getImage(
                                        "asset/image/Icons/location.png",
                                        ScreenSize.fSize_28()),
                                    SizedBox(width: ScreenSize.fSize_18()),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: ScreenSize.fSize_8()),
                                        Container(
                                          width:
                                              ScreenSize.horizontalBlockSize! *
                                                  59,
                                          child: controllerTEXT.getText(
                                              addres,
                                              ScreenSize.horizontalBlockSize! *
                                                  4.1,
                                              FontWeight.w500),
                                        ),
                                        SizedBox(height: ScreenSize.fSize_6()),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: ScreenSize.fSize_17()),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(width: ScreenSize.fSize_20()),
                              controllerImage.getImage(
                                  "asset/image/Icons/calendar.png",
                                  ScreenSize.fSize_25()),
                              SizedBox(width: ScreenSize.fSize_18()),
                              controllerTEXT.getText(
                                  date,
                                  ScreenSize.horizontalBlockSize! * 4.4,
                                  FontWeight.w500),
                            ],
                          ),
                          SizedBox(height: ScreenSize.fSize_34()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: onTap,
                                child: Container(
                                    height: ScreenSize.verticalBlockSize! * 13,
                                    width: ScreenSize.horizontalBlockSize! * 32,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFBDECA),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(100)),
                                        gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xffFBDECA),
                                              Color(0xffFEEDC4)
                                            ]),
                                        border: Border.all(
                                            color: const Color(0xff3A1808)),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Color(0xff3A1808),
                                              blurRadius: 1,
                                              offset: Offset(0, 1.5))
                                        ]),
                                    child: Center(
                                      child: Text("No",
                                          style: GoogleFonts.anekTamil(
                                              color: const Color(0xff351907),
                                              fontSize: ScreenSize.fSize_16(),
                                              fontWeight: FontWeight.w500)),
                                    )),
                              ),
                              GestureDetector(
                                onTap: ontap2,
                                child: Container(
                                    height: ScreenSize.verticalBlockSize! * 13,
                                    width: ScreenSize.horizontalBlockSize! * 32,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFBDECA),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(100)),
                                        gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xffFBDECA),
                                              Color(0xffFEEDC4)
                                            ]),
                                        border: Border.all(
                                            color: const Color(0xff3A1808)),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Color(0xff3A1808),
                                              blurRadius: 1,
                                              offset: Offset(0, 1.5))
                                        ]),
                                    child: Center(
                                      child: Text("Yes",
                                          style: GoogleFonts.anekTamil(
                                              color: const Color(0xff351907),
                                              fontSize: ScreenSize.fSize_16(),
                                              fontWeight: FontWeight.w500)),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(height: ScreenSize.fSize_20()),
                        ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

var IMAGES = [
  "asset/image/Icons/Near by place icon/Police Station.png",
  "asset/image/Icons/Near by place icon/Government Office.png",
  "asset/image/Icons/Near by place icon/Railway Station.png",
  "asset/image/Icons/Near by place icon/Veterinary Care.png",
  "asset/image/Icons/Near by place icon/Hospital.png",
  "asset/image/Icons/Near by place icon/Bus stop.png",
  "asset/image/Icons/Near by place icon/Bank.png",
  "asset/image/Icons/Near by place icon/Airport.png",
  "asset/image/Icons/Near by place icon/Parking.png",
  "asset/image/Icons/Near by place icon/Restaurant.png",
  "asset/image/Icons/Near by place icon/Post Office.png",
  "asset/image/Icons/Near by place icon/Park.png",
  "asset/image/Icons/Near by place icon/Pharmacy.png",
  "asset/image/Icons/Near by place icon/Clothing Store.png",
  "asset/image/Icons/Near by place icon/ATM.png",
].obs;
var NAME = [
  """Police 
Station""",
  """Government
Office""",
  """Railway 
Station""",
  """Veterinary
Care""",
  """Hospital""",
  """Bus Stop""",
  """Bank""",
  """Airport""",
  """Parking""",
  """Restaurant""",
  """Post Office""",
  """Park""",
  """Pharmacy""",
  """Clothing 
Store""",
  """ATM""",
].obs;
List nearby = [
  "Police Station",
  "Government Office",
  "Railway Station",
  "Veterinary Care",
  "Hospital",
  "Bus Stop",
  "Bank",
  "Airport",
  "Parking",
  "Restaurant",
  "Post Office",
  "Park",
  "Pharmacy",
  "Clothing Store",
  "ATM",
];
