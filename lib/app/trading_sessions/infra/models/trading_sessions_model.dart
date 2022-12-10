import 'package:guidemobile/app/trading_sessions/domain/entities/trading_sessions_entity.dart';

class TradingSessionsModel extends TradingSessionsEntity {
   
    const TradingSessionsModel({ required String dataTrading, required double quotationValue}) : super(dataTrading: dataTrading, quotationValue: quotationValue);

    static TradingSessionsModel fromMap(Map<String, dynamic> map) {
      return TradingSessionsModel(
        dataTrading: map['dataTrading'],
        quotationValue: map['quotationValue']
      );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['dataTrading'] = dataTrading;
        data['quotationValue'] = quotationValue;
        return data;
    }
}