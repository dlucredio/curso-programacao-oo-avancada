class HelloSubject {
  String _message;

  List<HelloObserver> _observers = [];

  void attach(HelloObserver observer) {
    _observers.add(observer);
  }

  void detach(HelloObserver observer) {
    _observers.remove(observer);
  }

  void _notifyObservers() {
    _observers.forEach((o) => o.update(this));
  }

  String get message => _message;
  set message(String message) {
    _message = message;
    _notifyObservers();
  }
}

abstract class HelloObserver {
  void update(HelloSubject subject);
}

class HelloObserverBW implements HelloObserver {
  @override
  void update(HelloSubject subject) {
    print(subject.message);
  }
}

class HelloObserverColor implements HelloObserver {
  @override
  void update(HelloSubject subject) {
    print("\u001B[32m${subject.message}\u001B[0m");
  }
}

abstract class HelloCommand {
  HelloSubject subject;
  String message;

  void execute();
}

class HelloWorldSingleMessageCommand extends HelloCommand {
  @override
  void execute() {
    subject.message = message;
  }
}

class HelloWorldMultipleMessagesCommand extends HelloCommand {
  int count;
  HelloWorldMultipleMessagesCommand(this.count);

  @override
  void execute() {
    for (var i = 1; i <= count; i++) {
      subject.message = "${i}: ${message}";
    }
  }
}

main() {
  var hello = HelloSubject();
  var colorObserver = HelloObserverColor();
  hello.attach(colorObserver);
  HelloCommand c = HelloWorldSingleMessageCommand();
  //HelloCommand c = HelloWorldMultipleMessagesCommand(5);
  c.subject = hello;
  c.message = "Hello World";
  c.execute();
}
