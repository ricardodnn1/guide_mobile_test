import 'package:guidemobile/app/trading_sessions/domain/entities/trading_sessions_entity.dart';

class TradingSessionsModel extends TradingSessionsEntity {
    String? dataTrading;
    double? quotationValue;

    TradingSessionsModel({this.dataTrading, this.quotationValue});

    TradingSessionsModel.fromJson(Map<String, dynamic> json) {
        dataTrading = json['dataTrading'];
        quotationValue = json['quotationValue'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['dataTrading'] = dataTrading;
        data['quotationValue'] = quotationValue;
        return data;
    }
}