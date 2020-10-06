import 'dart:convert';
import 'dart:io';

class MergeArgs {
  List<String> _args;
  MergeArgs(this._args);

  get input1 => _args[0];
  get input2 => _args[1];
  get column1 => _args[2];
  get column2 => _args[3];
  get output => _args[4];
  get separator => _args[5];
  get hasHeaderRow => _args[6];

  static MergeArgs parseArgs(List<String> args) {
    if (args.length < 7) {
      print("Insufficient args");
      return null;
    }
    return MergeArgs(args);
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
