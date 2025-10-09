import 'package:athlink/shared/widgets/logo_label.dart';
import 'package:flutter/material.dart';

class LogoScreen extends StatelessWidget {
  static const String routeName = '/logo';

  const LogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LogoLabel(),
      ),
    );
  }
}
