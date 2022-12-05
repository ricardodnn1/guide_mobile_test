import 'package:guidemobile/app/home/domain/models/trading_sessions_model.dart';

abstract class ITradingSessionsRepository {
  Future<List<TradingSessionsModel>> getAllTraiding();
}