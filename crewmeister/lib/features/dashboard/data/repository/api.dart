import 'dart:convert';
import 'dart:io';

const absencesPath = 'assets/json//absences.json';
const membersPath = 'assets/json//members.json';

Future<List<dynamic>> readJsonFile(String path) async {
  String content = await File(path).readAsString();
  Map<String, dynamic> data = jsonDecode(content);
  return data['payload'];
}

Future<List<dynamic>> absences() async {
  return await readJsonFile(absencesPath);
}

Future<List<dynamic>> members() async {
  return await readJsonFile(membersPath);
}
