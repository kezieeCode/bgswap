import 'package:flutter/widgets.dart';

/// Centralized route names for the application.
class AppRoutes {
  static const String explorer = '/explorer';
  static const String bridges = '/bridges';
  static const String network = '/network';
}

/// Returns the current route name from the context, or null if unavailable.
String? getCurrentRouteName(BuildContext context) {
  final modal = ModalRoute.of(context);
  return modal?.settings.name;
}


