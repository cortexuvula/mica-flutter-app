import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:mica/src/mica_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  runApp(const MicaApp());
}
