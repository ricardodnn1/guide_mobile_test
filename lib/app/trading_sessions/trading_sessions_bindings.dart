import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:guidemobile/app/trading_sessions/domain/repositories/trading_sessions_repository.dart';
import 'package:guidemobile/app/trading_sessions/domain/usecases/get_all_trading_usecase.dart';
import 'package:guidemobile/app/trading_sessions/external/data/trading_sessions_data_impl.dart';
import 'package:guidemobile/app/trading_sessions/infra/data/trading_sessions_data.dart';
import 'package:guidemobile/app/trading_sessions/presenter/controller/trading_controller.dart';
import 'package:guidemobile/app/trading_sessions/infra/repository/trading_sessions_repository_impl.dart';
import 'package:guidemobile/shared/data/rest_client.dart'; 

class TradingSessionsBindings implements Bindings {
  
  @override
  void dependencies() {
    Get.put(RestClient());
    Get.put(Dio());
    Get.put<ITradingSessionsData>(TradingSessionsDataImpl(Get.find()));
    Get.put<ITradingSessionsRepository>(TradingSessionsRepositoryImpl(Get.find()));
    Get.put(TradingSessionsRepositoryImpl(Get.find()));  
    Get.put(GetAllTradingUseCase(Get.find()));   
    Get.put(TradingController(Get.find()));   
  } 
}