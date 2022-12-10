import 'package:equatable/equatable.dart';

class TradingSessionsEntity extends Equatable {
    final String dataTrading;
    final double quotationValue;

    const TradingSessionsEntity({required this.dataTrading, required this.quotationValue});
    
      @override 
      List<Object?> get props => [dataTrading, quotationValue];


}