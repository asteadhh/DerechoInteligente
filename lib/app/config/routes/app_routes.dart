part of 'app_pages.dart';

/// used to switch pages
class Routes {
  static const dashboard = _Paths.dashboard;
  static const first = _Paths.first;
}

/// contains a list of route names.
// made separately to make it easier to manage route naming
class _Paths {
  static const first = '/first';
  static const dashboard = '/dashboard';

  // Example :
  // static const index = '/';
  // static const splash = '/splash';
  // static const product = '/product';
}
