abstract class ReadOnlyBuffer {
    List<int> read(int offset, int amount);
}

abstract class ReadWriteBuffer extends ReadOnlyBuffer {
    void save(int offset, List<int> dataToSave);
}

class InMemoryReadOnlyBuffer implements ReadOnlyBuffer {
    List<int> read(int offset, int amount) {
      // Read from memory
    }
}

class InDiskReadOnlyBuffer implements ReadOnlyBuffer {
    List<int> read(int offset, int amount) {
      // Read from disk
    }
}

class InDiskReadWriteBuffer extends InDiskReadOnlyBuffer implements ReadWriteBuffer {
    void save(int offset, List<int> dataToSave) {
      // Save to disk
    }
}