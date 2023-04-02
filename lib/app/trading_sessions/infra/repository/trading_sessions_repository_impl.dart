import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart'; 
import 'package:guidemobile/app/trading_sessions/domain/entities/trading_sessions_entity.dart';
import 'package:guidemobile/app/trading_sessions/infra/data/trading_sessions_data.dart';
import 'package:guidemobile/app/trading_sessions/infra/models/trading_sessions_model.dart';
import 'package:guidemobile/app/trading_sessions/domain/repositories/trading_sessions_repository.dart';
import 'package:guidemobile/shared/constants/endpoint.dart';
import 'package:guidemobile/shared/core/errors/failure.dart';

class TradingSessionsRepositoryImpl implements ITradingSessionsRepository {
  final ITradingSessionsData dataSource;

  TradingSessionsRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<TradingSessionsModel>>> getAllTraiding() async { 
    try {
      var list = await dataSource.getAllTraiding();
      return Right(list);
    } catch(e) {
      return Left(Failure(statusCode: e.hashCode, message: "Error trying to load list"));
    }
  }
}