import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:guidemobile/app/trading_sessions/domain/entities/trading_sessions_entity.dart';
import 'package:guidemobile/app/trading_sessions/presenter/controller/trading_controller.dart';
import 'package:intl/intl.dart';

class TradingChartPage extends GetView<TradingController> {
  LineChartData getChartData() {
    return LineChartData(
      gridData: FlGridData(show: true),
      titlesData: FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: controller.maxX,
      minY: controller.minY,
      maxY: controller.maxY,
      lineBarsData: [
        LineChartBarData(
          spots: controller.dataChart,
          isCurved: true,
          colors: controller.colors,
          barWidth: 1,
          dotData: FlDotData(show: true),
          belowBarData: BarAreaData(
            show: true,
            colors: controller.colors
                .map((color) => color.withOpacity(0.15))
                .toList(),
          ),
        ),
      ],
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Color(0xFF343434),
          getTooltipItems: (data) {
            return data.map((item) {
              final date = controller.getDate(item.spotIndex);
              return LineTooltipItem(
                controller.real.format(item.y),
                TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: '\n $date',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withOpacity(.5),
                    ),
                  ),
                ],
              );
            }).toList();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    controller.real = NumberFormat.currency(
        locale: controller.locale['locale'], name: controller.locale['name']);
    controller.setDados();

    return controller.obx(
      (state) {
        return Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text("Resultado da variação"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: size.height / 1.5,
                child: AspectRatio(
                  aspectRatio: 2,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: ValueListenableBuilder(
                          valueListenable: controller.loaded,
                          builder: (context, bool isLoaded, _) {
                            return (isLoaded)
                                ? LineChart(
                                    getChartData(),
                                  )
                                : const Center(
                                    child: CircularProgressIndicator(),
                                  );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
