import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:guidemobile/app/trading_sessions/domain/repository/trading_sessions_repository.dart';
import 'package:guidemobile/app/trading_sessions/presenter/controller/trading_controller.dart';
import 'package:guidemobile/app/trading_sessions/repository/remote/trading_sessions_repository_impl.dart';
import 'package:guidemobile/shared/data/rest_client.dart'; 

class TradingSessionsBindings implements Bindings {
  
  @override
  void dependencies() {
    Get.put(RestClient());
    Get.put(Dio());
    Get.put<ITradingSessionsRepository>(TradingSessionsRepositoryImpl(Get.find()));
    Get.put(TradingSessionsRepositoryImpl(Get.find()));  
    Get.put(TradingController(Get.find()));
  } 
}