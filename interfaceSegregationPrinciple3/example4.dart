enum TaskCompletion { ok, interrupted, timeout }

abstract class Task {
  bool interrupted;
  int timer;

  void run(int timeout) {
    interrupted = false;
    while(!interrupted && timer < timeout) {
      doTask();
      timer ++; // calculate actual time here!
    }
    var status = TaskCompletion.ok;
    if(interrupted) {
      status = TaskCompletion.interrupted;
    } else if(timer >= timeout) {
      status = TaskCompletion.timeout;
    }
    finishedTask(status);
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
  void finishedTask(TaskCompletion status);
}

class SimpleTask1 implements Task {
  void doTask() {
    print("Running task 1...");
  }
  void finishedTask(TaskCompletion status) {
    print("Finished!");
  }
}

class SimpleTask2 implements Task {
  void doTask() {
    print("Running task 2...");
  }
  void finishedTask(TaskCompletion status) {
    print("Finished!");
  }
}

class InterruptableTask1 implements Task {
  void doTask() {
    print("Running interruptable task 1");
  }
  void finishedTask(TaskCompletion status) {
    print("Finished!");
  }
}

class InterruptableTask2 implements Task {
  void doTask() {
    print("Running interruptable task 2");
  }
  void finishedTask(TaskCompletion status) {
    print("Finished!");
  }
}

class TimeOutTask1 implements Task {
  void doTask() {
    print("Running timeout task 1");
  }
  void finishedTask(TaskCompletion status) {
    if(status == TaskCompletion.timeout) {
      print("Timed out!");
    } else {
      print("Finished");
    }
  }
}
