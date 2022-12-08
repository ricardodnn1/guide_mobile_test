import 'package:flutter/material.dart'; 
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guidemobile/app/trading_sessions/domain/models/trading_sessions_model.dart';
import 'package:guidemobile/app/trading_sessions/presenter/trading_chart_page.dart';
import 'package:guidemobile/app/trading_sessions/presenter/controller/trading_controller.dart';
import 'package:guidemobile/shared/utils/extensions.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:intl/intl.dart';

class TradingQuotePage extends GetView<TradingController> {
   @override
   Widget build(BuildContext context) { 
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Consulta do ativo PETR4'),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        height: 80,
        child: Center(
           child: ElevatedButton(
             style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red
             ),
             onPressed: () {
                Get.to(
                  TradingChartPage(),
                  fullscreenDialog: true
                );
             },
             child: const Padding(
               padding: EdgeInsets.all(8.0),
               child: Text("Visualizar Gráfico"),
             ),
           ),
        ),
      ),
      body: controller.obx((state) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: state.length,
            itemBuilder: (_, index) {
              final TradingSessionsModel item = state[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: ListTile(
                  title: Text(DateFormat('dd/MM/yyyy').format(DateTime.parse(item.dataTrading!.parseDateTime())), style: GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black)),
                  subtitle: Text('Cotação: ${item.quotationValue!.toStringAsFixed(4)}', style: GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black)),
                ),
              );
            },
          ),
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