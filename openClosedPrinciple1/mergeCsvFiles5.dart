import 'package:args/args.dart';
import 'dart:convert';
import 'dart:io';

class MergeArgs {
  ArgResults _parsedArgs;
  MergeArgs(this._parsedArgs);

  get input1 => _parsedArgs['input1'];
  get column1 => _parsedArgs['column1'];
  get input2 => _parsedArgs['input2'];
  get column2 => _parsedArgs['column2'];
  get output => _parsedArgs['output'];
  get separator => _parsedArgs['separator'];
  get hasHeaderRow => _parsedArgs['hasHeaderRow'];

  static MergeArgs parseArgs(List<String> args) {
    var parser = ArgParser();
    parser.addFlag("help",
        abbr: "h", defaultsTo: false, help: "Displays this help message");
    parser.addOption("input1", help: "The input CSV file #1");
    parser.addOption("column1", help: "The column number of the CSV file #1");
    parser.addOption("input2", help: "The input CSV file #2");
    parser.addOption("column2", help: "The column number of the CSV file #2");
    parser.addOption("output", abbr: "o", help: "The output CSV file");
    parser.addOption("separator",
        abbr: "s",
        defaultsTo: ";",
        help: "The separator used in the CSV files (defaults to ';')");
    parser.addFlag("hasHeaderRow",
        defaultsTo: false,
        help: "Indicates if the csv files have a header row");
    var parsedArgs = parser.parse(args);
    if (parsedArgs['help'] == true ||
        parsedArgs['input1'] == null ||
        parsedArgs['column1'] == null ||
        parsedArgs['input2'] == null ||
        parsedArgs['column2'] == null ||
        parsedArgs['output'] == null) {
      print(parser.usage);
      return null;
    }
    return MergeArgs(parsedArgs);
  }
}

class CsvUtils {
  String separator;
  CsvUtils(this.separator);

  Future<List<List<String>>> readCSV(String file) async {
    var inputFile = File(file);
    var fileContents1 = await inputFile.readAsLines(encoding: utf8);
    var ret = List<List<String>>();
    for (var line in fileContents1) {
      ret.add(line.split(separator));
    }
    return ret;
  }

  Future<void> writeCSV(String file, List<List<String>> data) async {
    var outputFile = File(file);
    var sink = outputFile.openWrite();
    for (var dataRow in data) {
      sink.writeAll(dataRow, separator);
      sink.write("\n");
    }
    await sink.flush();
    await sink.close();
  }
}

main(List<String> args) async {
  // Parse CLI args
  var parsedArgs = MergeArgs.parseArgs(args);
  if (parsedArgs == null) {
    return;
  }

  // Initialize CSV Utils
  var csvUtils = CsvUtils(parsedArgs.separator);
  // Read input file 1
  var data1 = await csvUtils.readCSV(parsedArgs.input1);
  // Read input file 2
  var data2 = await csvUtils.readCSV(parsedArgs.input2);

  // Merge input files
  int column1 = int.parse(parsedArgs.column1);
  int column2 = int.parse(parsedArgs.column2);
  var mergedList = List<List<String>>();
  if (parsedArgs.hasHeaderRow) {
    mergedList.add([...data1[0], ...data2[0]]);
  }
  for (var line1 in data1) {
    for (var line2 in data2) {
      if (line1[column1] == line2[column2]) {
        mergedList.add([...line1, ...line2]);
      }
    }
  }
  // Write output file
  await csvUtils.writeCSV(parsedArgs.output, mergedList);
}
