import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedHistory {
  SharedHistory._();
  static const String _key = 'HISTORY_KEY';
  static final List<String> _history =[];

  static Future<bool> saveMap(Map map) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _history.add(jsonEncode(map));
      return await prefs.setStringList(_key, _history);
    } catch (e) {
      print('Error saving list: $e');
      return false;
    }
  }

  static Future<List> getList() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? encodedList = prefs.getStringList(_key);
      List dataList = encodedList!.map((e) => jsonDecode(e)).toList();
      return dataList;
    } catch (e) {
      print('Error retrieving list: $e');
      return [];
    }
  }

  static Future clearList() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? jsonList = prefs.getStringList(_key);
      jsonList!.clear();
      _history.clear();
    } catch (e) {
      print('Error clear list: $e');
      return [];
    }
  }
}
