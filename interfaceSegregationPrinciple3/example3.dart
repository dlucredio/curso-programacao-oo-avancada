abstract class Task {
  bool interrupted;
  int timer;

  void run(int timeout) {
    interrupted = false;
    while(!interrupted && timer < timeout) {
      doTask();
      timer ++; // calculate actual time here!
    }
    finishedTask();
  }
  void run() {
    interrupted = false;
    while(!interrupted) {
      doTask();
    }
    finishedTask();
  }

  void interrupt() {
    interrupted = true;
  }
  void doTask();
  void finishedTask();
}

class SimpleTask1 implements Task {
  void doTask() {
    print("Running task 1...");
  }
  void finishedTask() {
    print("Finished!");
  }
}

class SimpleTask2 implements Task {
  void doTask() {
    print("Running task 2...");
  }
  void finishedTask() {
    print("Finished!");
  }
}

class InterruptableTask1 implements Task {
  void doTask() {
    print("Running interruptable task 1");
  }
  void finishedTask() {
    print("Finished!");
  }
}

class InterruptableTask2 implements Task {
  void doTask() {
    print("Running interruptable task 2");
  }
  void finishedTask() {
    print("Finished!");
  }
}

class TimeOutTask1 implements Task {
  void doTask() {
    print("Running timeout task 1");
  }
  void finishedTask() {
    print("Finished!"); // because of timeout or not?
  }
}
