import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kMainColor = Color(0xFF9B03E6);
const kSecondColor = Color.fromARGB(255, 60, 87, 238);
const kGreyTextColor = Color(0xFF7E818C);
const kDarkTextColor = Color(0xFF303235);
const kBorderColorTextField = Color(0xFFC2C2C2);
const kDarkWhite = Color(0xFFF1F7F7);
const kTitleColor = Color(0xFF2E2E46);
final kTextStyle = GoogleFonts.roboto(
  color: Colors.white,
);
const kButtonDecoration = BoxDecoration(
  color: kMainColor,
  borderRadius: BorderRadius.all(
    Radius.circular(40.0),
  ),
);

const base_url = "http://192.168.8.7:3000/";

final textTheme = TextTheme(
  headline1: GoogleFonts.roboto(
      fontWeight: FontWeight.w700, fontSize: 58, height: 1.17),
  headline2: GoogleFonts.roboto(
      fontWeight: FontWeight.w500, fontSize: 42, height: 1.33),
  headline3: GoogleFonts.roboto(
      fontWeight: FontWeight.w700, fontSize: 34, height: 1.35),
  headline4: GoogleFonts.roboto(
      fontWeight: FontWeight.w700, fontSize: 24, height: 1.33),
  headline5: GoogleFonts.roboto(
      fontWeight: FontWeight.w700, fontSize: 20, height: 1.4),
  headline6: GoogleFonts.roboto(
      fontWeight: FontWeight.w400, fontSize: 20, height: 1.4),
  subtitle1: GoogleFonts.roboto(
      fontWeight: FontWeight.w700, fontSize: 16, height: 1.5),
  subtitle2: GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 12,
    height: 1.71,
    color: kDarkTextColor,
  ),
  // subtitle3: GoogleFonts.roboto(
  //     fontWeight: FontWeight.w700, fontSize: 16, height: 1.5),
  bodyText1: GoogleFonts.firaSans(
      fontWeight: FontWeight.w400, fontSize: 16, height: 1.75),
  bodyText2: GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.71,
  ),
  button: GoogleFonts.roboto(
      fontWeight: FontWeight.w500, fontSize: 16, height: 1.25),
);

const kInputDecoration = InputDecoration(
  hintStyle: TextStyle(color: kBorderColorTextField),
  filled: true,
  fillColor: Colors.white70,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: kBorderColorTextField, width: 2),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(6.0)),
    borderSide: BorderSide(color: kBorderColorTextField, width: 2),
  ),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: kBorderColorTextField),
  );
}

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);
