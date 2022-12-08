
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidemobile/app/home/home_bindings.dart';
import 'package:guidemobile/app/home/presenter/home_page.dart';

class MainWidgetApp extends StatelessWidget {
  const MainWidgetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          title: "Consulta do ativo PETR4",
          name: '/',
          page: () => HomePage(),
          binding: HomeBindings(), 
        ),
        GetPage(
          title: "Consulta do ativo PETR4",
          name: '/home',
          page: () => HomePage(),
          binding: HomeBindings(), 
        ),
      ],
    );
  }
}