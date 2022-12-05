import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:guidemobile/app/home/domain/entities/trading_sessions_entity.dart';
import 'package:guidemobile/app/home/domain/repository/trading_sessions_repository.dart';
import 'package:guidemobile/app/home/repository/remote/trading_sessions_repository_impl.dart';
import 'package:guidemobile/shared/constants/endpoint.dart';

class HomeController extends GetxController with StateMixin {

    final ITradingSessionsRepository _repository;
    bool loaded = false;

    HomeController(this._repository);

    @override
    void onInit() {
      super.onInit();
      getAllTrading();
    }

    Future<void> getAllTrading() async {
      change([], status: RxStatus.loading());
      try {
        final data = await _repository.getAllTraiding(); 
        change(data, status: RxStatus.success());
      } catch (e) {
        change([], status: RxStatus.error('Erro ao buscar cotação'));
      }
    }

    Future<List<TradingSessionsEntity>> getAllTradingDtChart() async {
      final data = await _repository.getAllTraiding();
      return data;
    }
}