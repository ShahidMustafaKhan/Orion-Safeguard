import 'package:flutter/cupertino.dart';

import '../../steps_page/step_1.dart';
import '../../steps_page/step_10.dart';
import '../../steps_page/step_11.dart';
import '../../steps_page/step_2.dart';
import '../../steps_page/step_3.dart';
import '../../steps_page/step_4.dart';
import '../../steps_page/step_5.dart';
import '../../steps_page/step_6.dart';
import '../../steps_page/step_7.dart';
import '../../steps_page/step_8.dart';
import '../../steps_page/step_9.dart';

Widget getFormForStep(int step) {
  switch (step) {
    case 0:
      return const Step1();
    case 1:
      return const Step2();
    case 2:
      return const Step3();
    case 3:
      return const Step4();
    case 4:
      return const Step5();
    case 5:
      return const Step6();
    case 6:
      return const Step7();
    case 7:
      return const Step8();
    case 8:
      return const Step9();
    case 9:
      return const Step10();
    case 10:
      return const Step11();

    default:
      return Container();
  }
}

List<String> relationship() {
  return ["Father", "Mom", "Brother", "Sister", "Uncle", "Son"];
}

List<String> placeOfEntryInUK() {
  return [
    // Airports
    "Heathrow Airport (LHR) - London",
    "Gatwick Airport (LGW) - London",
    "Stansted Airport (STN) - London",
    "Luton Airport (LTN) - London",
    "City Airport (LCY) - London",
    "Manchester Airport (MAN) - Manchester",
    "Birmingham Airport (BHX) - Birmingham",
    "Edinburgh Airport (EDI) - Edinburgh",
    "Glasgow Airport (GLA) - Glasgow",
    "Bristol Airport (BRS) - Bristol",
    "Newcastle Airport (NCL) - Newcastle",
    "Liverpool John Lennon Airport (LPL) - Liverpool",
    "Belfast International Airport (BFS) - Belfast",
    "Leeds Bradford Airport (LBA) - Leeds",
    "East Midlands Airport (EMA) - Derby/Nottingham",
    "Aberdeen Airport (ABZ) - Aberdeen",

    // Seaports
    "Dover Port - Kent",
    "Port of Southampton - Southampton",
    "Port of Felixstowe - Suffolk",
    "Port of Hull - Yorkshire",
    "Port of Liverpool - Liverpool",
    "Port of Tyne - Newcastle",
    "Port of Plymouth - Plymouth",
    "Port of Harwich - Essex",

    // Rail Entry (Eurostar)
    "St Pancras International - London",
    "Ashford International - Kent",
    "Ebbsfleet International - Kent",
  ];
}

List<String> instituteType() {
  return [
    "Matriculation",
    "Intermediate",
    "PostGraduate",
    "M.Phill",
    "PHD",
    "Diploma"
  ];
}

List<String> ethnicOrigin() => [
      "British",
      "African",
      "Asian",
      "Caribbean",
      "Chinese",
      "White",
      "Other",
    ];

List<String> positionsList() =>
    ["Father", "Mom", "Brother", "Sister", "Uncle", "Son"];
