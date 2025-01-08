//default value
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kDefaultPadding = 20.0;
const kHalfDefaultPadding = 10.0;

extension SizedBoxExtension on int {
  Widget get toHeight {
    return SizedBox(
      height: toDouble(),
    );
  }

  Widget get toWidth {
    return SizedBox(
      width: toDouble(),
    );
  }
}

//=============== REGEX =============\\

class RegexPatterns {
//validation for email
  static const String emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))\s*$';
//Hide Digits pattern
  static const String hideDigitsPattern = r'\d';

  static const String loginPasswordPattern = r'^.{8,}$';

//validation for mobile
// static const String mobilePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
// static const String mobilePattern = r'^\+?[0-9]{1,3}?[0-9]{10}$';
  static const String mobilePattern = r'^[+\-\(\)\s\d]{1,14}$';

//username pattern
  static const String namePattern = r'^.{3,}$'; //Min. of 3 characters

  static const String nigerianPhoneMobilePattern =
      r'^(\+?234|0)?[789]\d{9}$'; //Must be integers

//password pattern
  static const String passwordPattern =
      r'^(?=.*[A-Za-z0-9])(?=.*[^A-Za-z0-9])(?=.*\d).{8,}$';
//referral Code pattern
  static const String referralCodePattern = r'^.{6}$';

//validation for street address
  static const String streetAddressPattern = r'^\d+\s+[a-zA-Z0-9\s.-]+$';

  static const String zipCodePattern = r"^\d{6}(?:-\d{4})?$";

  static const String nairaSign = '\u20A6';

  static String phoneNumberPattern = r'^\(\d{3}\) \d{3}-\d{4}$';
}

class ConvertToType {
  static String convertToCurrency(String e) {
    String newStr = e.replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[0]},");
    return newStr;
  }

  static String convertToDateString(String inputString) {
    return inputString.replaceFirst(RegExp(r"\T.*"), "");
  }
}

class FormatToType {
  //===================== Number format ==========================\\
  static String doubleFormattedText(double value) {
    final numberFormat = NumberFormat('#,##0');
    return numberFormat.format(value);
  }

  static String doubleFormattedTextWithDecimal(double value) {
    final numberFormat = NumberFormat('#,##0.00');
    return numberFormat.format(value);
  }

  static String format12HrTime(DateTime time) {
    // Format the time as '1:20PM'
    String formattedTime = DateFormat.jm().format(time);

    return formattedTime;
  }

  static String formatDate(DateTime date) {
    // Format the date as '23 Feb 2020'
    String formattedDate = DateFormat('MMM dd, y').format(date);

    return formattedDate;
  }
}

defaultTextStyle({
  Color? color,
  Paint? background,
  Color? backgroundColor,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  double? decorationThickness,
  String? debugLabel,
  String? fontFamily,
  double? fontSize,
  FontStyle? fontStyle,
  FontWeight? fontWeight,
  double? letterSpacing,
}) =>
    TextStyle(
      color: color ?? Colors.grey,
      background: background,
      backgroundColor: backgroundColor,
      decoration: decoration ?? TextDecoration.none,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      debugLabel: debugLabel,
      fontFamily: fontFamily ?? "Aeonik Trials",
      fontSize: fontSize ?? 14.0,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w600,
      letterSpacing: letterSpacing ?? .60,
    );
