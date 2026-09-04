/// Provides simple navigation helpers backed by a shared [navigator].
class SystemActionV2 {
  /// The navigator instance used to perform navigation actions.
  static dynamic navigator;

  /// Pops the current route from the navigation stack.
  static void pop() {
    navigator.pop();
  }

  /// Pushes [route] onto the navigation stack.
  static void push(dynamic route) {
    navigator.pushRoute(route);
  }
}
