import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/task/AdminPages/splashscreen.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
    debugShowCheckedModeBanner: false,
        home:SplashScreen());
  }
}

