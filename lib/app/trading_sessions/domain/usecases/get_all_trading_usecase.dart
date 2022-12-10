import 'package:dartz/dartz.dart';
import 'package:guidemobile/app/trading_sessions/domain/repositories/trading_sessions_repository.dart';
import 'package:guidemobile/app/trading_sessions/infra/models/trading_sessions_model.dart';
import 'package:guidemobile/shared/core/errors/failure.dart';

abstract class IGetAllTradingUseCase {
  Future<Either<Failure, List<TradingSessionsModel>>> call();
}

class GetAllTradingUseCase implements IGetAllTradingUseCase {

  final ITradingSessionsRepository repository;

  GetAllTradingUseCase(this.repository);

  Future<Either<Failure, List<TradingSessionsModel>>> call() async {
    var result = await repository.getAllTraiding();
    return result;
  }  
}