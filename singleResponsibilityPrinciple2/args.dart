import 'package:args/args.dart';

ArgResults parseArguments(List<String> args) {
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
    return null;
  }
  return parsedArgs;
}
