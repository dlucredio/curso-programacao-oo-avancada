import 'dart:convert';
import 'dart:io';

Future<List<List<String>>> readCSV(String file) async {
  var inputFile = File(file);
  var fileContents1 = await inputFile.readAsLines(encoding: utf8);
  var ret = List<List<String>>();
  for (var line in fileContents1) {
    ret.add(line.split(";"));
  }
  return ret;
}

List<List<String>> mergeLists(List<List<String>> list1,
    List<List<String>> list2, int column1, int column2) {
  var mergedList = List<List<String>>();
  mergedList.add([...list1[0], ...list2[0]]);
  for (var line1 in list1) {
    for (var line2 in list2) {
      if (line1[column1] == line2[column2]) {
        mergedList.add([...line1, ...line2]);
      }
    }
  }
  return mergedList;
}

Future<void> writeCSV(String file, List<List<String>> data) async {
  var outputFile = File(file);
  var sink = outputFile.openWrite();
  for (var dataRow in data) {
    sink.writeAll(dataRow, ";");
    sink.write("\n");
  }
  await sink.flush();
  await sink.close();
}

main(List<String> args) async {
  // Read input file 1
  var data1 = await readCSV(args[0]);
  // Read input file 2
  var data2 = await readCSV(args[1]);

  // Merge input files
  int column1 = int.parse(args[2]);
  int column2 = int.parse(args[3]);
  var mergedFileContents = mergeLists(data1, data2, column1, column2);

  // Write output file
  await writeCSV(args[4], mergedFileContents);
}
