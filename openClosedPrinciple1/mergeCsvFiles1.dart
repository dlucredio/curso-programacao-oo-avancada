import 'dart:convert';
import 'dart:io';

main(List<String> args) async {
  // Read input file 1
  var inputFile1 = File(args[0]);
  var fileContents1 = await inputFile1.readAsLines(encoding: utf8);
  var data1 = List<List<String>>();
  for (var line in fileContents1) {
    data1.add(line.split(";"));
  }

  // Read input file 2
  var inputFile2 = File(args[1]);
  var fileContents2 = await inputFile2.readAsLines(encoding: utf8);
  var data2 = List<List<String>>();
  for (var line in fileContents2) {
    data2.add(line.split(";"));
  }

  // Merge input files
  int column1 = int.parse(args[2]);
  int column2 = int.parse(args[3]);
  var mergedFileContents = List<List<String>>();
  mergedFileContents.add([...data1[0], ...data2[0]]);
  for (var line1 in data1) {
    for (var line2 in data2) {
      if (line1[column1] == line2[column2]) {
        mergedFileContents.add([...line1, ...line2]);
      }
    }
  }

  // Write output file
  var outputFile = File(args[4]);
  var sink = outputFile.openWrite();
  for (var line in mergedFileContents) {
    sink.writeAll(line, ";");
    sink.write("\n");
  }
  await sink.flush();
  await sink.close();
}
