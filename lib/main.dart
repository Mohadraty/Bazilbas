import 'package:bazilbas/src/app_shared.dart';
import 'package:bazilbas/src/root_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppShared.init();

  runApp(const RootApp());
}
