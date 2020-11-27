class ReadOnlyBuffer {
    var data = List<int>();
    List<int> read(int offset, int amount) {
        var ret = List<int>();
        for(int i=0;i<amount;i++) {
            ret[i] = data[offset + i];
        }
        return ret;
    }
}

class ReadWriteBuffer extends ReadOnlyBuffer {
    void save(int offset, List<int> dataToSave) {
        for(int i=0;i<dataToSave.length;i++) {
            data[offset + i] = dataToSave[i];
        }
    }
}