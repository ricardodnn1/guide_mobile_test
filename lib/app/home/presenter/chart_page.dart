import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:guidemobile/app/home/domain/entities/trading_sessions_entity.dart';
import 'package:guidemobile/app/home/presenter/controller/home_controller.dart';
import 'package:intl/intl.dart';

class ChartPage extends GetView<HomeController> {
  List<Color> colors = [
    Color(0xFF3F51B5),
  ];
  
   
  List<FlSpot> dataChart = []; 
  List dataComplete = [];
  double maxX = 0;
  double maxY = 0;
  double minY = 0;
  late Map<String, String> loc;
  late NumberFormat real;
  ValueNotifier<bool> loaded = ValueNotifier(false);

  setDados() async {
    loaded.value = false;
    var list = await controller.getAllTradingDtChart();
    dataChart = [];

    dataComplete = list.reversed.map((e) {
        double quote = e.quotationValue ?? 0;
        return [quote, e.dataTrading];
    }).toList();

    maxX = dataComplete.length.toDouble();
    maxY = 0;
    minY = double.infinity;

    for (var item in dataComplete) {
      maxY = item[0] > maxY ? item[0] : maxY;
      minY = item[0] < minY ? item[0] : minY;
    }

    for (int i = 0; i < dataComplete.length; i++) {
      dataChart.add(FlSpot(
        i.toDouble(),
        dataComplete[i][0],
      ));
    }

    loaded.value = true;
  }

  LineChartData getChartData() {
    return LineChartData(
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: maxX,
      minY: minY,
      maxY: maxY,
      lineBarsData: [
        LineChartBarData(
          spots: dataChart,
          isCurved: true,
          color: Colors.amber,
          barWidth: 2,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true, 
          ),
        ),
      ],
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Color(0xFF343434),
          getTooltipItems: (data) {
            return data.map((item) {
              final date = getDate(item.spotIndex);
              return LineTooltipItem(
                real.format(item.y),
                TextStyle(
                  color: Colors.white,
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

   getDate(int index) {
    DateTime date = dataComplete[index][1];
    return DateFormat('dd/MM/y').format(date);
  }
 

  @override
  Widget build(BuildContext context) {
     
    
    //real = NumberFormat.currency(locale: loc['locale'], name: loc['name']);
    setDados();

    return controller.obx((state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Resultado da variação"),
        ),
        body: Container(
          child: AspectRatio(
            aspectRatio: 2,
            child: Stack(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [ 
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: ValueListenableBuilder(
                    valueListenable: loaded,
                    builder: (context, bool isLoaded, _) {
                      return (isLoaded)
                          ? LineChart(
                              getChartData(),
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
} 