import 'dart:io';

import 'package:cozy/models/my_http_overrides.dart';
import 'package:cozy/pages/splash_page.dart';
import 'package:cozy/providers/detail_provider.dart';
import 'package:cozy/providers/space_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SpaceProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Cozy App',
        home: SplashPage(),
      ),
    );
  }
}
