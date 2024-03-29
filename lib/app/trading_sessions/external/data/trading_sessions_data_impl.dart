﻿import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:guidemobile/app/trading_sessions/infra/data/trading_sessions_data.dart';
import 'package:guidemobile/app/trading_sessions/infra/models/trading_sessions_model.dart';
import 'package:guidemobile/shared/constants/endpoint.dart';

class TradingSessionsDataImpl implements ITradingSessionsData {
  
  final Dio _dio;

  TradingSessionsDataImpl(this._dio);
 
  @override
  Future<List<TradingSessionsModel>> getAllTraiding() async {
      try {
          Response response;
          List<TradingSessionsModel> listTradingSessions = [];
          response = await _dio.get(endpoint,
            options: Options(
                responseType: ResponseType.json,
            ),
          );

         if(response.statusCode == 200) {
          var timestamp = jsonDecode(response.data["chart"]["result"][0]["timestamp"].toString());
          var indicatorsOpen = jsonDecode(response.data["chart"]["result"][0]["indicators"]["quote"][0]["open"].toString());

          for(var i = 0;i <= 30; i++) {
              listTradingSessions.add(TradingSessionsModel(dataTrading: timestamp[i].toString(), quotationValue: indicatorsOpen[i]));
          } 
        }  

        return listTradingSessions;
      } catch (e) {
        return [];
      }
  }

}