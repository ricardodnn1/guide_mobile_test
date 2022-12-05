import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidemobile/app/home/domain/models/trading_sessions_model.dart';
import 'package:guidemobile/app/home/presenter/controller/home_controller.dart';
import 'package:guidemobile/shared/utils/extensions.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:intl/intl.dart';

class HomePage extends GetView<HomeController> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Consulta do ativo PETR4'),
      ),
      bottomNavigationBar: Container(
        color: Colors.green,
        height: 80,
        child: Center(
           child: ElevatedButton(
             style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black38
             ),
             onPressed: () {},
             child: const Padding(
               padding: EdgeInsets.all(8.0),
               child: Text("Visualizar Gráfico"),
             ),
           ),
        ),
      ),
      body: controller.obx((state) {
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (_, index) {
            final TradingSessionsModel item = state[index];
            return ListTile(
              title: Text(DateFormat('dd/MM/yyyy').format(DateTime.parse(item.dataTrading!.parseDateTime()))),
              subtitle: Text('Cotação: ${item.quotationValue!.toStringAsFixed(4)}'),
            );
          },
        );
      }, onError: (error) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => controller.getAllTrading(),
                child: const Text('Tentar novamente'),
              )
            ],
          ),
        );
      }),
    );
  }
}