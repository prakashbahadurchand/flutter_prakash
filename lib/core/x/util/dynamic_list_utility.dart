
import 'dart:convert';

class ItemData {
  final String firstText;
  final String secondText;

  ItemData({required this.firstText, required this.secondText});

  factory ItemData.fromJson(Map<String, dynamic> json) {
    return ItemData(
      firstText: json['firstText'] as String,
      secondText: json['secondText'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstText': firstText,
      'secondText': secondText,
    };
  }

  static String blankItem() {
    return '''
    [
      {"firstText": " ", "secondText": " "}
    ]
    ''';
  }
}

String itemsToJsonString(List<ItemData> items) {
  List<Map<String, dynamic>> jsonList = [];
  for (var item in items) {
    jsonList.add(item.toJson());
  }
  return json.encode(jsonList);
}

List<ItemData> jsonStringToItems(String jsonString) {
  final List<dynamic> jsonList = jsonDecode(jsonString);
  final List<ItemData> items = [];

  for (var jsonItem in jsonList) {
    items.add(ItemData.fromJson(jsonItem));
  }

  return items;
}