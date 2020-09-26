import 'dart:convert';
import 'dart:io';

Future<List<List<String>>> readCSV(File file) async {
  var ret = List<List<String>>();
  var fileContents = await file.readAsLines(encoding: latin1);
  for (var line in fileContents) {
    ret.add(line.split(';'));
  }
  return ret;
}

Future<void> writeCSV(File file, List<List<String>> data) async {
  var sink = file.openWrite();
  for (var dataRow in data) {
    sink.writeAll(dataRow, ";");
    sink.write("\n");
  }
  await sink.flush();
  await sink.close();
}
