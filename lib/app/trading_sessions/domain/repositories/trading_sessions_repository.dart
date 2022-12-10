import 'package:dartz/dartz.dart';
import 'package:guidemobile/app/trading_sessions/infra/models/trading_sessions_model.dart';
import 'package:guidemobile/shared/core/errors/failure.dart';

abstract class ITradingSessionsRepository {
  Future<Either<Failure, List<TradingSessionsModel>>> getAllTraiding();
}