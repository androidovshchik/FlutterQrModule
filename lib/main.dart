import 'package:flutter/material.dart';
import 'package:flutter_module/camera.dart';
import 'package:flutter_module/preview.dart';

void main() => runApp(MaterialApp(
      title: 'Demo App',
      initialRoute: '/camera',
      routes: {
        '/camera': (context) => CameraScreen(),
        '/second': (context) => PreviewScreen(),
      },
    ));
