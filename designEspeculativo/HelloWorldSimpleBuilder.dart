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

class HelloWorld {
  String _message;
  HelloSubject _subject;
  List<HelloObserver> _observers = [];
  List<HelloCommand> _commands = [];

  void go() {
    _commands.forEach((c) => c.execute());
  }
}

class HelloWorldBuilder {
  HelloWorld h = HelloWorld();

  HelloWorldBuilder setMessage(String message) {
    h._message = message;
    return this;
  }

  HelloWorldBuilder setSubject(HelloSubject subject) {
    h._subject = subject;
    return this;
  }

  HelloWorldBuilder addObserver(HelloObserver observer) {
    h._observers.add(observer);
    return this;
  }

  HelloWorldBuilder addCommand(HelloCommand command) {
    h._commands.add(command);
    return this;
  }

  HelloWorld build() {
    for (HelloObserver observer in h._observers) {
      h._subject.attach(observer);
    }
    for (HelloCommand command in h._commands) {
      command.subject = h._subject;
      command.message = h._message;
    }
    return h;
  }
}

main() {
  HelloWorld hello = HelloWorldBuilder()
      .setMessage("Hello world")
      .setSubject(HelloSubject())
      .addObserver(HelloObserverBW())
      .addObserver(HelloObserverColor())
      .addCommand(HelloWorldSingleMessageCommand())
      .addCommand(HelloWorldMultipleMessagesCommand(5))
      .build();
  hello.go();
}
