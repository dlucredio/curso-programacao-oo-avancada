abstract class Task {
  void run();
}

class SimpleTask1 implements Task {
  void run() {
    print("Running task 1...");
    print("Finished!");
  }
}

class SimpleTask2 implements Task {
  void run() {
    print("Running task 2...");
    print("Finished!");
  }
}

class InterruptableTask1 implements Task {
  bool interrupted;
  void run() {
    interrupted = false;
    while(!interrupted) {
      print("Running interruptable task 1");
    }
    print("Finished!");
  }

  void interrupt() {
    interrupted = true;
  }
}

class InterruptableTask2 implements Task {
  bool interrupted;
  void run() {
    interrupted = false;
    while(!interrupted) {
      print("Running interruptable task 2");
    }
    print("Finished!");
  }
  void interrupt() {
    interrupted = true;
  }  
}
