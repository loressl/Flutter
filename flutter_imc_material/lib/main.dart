import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_imc_material/ui/android/material-app.dart';
import 'package:flutter_imc_material/ui/ios/cupertino-app.dart';

void main() =>
    Platform.isIOS ? runApp(MyCupertinoApp()) : runApp(MyMaterialApp());



