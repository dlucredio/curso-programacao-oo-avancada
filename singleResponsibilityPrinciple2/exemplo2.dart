import 'dart:io';
import 'args.dart';
import 'csv.dart';
import 'transformation.dart';

main(List<String> args) async {
  var parsedArgs = parseArguments(args);
  if (parsedArgs != null) {
    var inputFile = File(parsedArgs['input']);
    var outputFile = File(parsedArgs['output']);

    var data = await readCSV(inputFile);
    var transformedData = transformData(data);
    writeCSV(outputFile, transformedData);
  }
}
