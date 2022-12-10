import 'package:guidemobile/app/trading_sessions/infra/models/trading_sessions_model.dart';

abstract class ITradingSessionsData {
  Future<List<TradingSessionsModel>> getAllTraiding();
}