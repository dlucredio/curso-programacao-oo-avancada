// This defines our type of event, to make sure
// all handlers will agree on the event data
typedef DomainEventHandler<T> = void Function(T t);

// This class stores handlers for events, allows handlers
// to be registered, and events to be fired. Whenever an
// event is fired, all handlers are invoked
class DomainEvents<T> {
  final _handlers = <DomainEventHandler<T>>[];
  void register(DomainEventHandler<T> handler) => _handlers.add(handler);
  void fire(T t) {
    _handlers.forEach((handler) => handler(t));
  }
}
