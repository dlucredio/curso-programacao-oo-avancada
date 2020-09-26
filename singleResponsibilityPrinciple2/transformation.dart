List<List<String>> transformData(List<List<String>> data) {
  var ret = List<List<String>>();
  for (var row in data) {
    if (row.length > 2) {
      ret.add([row[0], row[1], row[2]]);
    }
  }
  return ret;
}
