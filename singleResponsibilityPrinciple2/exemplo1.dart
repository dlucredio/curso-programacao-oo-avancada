import 'dart:convert';
import 'dart:io';
import 'package:args/args.dart';

Future<List<List<String>>> readCSV(File file) async {
  var ret = List<List<String>>();
  var fileContents = await file.readAsLines(encoding: latin1);
  for (var line in fileContents) {
    ret.add(line.split(";"));
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

List<List<String>> transformData(List<List<String>> data) {
  var ret = List<List<String>>();
  for (var row in data) {
    if (row.length > 2) {
      ret.add([row[0], row[1], row[2]]);
    }
  }
  return ret;
}

main(List<String> args) async {
  var parser = ArgParser();
  parser.addFlag("help",
      abbr: "h", defaultsTo: false, help: "Displays this help message");
  parser.addOption("input", abbr: "i", help: "The input CSV file");
  parser.addOption("output", abbr: "o", help: "The output CSV file");
  var parsedArgs = parser.parse(args);
  if (parsedArgs['help'] == true ||
      parsedArgs['input'] == null ||
      parsedArgs['output'] == null) {
    print(parser.usage);
    return;
  }
  var inputFile = File(parsedArgs['input']);
  var outputFile = File(parsedArgs['output']);

  var data = await readCSV(inputFile);
  var transformedData = transformData(data);
  writeCSV(outputFile, transformedData);
}
