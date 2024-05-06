import 'package:flutter/services.dart';

Future<String> readJsonFile2(String file) async {
  var input = await rootBundle.loadString('$filePath$file');
  return input;
}

const String filePath = 'assets/json/';
