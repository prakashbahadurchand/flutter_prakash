import 'dart:convert';
import 'dart:developer';

extension StringExt on String {
  String format(List<dynamic> args) {
    String result = this;
    for (int i = 0; i < args.length; i++) {
      result = result.replaceAllMapped(
        RegExp(r'\{' + i.toString() + r'\}'),
        (match) => args[i].toString(),
      );
    }
    return result;
  }

  String ifEmpty(String another) => isEmpty ? another : this;

  String toPrettyJson() {
    return "\n${"=" * 100}\n|| Pretty List ||:\n${"-" * 100}\n${const JsonEncoder.withIndent("\t").convert(jsonDecode(this))}\n${"-" * 100}\n";
  }

  void toPrintPrettyJson() {
    try {
      log(toPrettyJson());
    } catch (e) {
      log("$e | $this");
    }
  }

  String toFileNameExt() {
    final Uri uri = Uri.parse(this);
    return uri.pathSegments.last;
  }


/*String toLocaleDigits() {
    final numbers = RegExp(r'\d+');
    return input.replaceAllMapped(numbers, (match) {
      final nepaliNumber = NepaliUnicode.convert(match.group(0)!);
      return nepaliNumber;
    });
  }*/
}

extension StringNullExt on String? {

  // Replace with anotherText if null or empty
  String et({String another = ""}) => this ?? another;

  static final List<String> arabicNumbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  static final List<String> nepaliUnicodeNumbers = ['०', '१', '२', '३', '४', '५', '६', '७', '८', '९'];

  String toNepaliDigit() {
    if (this == null || this?.isEmpty == true) return "";

    final arabicNumberString = toString();
    final StringBuffer nepaliUnicodeNumber = StringBuffer();

    for (int i = 0; i < arabicNumberString.length; i++) {
      final index = arabicNumbers.indexOf(arabicNumberString[i]);
      if (index != -1) {
        nepaliUnicodeNumber.write(nepaliUnicodeNumbers[index]);
      } else {
        nepaliUnicodeNumber.write(arabicNumberString[i]);
      }
    }
    return nepaliUnicodeNumber.toString();
  }

}