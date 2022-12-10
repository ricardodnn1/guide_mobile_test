import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:guidemobile/app/trading_sessions/domain/entities/trading_sessions_entity.dart';
import 'package:guidemobile/app/trading_sessions/domain/repositories/trading_sessions_repository.dart';
import 'package:guidemobile/app/trading_sessions/domain/usecases/get_all_trading_usecase.dart';
import 'package:guidemobile/app/trading_sessions/infra/repository/trading_sessions_repository_impl.dart';
import 'package:guidemobile/shared/constants/endpoint.dart';
import 'package:intl/intl.dart';

class TradingController extends GetxController with StateMixin {

    final GetAllTradingUseCase getAllTradingUseCase;

    TradingController(this.getAllTradingUseCase);

    List<FlSpot> dataChart = []; 
    List dataComplete = [];
    double maxX = 0;
    double maxY = 0;
    double minY = 0;
    Map<String, String> locale = {
      'locale': 'pt_BR',
      'name': 'R\$',
    };
    
    late NumberFormat real;
    ValueNotifier<bool> loaded = ValueNotifier(false);

    @override
    void onInit() async {
      super.onInit();
      await getAllTrading();
    }

    Future<void> getAllTrading() async {
      change([], status: RxStatus.loading());
      try {
        var result = await getAllTradingUseCase();
        var data = [];  
        result.fold(
          (l) => print('Error!!!'),
          (r) {
            data = r;
            print(data);
          }  
        );
        change(data, status: RxStatus.success());
      } catch (e) {
        change([], status: RxStatus.error('Erro ao buscar cotação'));
      }
    }  

    List<Color> colors = [
    Color(0xFF3F51B5),
  ];
      
  setDados() async {
    loaded.value = false;
    var result = await getAllTradingUseCase();
    var list = [];  
    
    result.fold(
      (l) => print('Error'),
      (r) => list = r
    ); 

    dataChart = [];

    if(list.length > 0 && list.isNotEmpty) {
      dataComplete = list.reversed.map((e) {
          double quote = e.quotationValue ?? 0; 
          return [quote, DateTime.fromMillisecondsSinceEpoch(int.parse(e.dataTrading!) * 1000)];
      }).toList();

      maxX = dataComplete.length.toDouble();
      maxY = 0;
      minY = double.infinity;

      for (var item in dataComplete) {
        maxY = item[0] > maxY ? item[0] : maxY;
        minY = item[0] < minY ? item[0] : minY;
      }

      for (int i = 0; i < dataComplete.length; i++) {
        dataChart.add(FlSpot(
          i.toDouble(),
          dataComplete[i][0],
        ));
      }
    }

    if(dataComplete.length > 0) {
      loaded.value = true;
    }
  }

  getDate(int index) {
    DateTime date = dataComplete[index][1];
    return DateFormat('dd/MM/y').format(date);
  }
}