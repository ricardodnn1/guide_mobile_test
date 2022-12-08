import 'package:guidemobile/app/trading_sessions/domain/models/trading_sessions_model.dart';

abstract class ITradingSessionsRepository {
  Future<List<TradingSessionsModel>> getAllTraiding();
}