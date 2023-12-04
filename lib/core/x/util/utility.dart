import 'dart:convert';
import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';

import '../config/app_globals.dart';

class Utility {
  static Future<bool> checkConnectivity() async {
    var result = await (Connectivity().checkConnectivity());
    return (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi);
  }

}

List<String> getOptionPairs(String pairSide) {
  if (pairSide == "Y" || pairSide == "N") {
    return ["हो", "होइन"];
  } else if (pairSide == "हो" || pairSide == "होइन") {
    return ["हो", "होइन"];
  } else if (pairSide == "ठिक छ" || pairSide == "ठिक छैन") {
    return ["ठिक छ", "ठिक छैन"];
  } else if (pairSide == "सही" || pairSide == "गलत") {
    return ["सही", "गलत"];
  } else if (pairSide == "भए" || pairSide == "भएन") {
    return ["भए", "भएन"];
  } else if (pairSide == "भएको" || pairSide == "नभएको") {
    return ["भएको", "नभएको"];
  } else if (pairSide == "राखेको" || pairSide == "नराखेको") {
    return ["राखेको", "नराखेको"];
  } else if (pairSide == "गरेको छ" || pairSide == "गरेको छैन") {
    return ["गरेको छ", "गरेको छैन"];
  } else if (pairSide == "हुन्छ" || pairSide == "हुदैन") {
    return ["हुन्छ", "हुदैन"];
  } else if (pairSide == "छैन" || pairSide == "छ") {
    return ["छैन", "छ"];
  } else if (pairSide == "सत्य" || pairSide == "असत्य") {
    return ["सत्य", "असत्य"];
  } else if (pairSide == "मिल्छ" || pairSide == "मिल्दैन") {
    return ["मिल्छ", "मिल्दैन"];
  } else if (pairSide == "सकिन्छ" || pairSide == "सक्दैन") {
    return ["सकिन्छ", "सक्दैन"];
  } else {
    return ["गरेको", "नगरेको"];
  }
}

String getSelectedOptionYN(String selected) {
  if (selected == "हो" || selected == "ठिक छ" || selected == "सही" ||
      selected == "भए" || selected == "भएको" || selected == "राखेको" ||
      selected == "गरेको छ" || selected == "गरेको" || selected == "हुन्छ" || selected == "छ" ||
      selected == "सत्य" || selected == "मिल्छ" || selected == "सकिन्छ") {
    return "Y";
  } else if (selected == "होइन" || selected == "ठिक छैन" || selected == "गलत" ||
      selected == "भएन" || selected == "नभएको" || selected == "नराखेको" ||
      selected == "गरेको छैन" || selected == "नगरेको" || selected == "हुदैन" || selected == "छैन" ||
      selected == "असत्य" || selected == "मिल्दैन" || selected == "सक्दैन") {
    return "N";
  } else {
    return ""; // Handle the case when none of the conditions match
  }
}

/*Color generateColorFromString(String input) {
  // Generate a hash code from the input string
  int hashCode = utf8.encode(input).fold(0, (out, value) => 31 * out + value);

  // Use the hash code to generate a color
  return Color(hashCode & 0x00FFFFFF).withOpacity(1.0);
}*/

Color generateColorFromStringFull(String input) {
  // Generate a hash code from the input string
  int hashCode = utf8.encode(input).fold(0, (out, value) => 31 * out + value);

  // Use the hash code to generate a color
  Color baseColor = Color(hashCode & 0x00FFFFFF).withOpacity(1.0);

  // Generate a shade 50 variant of the base color
  return generateShadeVariant(baseColor, 0);
}

Color generateShadeVariant(Color baseColor, double factor) {
  int red = (baseColor.red + (255 - baseColor.red) * factor).round();
  int green = (baseColor.green + (255 - baseColor.green) * factor).round();
  int blue = (baseColor.blue + (255 - baseColor.blue) * factor).round();

  return Color.fromARGB(
    baseColor.alpha,
    red.clamp(0, 255),
    green.clamp(0, 255),
    blue.clamp(0, 255),
  );
}

Color generateColorFromString(String input) {
  int hashCode = utf8.encode(input).fold(0, (out, value) => 31 * out + value);

  int red = (hashCode >> 16) & 0xFF;
  int green = (hashCode >> 8) & 0xFF;
  int blue = hashCode & 0xFF;

  int shadeRed = (red + ((255 - red) * 0.85)).round();
  int shadeGreen = (green + ((255 - green) * 0.85)).round();
  int shadeBlue = (blue + ((255 - blue) * 0.85)).round();

  return Color.fromRGBO(shadeRed, shadeGreen, shadeBlue, 1.0);
}

String generateNepaliFormattedFullDateTimeText(String dateTimeText) {
  final DateTime dateTime = DateTime.parse(dateTimeText);
  final NepaliDateTime nepaliDateTime = dateTime.toNepaliDateTime();

  final NepaliDateFormat nepaliDateFormat = NepaliDateFormat.yMMMMEEEEd(Language.nepali);
  final NepaliDateFormat nepaliTimeFormat = NepaliDateFormat.jms(Language.nepali);
  final String formattedDate = nepaliDateFormat.format(nepaliDateTime);
  final String formattedTime = nepaliTimeFormat.format(nepaliDateTime);
  return "$formattedDate $formattedTime";
}

enum CrudOperationType {
  get, create, update, delete
}

String getImageUrl(String? checkUrl) {
  if (checkUrl == null) {
    return AppGlobals.emptyImageUrl;
  } else if (checkUrl.isEmpty) {
    return AppGlobals.emptyImageUrl;
  } else {
    return checkUrl;
  }
}