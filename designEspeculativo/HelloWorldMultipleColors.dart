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

main() {
  var hello = HelloSubject();
  var bwObserver = HelloObserverBW();
  var colorObserver = HelloObserverColor();
  hello.attach(bwObserver);
  hello.message = "Hello World in black and white!";
  hello.detach(bwObserver);
  hello.attach(colorObserver);
  hello.message = "Hello World in color!";
}
