﻿
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidemobile/app/home/presenter/home_page.dart';
import 'package:guidemobile/app/trading_sessions/presenter/trading_chart_page.dart';
import 'package:guidemobile/app/trading_sessions/trading_sessions_bindings.dart';
import 'package:guidemobile/app/trading_sessions/presenter/trading_page.dart';

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
        ),
        GetPage(
          title: "Consulta do ativo PETR4",
          name: '/home',
          page: () => HomePage(),  
        ),
        GetPage(
          title: "Consulta do ativo PETR4",
          name: '/quote',
          page: () => TradingPage(),
          binding: TradingSessionsBindings(), 
        ),
        GetPage(
          title: "Consulta do ativo PETR4",
          name: '/quoteChart',
          page: () => TradingChartPage(),
          binding: TradingSessionsBindings(), 
        ),
      ],
    );
  }
}