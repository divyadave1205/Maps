// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class CircularCharts extends StatefulWidget {
  const CircularCharts({Key? key}) : super(key: key);

  @override
  _CircularChartsState createState() => _CircularChartsState();
}

class _CircularChartsState extends State<CircularCharts> {
  List<ChartData> chartData = [
    ChartData("David", 25, Colors.black),
    ChartData("Steeve", 38, Colors.black),
    ChartData("Jack", 34, Colors.black),
    ChartData("Others", 52, Colors.black),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Circular Charts",
        ),
      ),
      body: Center(
        child: Container(
          child: SfCircularChart(
            // ignore: prefer_const_literals_to_create_immutables
            palette: [
              Colors.red,
              Colors.yellow,
              Colors.blue,
              Colors.green,
            ],
            title: ChartTitle(text: "Half Yearly Sales Analysis"),
            legend: Legend(
              //it shows fields of chart.
              isVisible: true,
              alignment: ChartAlignment.center,
              backgroundColor: Colors.blue,
              borderWidth: 2,
              height: "100",
              iconBorderColor: Colors.white,
              iconBorderWidth: 2,
              isResponsive: true,
              position: LegendPosition.bottom,
              iconHeight: 10,
              opacity: 0.9,
              overflowMode: LegendItemOverflowMode.scroll,
              orientation: LegendItemOrientation.vertical,
            ),
            tooltipBehavior: TooltipBehavior(
              animationDuration: 20,
              enable: true,
            ),
            series: <CircularSeries>[
              PieSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
