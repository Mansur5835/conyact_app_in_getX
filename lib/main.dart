import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_app/pages/setting_page.dart';
import 'package:provider_app/services/bind.dart';
import 'package:provider_app/services/di.dart';
import 'pages/home.dart';

void main(List<String> args) async {
  await DI.init();
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Home(),
    );
  }
}
