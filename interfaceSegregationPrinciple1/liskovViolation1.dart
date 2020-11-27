class Buffer {
    var data = List<int>();
    void save(int offset, List<int> dataToSave) {
        for(int i=0;i<dataToSave.length;i++) {
            data[offset + i] = dataToSave[i];
        }
    }

    List<int> read(int offset, int amount) {
        var ret = List<int>();

        for(int i=0;i<amount;i++) {
            ret[i] = data[offset + i];
        }

        return ret;
    }
}

class ReadOnlyBuffer extends Buffer {
  void save(int offset, List<int> dataToSave) {
    // shhh! Don't tell anyone about this!!!
    // ;)
  }
}