import 'package:athlink/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    _setStatusBar();
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _setStatusBar();
  }

  void _setStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.black,
        statusBarBrightness: Brightness.light,
      ),
    );
  }
}
